jQuery(document).ready(function ($) {
    $('#myModal').on('show.bs.modal', function () {
        var recipient = $('#Transcript_button').attr("data-mediaid") // Extract info from data-* attributes
        $('#Video_Transcript').attr("src", $('#video_media').attr("src"));
        $("#jsGrid").jsGrid("loadData", { Id: recipient });
    });
    CallMediaFetcher("0", "1");
    //CallExternalMediaFetcher("1");
    $(document).on('change', 'input[type="radio"]', function (e) {
        var Text = $(this).parent().children('label').text();
        $('#new_group_name').val(Text);
        //$('#new_group_name').attr("disabled", "");
    });
    $("div#file_upload").dropzone({ url: "../../Components/MediaBank/Content/UploadHandler.ashx", success: function () { alert("Uploaded"); CallMediaFetcher("0", "1"); } });
    $('#pagination').twbsPagination();
    $body = $("body");
    $(document).on({
        ajaxStart: function () { $("#MediaBankBody").addClass("modal fade in"); },
        ajaxStop: function () { $("#MediaBankBody").removeClass("modal fade in"); }
    });
    $(document).on('click', '.ClearGroup', function () {
        $('#group_items_ids').val("");
        $('#add_group_items').html("");
        $('#new_group_name').val("")
    });
    $(document).on('input', '#ddl_media_cat', function () {
        var Cat_value = $('#ddl_media_cat').val();
        CallMediaFetcher(Cat_value, "1");
    });
    $('#InsertMedia_Main').on('shown.bs.tab', function (e) {
        $('.active').each(function () {
            $(this).removeClass("active");
        });
        $(this).parent().addClass("active");
        $('#InsertMedia').addClass("active");
        $('#General_Filter').css("display", "block");
        $('#group_media_list').css("display", "none");
        $('#Group_Block').css("display", "none");
        CallMediaFetcher("0", "1");
    });
    $('#view_group').on('shown.bs.tab', function (e) {
        $('.active').each(function () {
            $(this).removeClass("active");
        });
        $(this).parent().addClass("active");
        $('#InsertMedia').addClass("active");
        $('#General_Filter').css("display", "none");
        $('#group_media_list').css("display", "block");
        //$('#GroupMediaItems').css("display", "block");
        $('#Group_Block').css("display", "none");
        var Cat_value = $('#ddl_media_cat').val();
        CallMediaFetcher(Cat_value, "1");
    });
    $(document).on('click', "#GroupMedia", function (e) {
        e.preventDefault();
        $('#edit_block').css("display", "none");
        //$('#GroupMediaItems').css("display", "block");
        $('#Group_Block').css("display", "block");
        $('#select_media').css("display", "none");
    });
    $(document).on('input', '.filter_media', function (e) {
        if ($('#General_Filter').css("display") == "block") {
            CallMediaFetcher("0", "1");
        }
        else {
            var MediaCat = $('#ddl_media_cat').val();
            CallMediaFetcher(MediaCat, "1");
        }
    });
    //$(document).on('input', '.Efilter_media', function (e) {
    //        CallExternalMediaFetcher("1");
    //});
    //$(document).on('click', '.EMediaItem', function (e) {
    //    var MediaItemID = $(this).children("img").attr("id");
    //    var Source = $(this).children("img").attr("src");
    //    var Type = $(this).attr("data-type");
    //    $('#EMediaURL').val(Source);
    //    if (Type == "Image") {
    //        $('#Eedit_block').css("display", "block");
    //        $('#Ethumb_media').attr("src", Source).css("display", "block");
    //    }
    //    else {

    //    }
    //});
    $(document).on('click', '.MediaItem', function (e) {
        var MediaItemID = $(this).children("img").attr("id");
        var ImgSource = $(this).children("img").attr("src");
        if ($('#Group_Block').css("display") == "block") {
            if ($('img[data-mid="' + MediaItemID + '"]').length == 0) {
                $('#add_group_items').append("<div class='col-md-2'><div class='row'><img data-mid='" + MediaItemID + "' src='" + ImgSource + "' width='100%' /></div></div>");
                if ($('#group_items_ids').val() == "") {
                    $('#group_items_ids').val(MediaItemID);
                }
                else {
                    $('#group_items_ids').val($('#group_items_ids').val() + "|" + MediaItemID);
                }
            }
            $('#GroupMediaItems').css("display", "block");
        }
        else {
            $.ajax({
                url: MediaItemBaseURL + MediaItemID,
                type: "POST",
                contentType: false,
                processData: false,
                success: function (result) {
                    RenderMediaItem(result);
                },
                error: function (err) {
                    alert(err.statusText)
                },

            });
        }

    });
});


function CallExternalMediaFetcher(startPage) {
    var MediaType = $("#Eddl_mediaType").val();
    var DateAdded = $("#Edate_added").val();
    var MediaName = $('#Esearch_media').val();

    $.ajax({
        url: "../../Components/MediaBank/Content/RenderExternalMedia.ashx?Start=" + startPage + "&&MediaType=" + MediaType + "&&DateAdded=" + DateAdded + "&&Name=" + MediaName,
        type: "POST",
        contentType: false,
        processData: false,
        success: function (result) {
            RenderExternalMedia(result);
        },
        error: function (err) {
            alert(err.statusText)
        }
    });
}

function CallMediaFetcher(value, startPage) {
    var MediaType = $("#ddl_mediaType").val();
    var DateAdded = $("#date_added").val();
    var MediaName = $('#search_media').val();
    var renderURL  = RenderBaseURL + value + "&&Start=" + startPage + "&&MediaType=" + MediaType + "&&DateAdded=" + DateAdded + "&&Name=" + MediaName
    $.ajax({
        url: renderURL,
        type: "POST",
        contentType: false,
        processData: false,
        success: function (result) {
            RenderMedia(result);
        },
        error: function (err) {
            alert(err.statusText)
        }
    });
}

function RenderMedia(value) {
    var objs = jQuery.parseJSON(value);
    var obj = objs.Items;
    $('#media_grid').html("");
    $.each(obj, function (key, value) {
        var MediaItemId = value.MediaItemID;
        var Path = value.MediaPath;
        var MediaType = value.MediumType;
        if (MediaType == "External") {
            var StringToRender = "<div class='col-md-2' style='padding:15px;'><a class='MediaItem'><span class='glyphicon glyphicon-globe' style='position:absolute; bottom:0; left:10px; color:green;' aria-hidden='true'></span><img id='" + MediaItemId + "' src='" + Path + "' width='100%' /></a></div>";
            $('#media_grid').append(StringToRender);
        }
        else {
            var StringToRender = "<div class='col-md-2' style='padding:15px;'><a class='MediaItem'><img id='" + MediaItemId + "' src='" + Path + "' width='100%' /></a></div>";
            $('#media_grid').append(StringToRender);
        }

    });
    var totalPages = objs.TotalItems;
    if (totalPages == "0") {
        totalPages = "1";
    }
    var currentPage = $('#pagination').twbsPagination('getCurrentPage');
    $('#pagination').twbsPagination('destroy');
    $('#pagination').twbsPagination({
        totalPages: totalPages,
        startPage: currentPage,
        visiblePages: 5,
        initiateStartPageClick: false,
        onPageClick: function (event, page) {
            if ($('#General_Filter').css("display") == "block") {
                CallMediaFetcher("0", page);
            }
            else {
                var MediaCat = $('#ddl_media_cat').val();
                CallMediaFetcher(MediaCat, page);
            }

        }
    });
}

function RenderExternalMedia(value) {
    var objs = jQuery.parseJSON(value);
    var obj = objs.Items;
    $('#Emedia_grid').html("");
    $.each(obj, function (key, value) {
        var MediaItemId = value.MediaItemID;
        var Path = value.MediaPath;
        var Type = value.MediaType;
        var StringToRender = "<div class='col-md-2' style='padding:15px;'><a class='EMediaItem' data-type='" + Type + "'><img id='" + MediaItemId + "' src='" + Path + "' width='100%' /></a></div>";
        $('#Emedia_grid').append(StringToRender);
    });
    var totalPages = objs.TotalItems;
    if (totalPages == "0") {
        totalPages = "1";
    }
    var currentPage = $('#Epagination').twbsPagination('getCurrentPage');
    $('#Epagination').twbsPagination('destroy');
    $('#Epagination').twbsPagination({
        totalPages: totalPages,
        startPage: currentPage,
        visiblePages: 5,
        initiateStartPageClick: false,
        onPageClick: function (event, page) {
            CallExternalMediaFetcher(page);
        }
    });
}

function RenderMediaItem(value) {
    var Obj = jQuery.parseJSON(value);
    $('#MediaItemID').val(Obj.MediaItemID);
    if (Obj.Type == "Image") {
        $('#thumb_media').attr("src", Obj.Path).css("display", "block");
        $('#video_media').css("display", "none");
        $('#EVideo_Thumb').css("display", "none");
        $('#Transcript_button').css("display", "none");

    }
    else if (Obj.Type == "video") {
        if (Obj.MediumType == "External") {
            $('#thumb_media').css("display", "none");
            $('#video_media').css("display", "none");
            $('#EVideo_Thumb').attr("src", Obj.EmbedCode).css("display", "block");
            $('#Transcript_button').css("display", "none");

        }
        else {
            $('#video_media').attr("src", Obj.Path).css("display", "block");
            $('#thumb_media').css("display", "none");
            $('#EVideo_Thumb').css("display", "none");
            $('#Transcript_button').css("display", "block").attr("data-mediaid", Obj.MediaItemID);
        }

    }
    $('#MediaName').text(Obj.Name);
    $('#MediaResolution').text(Obj.Resolution);
    $('#MediaSize').text(Obj.Size);
    $('#MediaDateAdded').text(Obj.DateAdded);
    $('#MediaURL').val(Obj.Path);
    $('#edit_block').css("display", "block");
    $('#select_media').css("display", "block");
    $('#GroupMediaItems').css("display", "none");

} 
