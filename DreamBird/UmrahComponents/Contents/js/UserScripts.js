//jQuery(document).ready(function ($) {
  
//});
//function textOnly(input) {
   
//    var regExp = new RegExp('[a-zA-Z]');

    

//    var value = $(input).val();

//        // Do not allow alphabets to be entered.
//        if (regExp.test(value)) {
//            input.preventDefault();
//            return false;
//        }
//}
$(function () {
    // Regular Expression to Check for Alphabets.
    var regexText = new RegExp("^[a-zA-Z]+$");
    var regexNumeric = new RegExp("^[0-9]+$");
   
    $('.only-text').keypress(function (event) {
        //window.alert("gfvc")
        var value = $(this).val();

        var str = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (event.keyCode == 8 || event.keyCode == 46 || event.keyCode == 37 || event.keyCode == 39) {
            return true;
        }
        if (!regexText.test(str)) {
            event.preventDefault();
            return false;
        }

    }); // End of 'keydown keyup' method.
    $('.numeric').keypress(function (event) {
        //window.alert("gfvc")
        var value = $(this).val();

        var str = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (event.keyCode == 8 || event.keyCode == 46|| event.keyCode == 37 || event.keyCode == 39) {
            return true;
        }
        if (!regexNumeric.test(str)) {
            event.preventDefault();
            return false;
        }

    }); // End of 'keydown keyup' method.

}); // End of 'document ready'