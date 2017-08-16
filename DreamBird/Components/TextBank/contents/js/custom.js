 //editorID should be popuplate from  user control

function setValue(txtEditorClientID, HiddenClientID) {
    // $("#txtEditorHidden").val(CKEDITOR.instances.tBody.getData());
    data = CKEDITOR.instances[txtEditorClientID].getData();
      $(HiddenClientID).val(data);

     

}
// Replace the <textarea id="editor1"> with a CKEditor
// instance, using default configuration.
function enableCKEditor() {
   // alert("Before " + editorID);


    $('.textEditor').each(function (index) {
        editorID = $(this).attr("clientID");
       if (CKEDITOR.instances[editorID]!=null) {
            CKEDITOR.instances[editorID].destroy()
        }
            CKEDITOR.replace(editorID);
        
       
    });
    
   // alert("After " + editorID);
    /*

  var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function (s, e) {
    enableCKEditor();
});
    */
}

