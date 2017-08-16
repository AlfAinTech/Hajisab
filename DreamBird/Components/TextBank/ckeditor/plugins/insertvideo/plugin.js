CKEDITOR.plugins.add( 'insertvideo', {
    icons: 'insertvideo',
    init: function( editor ) {
         editor.addCommand( 'insertHTML5Video', new CKEDITOR.dialogCommand( 'videoDialog' ) );
        editor.ui.addButton( 'InsertVideo', {
            label: 'Insert Video Element',
            command: 'insertHTML5Video',
            toolbar: 'insert'
        });
        CKEDITOR.dialog.add( 'videoDialog', this.path + 'dialogs/insertvideo.js' );
    }
});
