jQuery(document).ready(function () {
    $(document).on('click', '.Button_Upload_files', function () {
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
                url: "../../Components/FileBank/File_Uploader.ashx",
                type: "POST",
                data: data,
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result);
                    $("#btn_Refresh").click();
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }
    });
    $(document).on('click', '.file_thumb', function (e) {
        e.preventDefault();
        var path = $(this).data('path');
        prompt('Copy file path from below text box', path);
    });
});