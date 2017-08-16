jQuery(document).ready(function ($) {
   // LoadToolBar();
    LoadModals();
    LoadControls();
    $(document).on('click', '.controls', function () {
        $(this).parent().parent().remove();
    });
});


function LoadToolBar()
{
  //  $('#ToolBar').load("../../ToolBar.html");   
}

function LoadLayoutIcons()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../../Components/DragDropFramework/DD.aspx/RenderLayout",
        dataType: "json",
        success: function (response) {
            $('#modal_body').html(response.d);
            $(":radio").change(LoadLayouts);
            LoadSortableCode();
        },
        Error: function () {
            alert('error');
        }
    });
}

function LoadControls()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../../Components/DragDropFramework/DD.aspx/GetAllIcons",
        dataType: "json",
        success: function (response) {
            $('#accordion').html(response.d);
            LoadSortableCode();
            LoadLayoutIcons();
            $("#PageName").click(LoadPageMarkup);
            $("[name='my-checkbox']").bootstrapSwitch();
            $('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', LoadSwitchFunction);
            $('#Button1').click(AddNewPage);
            $('.PageLink').click(LoadPageFromLink);
            $('#SaveChanges').click(SaveChanges);
            $('.controls').click(CloseControl);

        },
        Error: function () {
            alert('error');
        }
    });
}

function CloseControl(e) {
    e.preventDefault();
    alert("Hello");
}

    function LoadModals() {
        $('#Modals').load("../../Modals.html");
    }

    function LoadPageNavigations() {
        $('#PageNavigation').load("../PageNavigation.html");
    }
    function LoadSwitchFunction (event, state) {
        if (state == false) {
            $('.controls').click(CloseControl);
            $('.sortable').children().each(function () {
                var id = $(this).attr("names");
                var name = $(this);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../../Components/DragDropFramework/DD.aspx/GetNormalMarkup",
                    data: "{ControlName:" + JSON.stringify(id) + "}",
                    dataType: "json",
                    success: function (response) {
                        name.html(response.d);
                        // window.location.href = "ClubCreation.aspx";
                    },
                    Error: function () {
                        alert('error');
                    }
                });
            });
            $('.mainLayout').each(function () {
                $(this).removeClass("mainLayout");
                $(this).addClass("Temp");
            })
            $('.sortable').each(function () {
                $(this).removeClass("sortable");
                $(this).addClass("Temp1");
            })
            $("#sortable-header, #sortable-footer, #sortable1, #sortable2, #sortable3, #sortable4, #sortable5, #sortable6, #sortable7, #sortable8, #sortable9, #sortable10").sortable({
                disabled: true
            }).enableSelection();
            $('.mainLayout').css("background", "#fff");
            $('.mainLayout').css("border", "none");
            $('#SaveChanges').css("pointer-events", "none");
        }
        else {
            $('.controls').click(CloseControl);
            $('.mainLayout').css("background", "#f6f6f6");
            $('.mainLayout').css("border", "1px solid #c1c1c1");
            $('#SaveChanges').css("pointer-events", "auto");
            $('.Temp').each(function () {
                $(this).removeClass("Temp");
                $(this).addClass("mainLayout");
            });
            $('.Temp1').each(function () {
                $(this).removeClass("Temp1");
                $(this).addClass("sortable");
            });
            $('.sortable').children().each(function () {
                var id = $(this).attr("names");
                var name = $(this);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../../Components/DragDropFramework/DD.aspx/GetEditableMarkup",
                    data: "{ControlName:" + JSON.stringify(id) + "}",
                    dataType: "json",
                    success: function (response) {
                        name.html(response.d);
                        // window.location.href = "ClubCreation.aspx";
                    },
                    Error: function () {
                        alert('error');
                    }
                });
            });

            

            $("#sortable-header, #sortable-footer, #sortable1, #sortable2, #sortable3, #sortable4, #sortable5, #sortable6, #sortable7, #sortable8, #sortable9, #sortable10").sortable({
                disabled: false,
                connectWith: ".sortable",
                helper: 'clone',
                placeholder: 'ui-state-highlight',
                opacity: '.5',
                start: function (event, ui) {
                    var id = ui.item.parent().attr("id");
                    ui.item.data("ParentID", id);
                },
                remove: function (e, li) {
                    if (li.item.data("ParentID") == "sortable1") {
                        var id = li.item.attr("id");
                        var trimmedid = id.substring(0, 1);
                        trimmedid++;
                        id = trimmedid + "-" + id.substring(2);
                        var content = li.item.attr("content");
                        li.item.clone(true).removeClass("col-md-2").removeClass("ui-state-default").removeAttr("content").attr("id", id).html(content).insertAfter(li.item);
                        trimmedid++;
                        id = trimmedid + "-" + id.substring(2);
                        li.item.attr("id", id);
                        $(this).sortable('cancel');
                    }

                }
            }).disableSelection();
        }
    }

    function LoadPageMarkup() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../../Components/DragDropFramework/DD.aspx/LoadPageMarkup",
            data: "{id:" + JSON.stringify("18") + "}",
            dataType: "json",
            success: function (response) {
                $('#body_content').html(response.d);
                // window.location.href = "ClubCreation.aspx";
            },
            Error: function () {
                alert('error');
            }
        });
        $('.controls').click(CloseControl);
    }

    function LoadSortableCode(){
        $("#sortable-header, #sortable-footer, #sortable1, #sortable2, #sortable3, #sortable4, #sortable5, #sortable6, #sortable7, #sortable8, #sortable9, #sortable10").sortable({
            connectWith: ".sortable",
            helper: 'clone',
            placeholder: 'ui-state-highlight',
            opacity: '.5',
            start: function (event, ui) {
                var id = ui.item.parent().attr("id");
                ui.item.data("ParentID", id);
            },
            remove: function (e, li) {
                if (li.item.data("ParentID") == "sortable1") {
                    var id = li.item.attr("id");
                    var trimmedid = id.substring(0, 1);
                    trimmedid++;
                    id = trimmedid + "-" + id.substring(2);
                    var content = li.item.attr("content");
                    li.item.clone(true).removeClass("col-md-2").removeClass("ui-state-default").removeAttr("content").attr("id", id).html(content).insertAfter(li.item);
                    trimmedid++;
                    id = trimmedid + "-" + id.substring(2);
                    li.item.attr("id", id);
                    $(this).sortable('cancel');
                }

            }
        }).disableSelection();
    }

    function AddNewPage() {
        var PageName = $('#Text1').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../../Components/DragDropFramework/DD.aspx/AddPage",
            data: "{PageName:" + JSON.stringify(PageName)+"}",
            dataType: "json",
            success: function (response) {
                alert('Successfully Saved');
                $('#PageName').text(PageName);
                $('#HiddenID').val(response.d);
                // window.location.href = "ClubCreation.aspx";
            },
            Error: function () {
                alert('error');
            }
        });
            
    }

    function SaveChanges() {
        if ($('#PageName').text() == "") {
            alert("You Have Not Added or Selected Any Page. Click on the Page List to Select a Page");
        }
        else {
            var counter = 1;
            $('.sortable').children().each(function () {
                var id = $(this).attr("names");
                    var defautcontroname = $(this).attr("defaultcontrolname");
                    //$(this).removeAttr("defaultcontrolname");
                    $(this).removeAttr("id");
                    $(this).removeAttr("names");
                    var admincontrolname = $(this).attr("admindreamcontrol");
                    //$(this).removeAttr("admindreamcontrol");
                    var basecounter = "BaseDreamControl" + counter;
                    counter++;
                    var finalstring = "<uc2:BaseDreamControl ID='" + basecounter + "' runat='server' DefaultControl='" + defautcontroname + "' AdminSettingControl='" + admincontrolname + "' />";
                    $(this).text(finalstring);
            });
            $('#HiddenID').text(counter);
                $('.sortable').each(function () {
                    $(this).removeClass("sortable");
                    $(this).addClass("Temp1");
                });
                var pagename = $('#PageName').text();
                var pageid = $(location).attr('href');
                var content = $('#body_content').html();
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../../Components/DragDropFramework/DD.aspx/SavePage",
                    data: "{PageName:" + JSON.stringify(pagename) + ", PageContent:" + JSON.stringify(content) + ", PageID:" + JSON.stringify(pageid) + "}",
                    dataType: "json",
                    success: function () {
                        alert('Successfully Saved');
                        // window.location.href = "ClubCreation.aspx";
                    },
                    Error: function () {
                        alert('error');
                    }
                });
        }
    }

    function LoadPageFromLink() {
        var content = $(this).attr("content");
        var name = $(this).text();
        var pageid = $(this).attr("page-id");
        $('#PageName').text(name);
        $('#HiddenID').val(pageid);
        $('#body_content').empty();
        $('#body_content').append(content);
        $('input[name="my-checkbox"]').bootstrapSwitch('readonly', false);
        $('input[name="my-checkbox"]').bootstrapSwitch('state', true, true);
        LoadSortableCode();
    }
    function LoadLayouts(e) {
        e.preventDefault();
        var id = $(this).attr('id');
        var trimmedid = id.substring(0, 1);
        //alert(trimmedid);
        var pagename = $('#PageName').text();
        var pageid = $('#HiddenID').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../../Components/DragDropFramework/DD.aspx/SessionSet",
            data: "{SessionValue:" + JSON.stringify(trimmedid) + ", PageName:"+JSON.stringify(pagename)+", PageID:"+JSON.stringify(pageid)+"}",
            dataType: "json",
            success: function (response) {
                $('#body_content').html(response.d);
                //LoadSortableCode();
                // window.location.href = "ClubCreation.aspx";
            },
            Error: function () {
                alert('error');
            }
        });
    }
