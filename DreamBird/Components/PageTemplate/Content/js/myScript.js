//function pageLoad() {
//    jQuery(document).ready(function ($) {
//        LoadTemplateScripts($);
//    });
//}
jQuery(document).ready(function ($) {
    LoadTemplateScripts($);
    $("#ipage_frame").on("dialogclose", function (event, ui) {
        $("#ipage_frame").dialog('destroy');
        var iframe = document.getElementsByName('page_frame');
        $(iframe).attr("width", "100%");
        $(iframe).attr("height", "400");
    });
    $(document).on('click', '#activate_modal', function (e) {
        var iframe = document.getElementsByName('page_frame');
        var source = $(iframe).attr("source");
        $('#ipage_frame').dialog({
            width: 1400,
            height: 550
        });
        $(iframe).attr("src", source);
        $(iframe).attr("width", "1370");
        $(iframe).attr("height", "550");
        $(iframe).attr("z-index", "100000");
        $('.ui-dialog').css("top", "75px");
    });
    $(document).on("change", ".myText", function () {
        $(this).attr("value", $(this).val());
    });
    $(document).on("change", ".myCheck", function () {
        var dataname = $(this).data("name");
        var textbox = $('input[type="number"][data-name="' + dataname + '"]');
        if ($(this).is(':checked')) {
            textbox.removeAttr("disabled");
            $(this).attr("checked", $(this).is(':checked'));
        }
        else {
            textbox.attr("disabled", "disabled");
            $(this).attr("checked", $(this).is(':checked'));
        }
    });
    $(document).on('click', '#save_content', function (e) {
        e.preventDefault();
        var content = $('#working_area').html();
        var name = $('#page_Name').val();
        var id = $('#dream_id').val();
        SaveLayout(content, name, id);
      
    });
    $(document).on('click', '.dream_page', function () {
        var dreamid = $(this).attr("id");
        var pageName = $(this).data("name");
        var name = $('#page_Name').text();
        var id = $('#dream_id').val();
        callFetcher(pageName, dreamid);
        $('#page_Name').text(name);
        $('#dream_id').val(id);
        $('#import_pages').modal('hide');
    });
    $(document).on('click', '#save_layout', function (e) {
        e.preventDefault();
        if ($('#working_area').html().length < 10) {
            alert("Empty layout cannot be saved, drag content items first!");
        }
        else {
            if ($('#layout_name').val().length == 0) {
                alert("Please Enter the Layout Name");
                $('#layout_name').focus();
            }
            else {
                var content = $('#working_area').html();
                var name = $('#layout_name').val();

                content = content + "SPLIT" + name + "SPLITLayout";
                $.ajax({
                    url: "../../Components/PageTemplate/LayoutSave.ashx",
                    type: "POST",
                    data: content,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        alert("Successfully Saved the layout");
                        location.reload();
                    },
                    error: function (err) {
                        alert(err.statusText)
                    }
                });
            }
        }
    });
    $(document).on('click', '.img_control', function () {
        var datas = $('#hf').val();
        var counter = $('#hf1').val();
        var isProgress = $(this).data("progress");
        var component = "";
        //var List = '<select class="roles" style="color:black; position:absolute; top:0; right:18px;"><option value="volvo">Volvo</option><option value="saab">Saab</option><option value="mercedes">Mercedes</option><option value="audi">Audi</option></select>';
        if (isProgress == "True") {
            component = '<div class="col-md-12 btn btn-warning" data-BaseDreamServerID="' + counter + '" data-name="' + $(this).data("name") + '"><div class="col-md-6" style="padding:0;"><a href="#" style="pointer-events:none; color:white;"><h4 style="margin:0;">' + $(this).data("name") + '</h4></a></div><div class="col-md-3" style="padding:0;"><h5 style="margin:0;"><input class="myCheck" data-name="' + $(this).data("name") + '" type="checkbox" />Use Progress</h5></div><div class="col-md-3" style="padding:0;"><input type="number" class="myText" data-name="' + $(this).data("name") + '" style="color:black;" placeholder="Weightage" disabled="disabled" /></div><span class="glyphicon glyphicon-remove remove" style="position:absolute; top:2px; right:2px; opacity:0;" aria-hidden="true"></span></div>';
        }
        else {
            component = '<div class="col-md-12 btn btn-warning" data-BaseDreamServerID="' + counter + '" data-name="' + $(this).data("name") + '"><a href="#" style="pointer-events:none; color:white;"><h4 style="margin:0;">' + $(this).data("name") + '</h4></a><span class="glyphicon glyphicon-remove remove" style="position:absolute; top:2px; right:2px; opacity:0;" aria-hidden="true"></span></div>';
        }
        counter++;

        $('#' + datas).append(component).children('h4').remove();
        $('#controlsList').modal('hide');
        $('#counter_current').val(counter);
    });
    $(document).on('change', '#slider-margin', function () {
        var value = $(this).val() + "px";
        $('[id$="-margin"]').val(value);
        styleInput();
    });
    $(document).on('change', '#template-mode', function () {
        alert("Hi");
    });
    $(document).on('click', '#save-style', function (e) {
        e.preventDefault();
        var value = $('#css-string').val();
        var value1 = $('#css-class-string').val();
        var selector = '#hidden-' + $('#style-holder').val();
        var selector1 = '#hidden-class-' + $('#style-holder').val();
        $(selector).val(value);
        $(selector1).val(value1);
    });
    $(document).on('change', '#slider-padding', function () {
        var value = $(this).val() + "px";;
        $('[id$="-padding"]').val(value);
        styleInput();
    });
    $(document).on('change', '#bg-color', function () {
        var value = $(this).val();
        $('#bg-color-code').val(value);
        styleInput();
    });
    $(document).on('change', '#border-color', function () {
        var value = $(this).val();
        $('#border-color-code').val(value);
        styleInput();
    });
    $(document).on('change', '#font-color', function () {
        var value = $(this).val();
        $('#font-color-code').val(value);
        styleInput();
    });
    $(document).on('change', '#font-size', function () {
        var value = $(this).val() + "px";
        $('#font-size-value').val(value);
        styleInput();
    });
    $(document).on('input', '.css-input', styleInput);
    $(document).on('click', '.remove', function () {

        var element = $(this).parent();
        var removelink = $(this).data('remove');
        if (element.find('div[data-name]').length > 0) {
            alert("Column Contains Components. Delete all the components before deleting the column")
            //if(confirm("Column Contains Components, Delete with caution!"))
            //{
            //    element.remove();

            //}
        }
        else {
            element.remove();
        }
        if (removelink != undefined) {
            window.open(removelink, "RemoveWindow");
        }
        //$(this).parent().remove();
    });

});

function AssignIDS() {
    var len = $('div[data-name]').length;
    var len1 = $('div[data-basedreamserverid]').length;
    if (len > len1) {
        var counter_field = $("#counter_current");
        if (counter_field.length <= 0) {
            $('#working_area').append("<input type='hidden' id='counter_current' />");
            var current_counter = 1;
            $('#counter_current').val(current_counter);
        }
        var current_counter = $('#counter_current').val();
        $('div[data-name]').each(function () {
            var attr = $(this).attr('data-basedreamserverid');

            // For some browsers, `attr` is undefined; for others, `attr` is false. Check for both.
            if (typeof attr == typeof undefined || attr == false) {
                // Element has this attribute
                $(this).attr('data-basedreamserverid', current_counter);
                current_counter++;
            }
        });
        $('#counter_current').val(current_counter);
    }
}
function Removechildren(value) {
    //var val = value.attr("id");
    //var reg = /sortable/;
    //if (reg.test(val)) {
    var attribute = value.attr("data-name");

    if (typeof attribute !== typeof undefined && attribute !== false) {
        return true;
    }
    else {
        alert(value.children("div").length);
        if (value.children("div").length > 0) {
            value.children("div").each(function () {
                var id = $(this);
                Removechildren(id);
            });
        }
        return false;
    }
}

function LoadTemplateScripts($) {
   
    $('#clear_content').click(function (e) {
        e.preventDefault();
        $("#working_area").html(" ");
    });
    $('#myModal').on('show.bs.modal', function (event) {
        var firstIframe = document.getElementsByName('page_frame');
        var secondIframe = document.getElementsByName('modal_frame');
        var content = $(firstIframe).contents().clone();
        $(secondIframe).append(content);
    });
    $('#controlsList').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('argument') // Extract info from data-* attributes
        var counter_field = $("#counter_current");
        AssignIDS();
        var counter = counter_field.val();
        if (counter_field.length <= 0) {
            $('#working_area').append("<input type='hidden' id='counter_current' />");
            var current_counter = 1;
            $('#counter_current').val(current_counter);
        }

        $('#hf').val(recipient);
        $('#hf1').val(counter);
    });
    $('#editCSS').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('argument') // Extract info from data-* attributes
        var saveStyle = $('#hidden-' + recipient).val();
        var customclass = $('#hidden-class-' + recipient).val();
        $('#css-string').val(saveStyle);
        $('#css-class-string').val(customclass);
        $('#style-holder').val(recipient);
    });
    $('#pageTemplate').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('pagename'); // Extract info from data-* attributes
        var id = button.data('dreamid');
        var name = button.data('dreamname');
        $('#parent_page').attr("href", "../DreamHome/" + name + "/" + recipient);
        callFetcher(recipient, id);

    });
    //$(document).on('click', '#close_control', function (e) {
    //    e.preventDefault();
    //    $('#controlsList').modal('hide');
    //});
    //loadSortableCode();
    $("#columns, #media, #layouts, #working_area").sortable({
        connectWith: ".sortable",
        helper: 'clone',
        handle: ".handle",
        placeholder: 'ui-state-highlight',
        opacity: '.5',
        start: function (event, ui) {
            var id = ui.item.parent().attr("id");
            ui.item.data("ParentID", id);
        },
        remove: function (e, li) {
            //var id = li.item.data("ParentID");
            //alert(id);
            if (li.item.data("ParentID") == "columns") {
                //var id = li.item.attr("id");
                //var trimmedid = id.substring(0, 1);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                //var pattern = /sortable-/;
                //var check = pattern.test(li.item.parent().attr("id"));
                //if (check) {
                //    li.item.parent().children("h4").remove();
                //}

                var content = li.item.data("size");
                var len = $('[id^="sortable-"]').length;
                var item = li.item.clone(true).removeClass("col-md-2").addClass(content).attr("id", "sortable-" + (len + 1)).addClass("sortable").css("margin", "0");
                var id = "sortable-" + (len + 1);
                var close = '<span class="glyphicon glyphicon-remove remove" style="position:absolute; top:2px; right:2px; opacity:0;" aria-hidden="true"></span>';
                var add = '<span class="glyphicon glyphicon-plus add" aria-hidden="true" data-argument="' + id + '" data-toggle="modal" data-target="#controlsList" style="position:absolute; top:10px; right:2px; opacity:0;"></span>';
                var edit = '<span class="glyphicon glyphicon-pencil edit" aria-hidden="true" data-argument="' + id + '" data-toggle="modal" data-target="#editCSS" style="position:absolute; top:15px; right:2px; opacity:0;"></span>';
                var hidden = '<input type="hidden" id="hidden-' + id + '" value="">';
                var hidden1 = '<input type="hidden" id="hidden-class-' + id + '" value="' + content + '">';
                //var handle = '<span class="glyphicon glyphicon-asterisk handle" aria-hidden="true" style="position:absolute; top:2px; left:4px;">';
                item.append(close);
                item.append(add);
                item.append(edit);
                item.append(hidden);
                item.append(hidden1);
                //item.append(handle);
                //item.children().append(close);
                $('#working_area').append(item);

                //$('#working_area').children().children().each(function () {
                //    $(this).removeClass("ui-sortable-handle");
                //});
                //li.item.clone(true).removeClass("col-md-2").addClass(content).attr("id", "sortable-" + (len + 1)).addClass("sortable").css("margin", "0").insertAfter(li.item);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                //li.item.attr("id", id);
                $(this).sortable('cancel');
                var count = $('#working_area').children().children('.glyphicon').each(function () {
                    $(this).removeClass("ui-sortable-handle");
                });
                $('[id^="sortable-"], #working_area, #columns, #media, #layouts').sortable({
                    connectWith: ".sortable",
                    placeholder: "ui-state-highlight",
                    handle: '.handle'
                });
            }
            else if (li.item.data("ParentID") == "layouts") {
                //var id = li.item.attr("id");
                //var trimmedid = id.substring(0, 1);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                var content = li.item.data("layout");

                $('#working_area').append(content);
                $(this).sortable('cancel');
                var id_part = 1;

                $('#working_area').children("div").each(function () {
                    $(this).attr("id", "sortable-" + id_part);
                    id_part++;
                    var content = $(this).attr("class");
                    var id = $(this).attr("id");
                    var close = '<span class="glyphicon glyphicon-remove remove" style="position:absolute; top:2px; right:2px; opacity:0;" aria-hidden="true"></span>';
                    var add = '<span class="glyphicon glyphicon-plus add" aria-hidden="true" data-argument="' + id + '" data-toggle="modal" data-target="#controlsList" style="position:absolute; top:10px; right:2px; opacity:0;"></span>';
                    var edit = '<span class="glyphicon glyphicon-pencil edit" aria-hidden="true" data-argument="' + id + '" data-toggle="modal" data-target="#editCSS" style="position:absolute; top:15px; right:2px; opacity:0;"></span>';
                    var handle = '<span class="glyphicon glyphicon-asterisk handle" aria-hidden="true" style="position:absolute; top:2px; left:4px;">';
                    var hidden = '<input type="hidden" id="hidden-' + id + '" value="">';
                    var hidden1 = '<input type="hidden" id="hidden-class-' + id + '" value="' + content + '">';

                    $(this).append(close);
                    $(this).append(add);
                    $(this).append(edit);
                    $(this).append(handle);
                    $(this).append(hidden);
                    $(this).append(hidden1);
                });
                $('[id^="sortable-"], #columns, #media, #layouts, #working_area').sortable({
                    connectWith: ".sortable",
                    placeholder: "ui-state-highlight",
                    handle: ".handle"
                });

                //li.item.clone(true).removeClass("col-md-2 btn btn-success ui-sortable-handle").removeAttr("data-layout").html(content).css("margin", "0").insertAfter(li.item);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                //li.item.attr("id", id);

            }
                //else if (li.item.data("ParentID") == "media")
                //{
                //    var pattern = /sortable-/;
                //    var check = pattern.test(li.item.parent().attr("id"));
                //    if (check) {
                //        li.item.parent().children("h4").remove();
                //    }
                //    li.item.clone(true).removeClass("col-md-2 btn-success").addClass(content).addClass("btn-warning").css("margin", "0").insertAfter(li.item);
                //    $(this).sortable('cancel');
                //}
            else if (li.item.data("ParentID") == "working_area") {
                var pattern = /sortable-/;
                var check = pattern.test(li.item.parent().attr("id"));
                if (check) {
                    li.item.parent().children("h4").remove();
                }
                $('[id^="sortable-"], #working_area, #columns, #media, #layouts').sortable({
                    connectWith: ".sortable",
                    placeholder: "ui-state-highlight"
                });
            }


        }
    }).disableSelection();
}
function styleInput() {
    var attrValue = "";
    $('.css-input').each(function () {
        var value = $(this).val();
        if (!((value == "") || (value == "0px"))) {
            attrValue = attrValue + $(this).data("attribute") + ":" + value + ";";
            $('#css-string').val(attrValue);
        }
    });

}
function callFetcher(recipient, id) {
    var content = recipient + "SPLIT" + id;
    $.ajax({
        url: "../../Components/PageTemplate/LayoutRetrive.ashx",
        type: "POST",
        contentType: false,
        processData: false,
        data: content,
        success: function (result) {
            $('#working_area').html(result);
            AssignIDS();
        },
        error: function (err) {
            alert(err.statusText)
        }
    });
    $('#page_Name').val(recipient);
    $('#dream_id').val(id);
}

function LoadTemplate(value, recipient, id)
{
    $('#page_Name').text(recipient);
    $('#dream_id').val(id);
    $.ajax({
        url: "../../Components/PageTemplate/LayoutRetrive.ashx?TemplateName="+value,
        type: "POST",
        contentType: false,
        processData: false,
        success: function (result) {
            $('#working_area').html(result);
            $('#save_content').click();
        },
        error: function (err) {
            alert(err.statusText)
        }
    });
    
    
}