jQuery(document).ready(function ($) {
    render_grid();
    $(document).ajaxSend(function () {
        $('#load_more').html("<img src='../../Content/img/ajax-loader.gif' /> Loading");
    })
    $(document).ajaxSuccess(function () {
        $('#load_more').html("Load More");
    });
    $(document).on('click', '#load_more', function (e) {
        e.preventDefault();
        render_grid();
    });
    $(document).on('click', '#search_dream', function (e) {
        e.preventDefault();
        var SearchKeyword = $('#SearchBox').val();
        $.ajax({
            url: "../../Components/Dreams/Content/SearchHandler.ashx?SearchKeyword=" + SearchKeyword,
            type: 'POST',
            success: function (result) {
                render_data(result, false);
            },
            error: function (err) {
                alert(err.statusText)
            }

        });

    });
    $(document).on('click', '#like_now', function (e) {
        var DreamID = $(this).data("dreamid");
        var img = $(this).children("img");
        var LikeStatus = img.data("status");
        $.ajax({
            url: "../../Components/Dreams/Content/GridPopulator.ashx?Status=" + LikeStatus + "&&Counter=0&&Mode=Like&&DID=" + DreamID,
            type: 'POST',
            success: function (result) {
                var res = result.split(">");
                if (res[0] == "Invalid") {
                    alert("User Must be logged in order to Like a dream");
                }
                else if (res[0] == "Yes") {
                    img.attr("src", "../../Content/img/Like-enabled.png");
                    img.data("status", "Enabled");
                    $('span[data-id=' + DreamID + ']').text(res[1]);

                }
                else if (res[0] == "No") {
                    img.attr("src", "../../Content/img/Like-disabled.png");
                    img.data("status", "Disabled");
                    $('span[data-id=' + DreamID + ']').text(res[1]);
                }
            },
            error: function (err) {
                alert(err.statusText)
            }
        });
    });
});

function render_grid() {
    var counter = $('#current_conter').val();
    $.ajax({
        url: "../../Components/Dreams/Content/GridPopulator.ashx?Mode=Render&&Counter=" + counter,
        type: 'POST',
        success: function (result) {
            render_data(result, true);
        },
        error: function (err) {
            alert(err.statusText)
        }

    });

    //$('#render_dream_list').append("<h3>There are no dreams to show right now  " + counter + "</h3>");
    counter++;
    $('#current_conter').val(counter);
}

function render_data(result, append) {
    var objs = jQuery.parseJSON(result);
    var obj = objs.item;
    var DisableButton = objs.DisableButton;
    if (!append) {
        $('#render_dream_list').html("");
    }
    $.each(obj, function (key, value) {
        var featured = "";
        var classs = "cs";
        var LikeStatus = "Disabled";
        var imgsrc = "../../Content/img/Like-disabled.png";
        if (value.isFeatured) {
            featured = "Featured";
            classs = "featured";
        }
        if (value.isLiked) {
            imgsrc = "../../Content/img/Like-enabled.png";
            LikeStatus = "Enabled";
        }
        var stringtorender = '<div class="col-md-3"><div class="content_item container_' + classs + '">' +
                                '<div class="cont_img_wrap">' +
                                '<div class="col-md-9" style="margin-right: auto; padding-left: 5; padding-right: 5px; margin-left: auto; float: none">' +
                                '<img src="' + value.MediaPath + '" style="width:100%" /></div></div>' +
                                '<div class="cont_label_' + classs + '"><h6 style="text-align:right; color:white; padding:3px; margin-top:0; padding-right:15px;">' + featured + '</h6> </div>' +
                                '<div class="content_pan">' +
                                '<div class="col-md-12" style="padding: 0; min-height: 135px;">' +
                                    '<h3>' + value.DreamName + '</h3>' +
                                    '<h5 style="text-align: justify;">' + value.DreamDescription + '</h5>' +
                                    '</div>' +
                                    '<div class="content_social_detail">' +
                                    '<div class="soc_det likes" style="text-align: left;"><span data-id="' + value.DreamID + '">' + value.Likes + '</span> Likes</div>' +
                                    '<div class="soc_det comments" style="text-align: right;"></div></div></div>' +
                                    '<div class="dream_footer">' +
                                    '<div style="width: 16%; float: left; margin-right: 38%;">' +
                                    '<a id="like_now" data-dreamid="' + value.DreamID + '"><img src="' + imgsrc + '" data-status="' + LikeStatus + '" style="width:100%; padding-right:10px; padding-left:10px; margin-left:10px;" /></a>' +
                                    '</div>' +
                                    '<div style="width: 46%; float: left;">' +
                                    '<button class="btn btn-default">View Detail</button></div></div></div></div>';
        if (append) {
            $('#render_dream_list').append(stringtorender);
        }
        else {
            $('#render_dream_list').append(stringtorender);
        }

        if (DisableButton) {
            $('#load_more').attr("disabled", "");
        }
    });

}