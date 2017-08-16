function AdjustImageSize(val1, val2) {
    var div = $('.previews');
    var width = div.parent().width();
    var height = div.parent().height();
    var width1 = width * (58 / 100);
    var image = div.children("img");
    var wh_ratio = val1 / val2;
    if (wh_ratio > 1) {
        image.width(width1 - 50);
    }
    else {
        image.height(height - 75);
    }

    image.css("display", "block");
    image.css("margin-left", "auto");
    image.css("margin-right", "auto");
    image.css("float", "none");
    //image.width(width1 - 30);
}
function UploaderFunction() {
    $('.Button_Upload').click(function () {
        var uploader = $(this).parent().children('input[type="file"]');
        var fileupload = uploader.get(0);
        var files = fileupload.files;
        if (files.length == 0) {
            alert("No File Selected!");
        }
        else {
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }

            $.ajax({
                url: "../../Components/MediaBank/Content/UploadHandler.ashx",
                type: "POST",
                data: data,
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result);
                    $(".refresh").click();
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }
    });
    $('.Button_Upload1').click(function () {
        var uploader = $(this).parent().children('input[type="file"]');
        var fileupload = uploader.get(0);
        var files = fileupload.files;
        if (files.length == 0) {
            alert("No File Selected!")
        }
        else {
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            var Quality = $(this).parent().children('select').val();

            $.ajax({
                url: "../../Components/MediaBank/Content/UploadHandler_480.ashx?video_quality=" + Quality,
                type: "POST",
                data: data,
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result);
                    $(".refresh").click();
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }
    });
}


function MyCode() {

    //$('a[href="#upload"], a[href="#home"], a[href="#videoTranscript"]').click(function () {
    //    $('.PreviewBlock').attr("style", "display:none;");
    //});
    //$('input[type="image"]').click(function () {
    //    $('.PreviewBlock').attr("style", "display:auto;");
    //});
}
function MyNewCode() {

}

function refreshFiels() {
    //$('.Textext').textext()[0]
    //     .bind('getSuggestions', function (e, data) {

    //         var list = testArray,
    //             textext = $(e.target).textext()[0],
    //             query = (data ? data.query : '') || ''
    //         ;

    //         $(this).trigger(
    //             'setSuggestions',
    //             { result: textext.itemManager().filter(list, query) }
    //         );
    //     });
    //$('.TextText').textext()[0]
    //     .bind('getSuggestions', function (e, data) {

    //         var list = testArray,
    //             textext = $(e.target).textext()[0],
    //             query = (data ? data.query : '') || ''
    //         ;

    //         $(this).trigger(
    //             'setSuggestions',
    //             { result: textext.itemManager().filter(list, query) }
    //         );
    //     });
}

function SelectToolbar() {
    //$('.active').each(function () {
    //    $(this).removeClass("active");
    //});
    //$('a[href="#videoTranscript"]').parent().addClass("active");
    //$('#videoTranscript').addClass("active");
}

function SelectToolbars() {
    //$('.active').each(function () {
    //    $(this).removeClass("active");
    //});
    //$('a[href="#home"]').parent().addClass("active");
    //$('#home').addClass("active");
}