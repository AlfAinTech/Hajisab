
$(document).on('click', '.assignment_uploader', function (e) {
    e.preventDefault();
    var aid = $(this).attr("aid");
    var controlid = $(this).attr("id");
    var uploader = $('#FileUpload_'+controlid);
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
            url: "../../Components/Assignments/Content/AssignmentFile_Uploader.ashx?AID="+aid,
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