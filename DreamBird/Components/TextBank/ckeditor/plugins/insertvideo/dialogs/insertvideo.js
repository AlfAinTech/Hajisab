CKEDITOR.dialog.add( 'videoDialog', function( editor ) {
  return {
    title: 'Add Video Through Server',
    minWidth: 400,
    minHeight: 200,
    contents: [
      {
        id: 'tab-basic',
        label: 'Basic Settings',
        elements: [
          {
            type: 'text',
            id: 'url',
            label: 'Video URL',
            validate: CKEDITOR.dialog.validate.notEmpty( "Path cannot be empty." )
          },
          {
            type : 'button',
            id : 'browse',
            label : 'Select Video from Server',
            filebrowser :
            {
                action : 'Browse',   // See Note 3
                url : '../../Components/MediaBank/VideoSelector.aspx',
            }
          }
        ]
      }
    ],
  onOk: function() {
      var dialog = this;

      var video = editor.document.createElement( 'video' );
      video.setAttribute( 'src', dialog.getValueOf( 'tab-basic', 'url' ) );
      video.setAttribute('controls', '');

      editor.insertElement( video );
    }
  };
});
