/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.fileUpload = false;
   // config.filebrowserUploadUrl = '/ImageSelector.aspx';
  //  config.filebrowserImageUploadUrl = '/ImageSelector.aspx';
  config.uploadUrl = '../../Components/FileBank/Inline_Uploader.ashx';
  config.filebrowserUploadUrl = '../../Components/FileBank/Inline_Uploader.ashx';
  config.filebrowserBrowseUrl = '/ImageSelector.aspx';
  config.filebrowserImageBrowseUrl = '/ImageSelector.aspx';
    config.filebrowserWindowWidth = 800;
    config.filebrowserWindowHeight = 500;
    config.allowedContent = true;
    config.autoParagraph = false;
    config.extraPlugins = 'widget';
    config.extraPlugins = 'lineutils';
    config.extraPlugins = 'dialog';
    config.extraPlugins = 'dialogui';
    config.extraPlugins = 'clipboard';
    config.extraPlugins = 'notificationaggregator';
    config.extraPlugins = 'filetools';
    config.extraPlugins = 'notification';
    config.extraPlugins = 'widgetselection';
    config.extraPlugins = 'eqneditor';
    config.extraPlugins = 'uploadimage';
    config.extraPlugins='simpleuploads,imagesfromword';
    config.extraPlugins = 'insertvideo';
    //config.extraPlugins = 'oembed';

    config.toolbar = [
      { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] },
      { name: 'editing', items: ['Scayt'] },
      { name: 'document', items: ['Source'] },
      { name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
      { name: 'insert', items: ['Image', 'Table', 'HorizontalRule', 'InsertVideo'] },
       { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'EqnEditor', 'Subscript', 'Superscript'] },
      { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-'] },
      { name: 'styles', items: ['Styles', 'Format'] },
      //{ name: 'about', items: ['About'] }
    ];

};

CKEDITOR.on( 'dialogDefinition', function( ev )
            {
              // Take the dialog name and its definition from the event data.
              var dialogName = ev.data.name;
              var dialogDefinition = ev.data.definition;

              // Check if the definition is from the dialog window you are interested in (the "Link" dialog window).
              if ( dialogName == 'link' )
              {
                // Get a reference to the "Link Advanced" tab.
                var advTab = dialogDefinition.getContents( 'advanced' );
                var cssField = advTab.get( 'advCSSClasses' );
                cssField['default'] = 'CustomLinks';

              }
            });
