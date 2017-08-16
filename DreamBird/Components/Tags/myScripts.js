//function pageLoad() {
//    jQuery(document).ready(function ($) {
//        LoadScripts($);
//    });
//}
//jQuery(document).ready(function ($) {
//    LoadTagScripts();
//});
function LoadTagScripts() {
    //var dataArray = new Array;
    var TagArray = new Array;
    $('.Textext').textext({
        plugins: 'tags focus autocomplete arrow clear',
    })
         .bind('getSuggestions', function (e, data) {

             var list = testArray,
                 textext = $(e.target).textext()[0],
                 query = (data ? data.query : '') || ''
             ;

             $(this).trigger(
                 'setSuggestions',
                 { result: textext.itemManager().filter(list, query) }
             );
         }).bind('tagClick', function (e, tag, value, callback) {
             alert(value);
         });
    //$('.TextText').textext({
    //    plugins: 'tags focus autocomplete arrow clear',
    //})
    //     .bind('getSuggestions', function (e, data) {

    //         var list = testArray,
    //             textext = $(e.target).textext()[0],
    //             query = (data ? data.query : '') || ''
    //         ;

    //         $(this).trigger(
    //             'setSuggestions',
    //             { result: textext.itemManager().filter(list, query) }
    //         );
    //     }).bind('tagClick', function (e, tag, value, callback) {
    //         alert(value);
    //     });

    //{
    //    var elems = $('.TextText').val('').textext()[0].tags().tagElements();
    //    for (var i = 0; i < elems.length; i++) {
    //        $('.TextText').val('').textext()[0].tags().removeTag($(elems[i]));
    //    }
    //    $('.TextText').val('');
    //    $('.TextText').val('').textext()[0].getFormData();
    //}
    {
        var elems = $('.Textext').val('').textext()[0].tags().tagElements();
        for (var i = 0; i < elems.length; i++) {
            $('.Textext').val('').textext()[0].tags().removeTag($(elems[i]));
        }
        $('.Textext').val('');
        $('.Textext').val('').textext()[0].getFormData();
    }
    //var arraylength = dataArray.length;
    //alert(arraylength);
    
}

function DisableTags() {
    $('.Textext').val('').textext()[0].arrow.enabled = false;
    $('.Textext').val('').textext()[0].clear.enabled = false;
}

function SetTags(value) {
    var elems = $('#' + value).val('').textext()[0].tags().tagElements();
    for (var i = 0; i < elems.length; i++) {
        $('#' + value).val('').textext()[0].tags().removeTag($(elems[i]));
    }
    $('#' + value).val('');
    $('#' + value).val('').textext()[0].getFormData();
    $('#' + value).val('').textext()[0].tags().addTags(dataArray);
}

