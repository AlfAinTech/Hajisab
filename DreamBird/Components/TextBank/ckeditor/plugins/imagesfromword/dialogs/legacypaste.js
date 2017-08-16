 /* globals CKEDITOR */

(function() {
	'use strict';
	// Kept only for old IEs. 
	CKEDITOR.dialog.add( 'legacypaste', function( editor ) {
		var lang = editor.lang.imagesfromword,
			generalLabel = editor.lang.common.generalTab,
			queue, contador, total,
			path;

		function elegirFichero(editor, dialog) {
			if (!queue.length) {
				dialog.hide();
				return;
			}

			var obj = queue.shift();
			path = obj.path;
			var usablePath = unescape(path).replace(/\//g, '\\');

			var el = dialog.getContentElement('info', 'ruta');
			el.setValue(usablePath);

			el.select();
			el.focus();

			var etiqueta = lang.file + ' ';
			if (total > 1) {
				contador++;
				etiqueta += contador + ' ' + lang.of + ' ' + total;
			}
			// adjust label
			dialog.getContentElement('info', 'ruta').setLabel(etiqueta);
		}

		return {
			title : lang.title,
			minWidth : 300,
			minHeight : 80,
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
							html : lang.instructions
						},
						{
							id : 'ruta',
							type : 'text',
							label : lang.file,
							onLoad : function() {
								var input = this.getInputElement(),
									dialog = this.getDialog();

								input.on('click', function() {
									this.$.select();
								});
								input.on('copy', function() {
									// Chrome & Firefox, launch file picker after copying the contents
									var button = dialog.getContentElement('info', 'uploadButton').getInputElement();
									button.$.click();
								});

								input.$.readOnly = true;
							}

						},
						{
							id : 'txtUrl',
							type : 'text',
							hidden : 'true'
						},
						{
							type : 'file',
							id : 'upload',
							label : lang.btnUpload,
							style: 'height:40px',
							size : 38
						},
						{
							type : 'fileButton',
							id : 'uploadButton',
							filebrowser :
							{
								action : 'QuickUpload',
								target: 'info:txtUrl',
								onSelect : function(url/*, msg, data*/) {

									var imgs = editor.document.$.getElementsByTagName( 'img' );
									for (var i = 0; i < imgs.length; i++) {
										var theImage = imgs[i];
										if ( theImage.getAttribute('data-cke-saved-src') == 'file:///' + path || 
											theImage.getAttribute('src') == 'file:///' + path) {

											theImage.setAttribute( 'data-cke-saved-src', url);
											theImage.setAttribute( 'src', url);

											if (editor.widgets && editor.plugins.image2) {
												var widget = editor.widgets.getByElement( new CKEDITOR.dom.element(theImage) );
												if (widget)
													widget.data.src = url;
											}
										}
									}

									// Pasar al siguiente
									var dialog = CKEDITOR.dialog.getCurrent();
									elegirFichero(editor, dialog);
								},
								requiresImage : true/*,
								multiple : true*/
							},
							label : lang.btnUpload,
							'for' : [ 'info', 'upload' ],
							hidden : true
						}
					]
				}
			],
			onShow : function() {
				queue = editor.plugins.imagesfromword.queue;
				contador = 0;
				total = queue.length;
				elegirFichero(editor, this);
			},
			buttons : [ CKEDITOR.dialog.cancelButton ]
		};
	});
})();