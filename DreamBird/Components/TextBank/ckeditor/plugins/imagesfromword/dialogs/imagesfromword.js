/* globals CKEDITOR */
/*eslint space-in-parens: [2, "always"]*/

( function() {
	'use strict';

	function UploadedFile( editor, localPath, url ) {
		var imgs = editor.editable().$.getElementsByTagName( 'img' );
		for ( var i = 0; i < imgs.length; i++ ) {
			var theImage = imgs[i];
			if ( theImage.getAttribute( 'data-cke-saved-src' ) == 'file:///' + localPath ||
				theImage.getAttribute( 'src' ) == 'file:///' + localPath ) {

				theImage.setAttribute( 'data-cke-saved-src', url );
				theImage.setAttribute( 'src', url );

				if ( editor.widgets && editor.plugins.image2 ) {
					var widget = editor.widgets.getByElement( new CKEDITOR.dom.element( theImage ) );
					if ( widget )
						widget.data.src = url;
				}
			}
		}
	}

	CKEDITOR.dialog.add( 'imagesfromword', function( editor ) {
		var lang = editor.lang.imagesfromword,
			generalLabel = editor.lang.common.generalTab,
			theDialog,
			queue;

		// Autorename the images that come from Word to avoid overwritting previous one if the server doesn't do it.
		editor.on( 'simpleuploads.startUpload', function( ev ) {
			var currentDialog = CKEDITOR.dialog.getCurrent();
			if ( !currentDialog || currentDialog._.name != 'imagesfromword' )
				return;

			var filename = ev.data.name;
			var newName = CKEDITOR.plugins.simpleuploads.getTimeStampId() + '_' + filename;
			ev.data.name = newName;
		} );


		function updatePendingFiles() {
			var totalPaths;
			var text;
			if ( queue.length == 1 ) {
				totalPaths = queue[ 0 ].localPath;
				text = lang.simpleClickInstructionsOne;
			} else {
				// it could be possible to provide all the localPaths as quoted ones,
				// but if the total length is greater than 256 then it's truncated and the rest of the files are missing
				// so provide first the folder and then the quoted filenames
				var paths = [];
				for ( var i = 0; i < queue.length; i++ ) {
					paths.push( queue[ i ].name );
				}
				var folder = queue[ 0 ].localPath.substr( 0, queue[ 0 ].localPath.length - queue[ 0 ].name.length );
				//totalPaths = folder + ' "' + paths.join( '" "' ) + '"';
				// If total length > 256 then the filepicker won't add all the files and will alert an error with the paths, so let's do it little by little.
				var selectedCount = 0;
				totalPaths = folder;
				while ( selectedCount < queue.length && ( totalPaths + ' "' + queue[selectedCount].name + '"' ).length < 255 ) {
					totalPaths += ' "' + queue[selectedCount].name + '"';
					selectedCount += 1;
				}
				if ( selectedCount == queue.length ) {
					text = lang.simpleClickInstructions;
				} else {
					text = lang.simpleClickInstructionsPartial;
					text = text.replace( '%2', selectedCount );
				}
				text = text.replace( '%1', queue.length );
			}
			var input = theDialog.getContentElement( 'info', 'textToCopy' ).getInputElement().$;
			input.value = totalPaths;

			theDialog.getContentElement( 'info', 'instructions' ).getElement().$.innerHTML = text;

			setTimeout( function() {
				input.selectionStart = input.selectionEnd = 0;
			}, 50 );
		}

		// Copy to the clipboard the contents of the 'textToCopy' element
		function copyToClipboard( dialog ) {
			var el = dialog.getContentElement( 'info', 'textToCopy' ),
				input = el.getInputElement().$;

			// extra check to avoid double copying
			if ( !input.value )
				return;

			input.select();
			try {
				document.execCommand( 'copy' );
			} catch ( err ) {
				if ( window.console )
					console.log( 'Failed to copy', err ); // eslint-disable-line no-console
			}
		}

		return {
			title : lang.title,
			width : 300,
			height : 80,
			resizable : CKEDITOR.DIALOG_RESIZE_NONE,
			filebrowser : 'uploadButton',
			contents :
			[
				{
					id : 'info',
					label : generalLabel,
					title : generalLabel,
					elements :
					[
						{
							type: 'html',
							id: 'instructions',
							html : '<div> </div>'
						},
						{
							// Input to place the paths that we want to copy and import
							id : 'textToCopy',
							type : 'text',
							onLoad : function() {
								var input = this.getInputElement();

								// avoid any spellcheck squiggles
								input.setAttribute( 'spellcheck', 'false' );

								// On copy, fire the file picker
								input.on( 'copy', function() {
									// Chrome, Edge, Firefox: launch file picker after copying the contents
									var button = theDialog.getContentElement( 'info', 'uploadButton' ).getInputElement();
									if ( !CKEDITOR.env.ie ) {
										button.$.click();
									} else {
										window.setTimeout( function() {
											button.$.click();
										}, 50 );
									}

									// Clear selection to remove highlight
									window.setTimeout( function() {
										input.$.value = '';
									}, 100 );
								} );
							},
							onKeydown: function( evt ) {
								// Handle Enter directly because if there's a timer or anything else Firefox won't allow copy
								if ( evt.data.getKey() == 13 ) {
									copyToClipboard( theDialog );
									// We have to do it only once to prevent double dialog, so prevent firing the OK event
									evt.stop();
									evt.data.preventDefault( true );
									evt.data.stopPropagation();
									return false;
								}
							},
							// Make it non-visible
							inputStyle: 'background:transparent; border:0; box-shadow: none; color:transparent; margin:0; padding:0; opacity:0.1; position:absolute; left:0; top:0'
						},
						{
							type : 'file',
							id : 'upload',
							label : lang.btnUpload,
							style: 'display:none'
						},
						{
							type : 'fileButton',
							id : 'uploadButton',
							filebrowser :
							{
								action : 'QuickUpload',
								onSelect : function( url, msg, data ) {
									if ( !url )
										return;

									// Check with the original name (in case it has been modified by another plugin like imagecrop
									var localName = data.originalName;
									for ( var i = 0; i < queue.length; i++ ) {
										var item = queue[ i ];
										if ( item.name == localName ) {
											UploadedFile( editor, item.srcPath, url );
											queue.splice( i, 1 ); // remove it.
											break;
										}
									}
									if ( !queue.length ) {
										theDialog.hide();
										return false;
									}
									updatePendingFiles();
									return false;
								},
								requiresImage : true,
								multiple : true
							},
							'for' : [ 'info', 'upload' ],
							style: 'display:none',
							hidden : true
						}
					]
				}
			],
			onShow : function() {
				queue = [];
				for ( var i = 0; i < editor.plugins.imagesfromword.queue.length; i++ ) {
					var item = editor.plugins.imagesfromword.queue[ i ];
					var localPath = unescape( item.path ).replace( /\//g, '\\' );
					queue.push( {
						srcPath : item.path,
						localPath: localPath,
						name: localPath.match( /\\([^\\]*)$/ )[1]
					} );
				}
				// Remove pending uploads
				editor.plugins.imagesfromword.queue.length = 0;

				theDialog = this;
				// Adjust label of the ok button (we want to keep default behaviour, but adjust text only in this dialog)
				var btnOk = this.getButton( 'ok' );
				btnOk.getElement().$.firstElementChild.innerHTML = lang.btnContinue;

				updatePendingFiles();
			},
			onCancel : function() {
				// the user has clicked the X to close the dialog.
				// remove any image that it uses a local path because they won't be useful
				var imgs = editor.editable().$.getElementsByTagName( 'img' );
				for ( var i = imgs.length - 1; i >= 0 ; i-- ) {
					var theImage = imgs[i],
						src = theImage.getAttribute( 'data-cke-saved-src' ) || theImage.getAttribute( 'src' );

					if ( src.indexOf( 'file://' ) == 0 ) {
						if ( editor.widgets && editor.plugins.image2 ) {
							var $img = new CKEDITOR.dom.node( theImage );
							var widget = editor.widgets.getByElement( $img );
							if ( widget ) {
								theImage = widget.wrapper.$;
							}
						}

						theImage.parentNode.removeChild( theImage );
					}
				}
			},
			// The user clicks on Continue
			onOk : function( ev ) {
				// Copy to clipboard
				copyToClipboard( this );

				// Prevent closing the dialog
				ev.data.hide = false;
			},

			buttons : [ CKEDITOR.dialog.okButton ]
		};
	} );
} )();