/**
 * @file Detect images pasted from MS Word as file://
 *		 Version 1.1.2
 * Copyright (C) 2014-2016 Uritec SL
 *
 */
 /* globals CKEDITOR */

(function() {
	'use strict';

	CKEDITOR.plugins.add( 'imagesfromword', {
		requires : [ 'dialog', 'filebrowser' ],

		lang : 'en,es',

		init : function( editor ) {

			if (!editor.plugins.simpleuploads || (CKEDITOR.env.ie && CKEDITOR.env.version < 11) ) { // eslint-disable-line no-extra-parens
				CKEDITOR.dialog.add( 'legacypaste', this.path + 'dialogs/legacypaste.js' );
				editor.addCommand( 'imagesfromword', new CKEDITOR.dialogCommand( 'legacypaste' ) );
			} else {
				CKEDITOR.dialog.add( 'imagesfromword', this.path + 'dialogs/imagesfromword.js' );
				editor.addCommand( 'imagesfromword', new CKEDITOR.dialogCommand( 'imagesfromword' ) );
			}

			this.queue = [];

			editor.on( 'paste', function( e ) {
				var pasteData = e.data,
					html = pasteData.html || ( pasteData.type && pasteData.type == 'html' && pasteData.dataValue ); // eslint-disable-line no-extra-parens

				if (!html)
					return;

				// Detect local paths:
				var regexpFiles = /src\s*=\s*("|')file:\/+(.*?)\1/g,
					result,
					queue = e.editor.plugins.imagesfromword.queue;

				while ( (result = regexpFiles.exec( html )) ) { // eslint-disable-line no-extra-parens
					var exists = false,
						path = result[ 2 ];
					for (var i = 0; i < queue.length; i++) {
						if (queue[ i ].path == path)
							exists = true;
					}
					if (!exists)
						queue.push( { path: path } );
				}
			});

			editor.on( 'afterPaste', function(e) {
				var requested = e.editor.plugins.imagesfromword.queue;
				if (!requested.length)
					return;

				var queue = [],
					imgs = editor.editable().$.getElementsByTagName( 'img' );

				// Validate that they exist in the content
				// (they might have been cleaned up by another plugin or be part of a comment)
				/*
				for (var i = 0; i < requested.length; i++) {
					var obj = requested[i],
						path = obj.path;

					for (var j = 0; j < imgs.length; j++) {
						var theImage = imgs[j];
						if ( theImage.getAttribute('data-cke-saved-src') == 'file:///' + path ||
							theImage.getAttribute('src') == 'file:///' + path ) {
							valid.push(obj);
						}
					}
				}
				*/
				for (var j = 0; j < imgs.length; j++) {
					var theImage = imgs[j],
						src =  theImage.getAttribute('data-cke-saved-src') || theImage.getAttribute('src');
					if ( src && src.length > 8 && src.substr(0, 8) == 'file:///' ) {
						var exists = false,
							path = src.substr(8);
						for (var i = 0; i < queue.length; i++) {
							if (queue[ i ].path == path)
								exists = true;
						}
						if (!exists)
							queue.push( { path: path } );

					}
				}

				e.editor.plugins.imagesfromword.queue = queue;
				if (e.editor.plugins.imagesfromword.queue.length > 0) {
					editor.execCommand('imagesfromword');
				}
			});

		}, //Init

		afterInit: function( editor ) {
			if (!editor.config.filebrowserImagesfromwordUploadUrl)
				editor.config.filebrowserImagesfromwordUploadUrl = editor.config.filebrowserImageUploadUrl;
		}
	} );

})();