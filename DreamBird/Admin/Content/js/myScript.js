jQuery(document).ready(function ($) {
    $.expr[':'].Contains = function (a, i, m) {
        return jQuery(a).text().toUpperCase()
            .indexOf(m[3].toUpperCase()) >= 0;
    };
    // OVERWRITES old selecor
    $.expr[':'].contains = function (a, i, m) {
        return jQuery(a).text().toUpperCase()
            .indexOf(m[3].toUpperCase()) >= 0;
    };
    $(document).on('input', "#search_dream_list", function () {
        var Text = $(this).val();
        //Text = Text.toLowerCase().replace(/\b[a-z]/g, function (letter) {
        //    return letter.toUpperCase();
        //});
        if (Text != "") {
            $('#dream_list_main').find("a:not(:contains('" + Text + "'))").css("display", "none");
            $('#dream_list_main').find("a:contains('" + Text + "')").css("display", "block");
        }
        else {
            $('#dream_list_main').children().children().each(function () {
                $(this).css("display", "block");
            });
        }

    });
    $(document).on('input', "#search_dream_page_list", function () {
        var Text = $(this).val();
        //Text = Text.toLowerCase().replace(/\b[a-z]/g, function (letter) {
        //    return letter.toUpperCase();
        //});
        if (Text != "") {
            $('.dream_page_list_main').find("a:not(:contains('" + Text + "'))").css("display", "none");
            $('.dream_page_list_main').find("a:contains('" + Text + "')").css("display", "block");
        }
        else {
            $('.dream_page_list_main').children().children().each(function () {
                $(this).css("display", "block");
            });
        }

    });
    $(document).on('input', "#search_pages", function () {
        var Text = $(this).val();
        if (Text != "") {
            $('.list-group').find("a:not(:contains('" + Text + "'))").css("display", "none");
            $('.list-group').find("a:contains('" + Text + "')").css("display", "block");
        }
        else {
            $('.list-group').children().children().each(function () {
                $(this).css("display", "block");
            });
        }

    });
    $(document).on('click', '.textbank_item', function (e) {
        e.preventDefault();
        var TextId = $(this).attr("data-text-id");
        $.ajax({
            url: "../../Components/TextBank/ImportTextBankData.ashx?TextID=" + TextId,
            type: "POST",
            contentType: false,
            processData: false,
            success: function (result) {
                CKEDITOR.instances[$('.textEditor').attr('clientid')].setData(result);
            },
            error: function (err) {
                alert(err.statusText)
            }
        });
    });
    $(document).on('click', '.addChild', function (e) {
        e.preventDefault();
        var ParentMenuID = $(this).attr("data-parentmenuid");
        var TextBox = $('input[type="text"][data-parentmenuid="' + ParentMenuID + '"');
        var ParentLayoutID = $(TextBox).attr("data-parentlayoutid");
        var MenuName = $(TextBox).val();
        var regex = new RegExp("^[a-zA-Z0-9]+$");
        if (regex.test(MenuName) == false) {
            alert("Invalid characters or empty field");
            TextBox.focus();
        }
        else {
            $.ajax({
                url: "../../Components/LessonMenu/AddChild.ashx?MenuID=" + ParentMenuID + "&&Page=" + ParentLayoutID + "&&MenuName=" + MenuName,
                type: "POST",
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result);
                    $('#refresh_menu').click();
                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }
    });
    $(document).on('click', '#next_relatedNews', function () {
        ActivateNewsTab("#relatedNews_edit");
    });
    $(document).on('click', '#save_kro', function (e) {
        e.preventDefault();
        var PageName = $('#add_new_page_collapse_text').val();
        var dreamID = getUrlVars()["DID"];
        if (PageName == "") {
            alert("Page name cannot be empty.");
            $('#add_new_page_collapse_text').focus();
        }
        else {
            PageName = PageName.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });
            $.ajax({
                url: "../../Components/Dreams/PageSaver.ashx?DID=" + dreamID + "&&Page=" + PageName + "&&Published=undefined",
                type: "POST",
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result);
                    window.location.reload();

                },
                error: function (err) {
                    alert(err.statusText)
                }
            });
        }
    });
    $(document).on('click', '#add_new_page', function () {
        $("#save_new_page").css("display", "block");
        $(this).parent().css("display", "none");
    });
    $(document).on('click', '#next_selectDream', function () {
        ActivateNewsTab("#selectDream_edit");
    });
    $(document).on('click', '#next_publishingOptions', function () {
        ActivateNewsTab("#publishingOptions_edit");
    });
    //$(document).on('click', "#save_new_page_button", function () {
    //    var PageName = $('#New_Page_Name').val();
    //    var dreamID = $("#dream_id").val();
    //    var IsActivity = $("#IsActivity").is(':checked');
    //    var PageType = "";
    //    if (IsActivity == true)
    //    {
    //        PageType = "Activity";
    //    }
    //    else
    //    {
    //        PageType = "Normal";
    //    }
    //    if (PageName == "") {
    //        alert("Page name cannot be empty.");
    //        $('input[data-pagename]').focus();
    //    }
    //    else {
    //        $.ajax({
    //            url: "../../Components/Dreams/PageSaver.ashx?DID=" + dreamID + "&&Page=" + PageName + "&&Published=undefined&&Type="+PageType,
    //            type: "POST",
    //            contentType: false,
    //            processData: false,
    //            success: function (result) {
    //                alert(result);
    //                $("#btn_refresh_pages").click();;

    //            },
    //            error: function (err) {
    //                alert(err.statusText)
    //            }
    //        });
    //    }
    //});
    //$(document).on('change', '.activity', function () {
    $(document).on('change', '#published', function () {
        var Published = $(this).is(':checked');
        var PageName = $('input[data-pagename="Page_Name"]').val();
        var dreamID = $("#Dream_ID").val();
        alert(dreamID);
        var PageType = $("#Page_Type").val();
        $.ajax({
            url: "../../Components/Dreams/PageSaver.ashx?DID=" + dreamID + "&&Page=" + PageName + "&&Published=" + Published + "&&Type=" + PageType,
            type: "POST",
            contentType: false,
            processData: false,
            success: function (result) {
                alert(result);
                if (result == "Blank Activity Page") {
                    RetriveLayout("Activity", PageName, dreamID);
                }
            },
            error: function (err) {
                alert(err.statusText)
            }
        });
    });
    $(document).on('change', '.check', function () {
        var PageName = $('input[data-pagename="Page_Name"]').val();
        var roleName = $(this).data("id");
        var dreamID = $("#dream_id").val();
        var Checked = $(this).children().is(':checked');
        $.ajax({
            url: "../../Components/Dreams/Content/PageAuthorizationUpdater.ashx?DID=" + dreamID + "&&Page=" + PageName + "&&RoleID=" + roleName + "&&Allowed=" + Checked,
            type: "POST",
            contentType: false,
            processData: false,
            success: function (result) {
                //$('#working_area').html(result);
                //alert("Successfuly saved the layout!");
            },
            error: function (err) {
                alert(err.statusText)
            }
        });
    });
});

function ActivateModal(counter) {
    $('input[link-value="' + counter + '"]').click();
}
function ActivateTabButtons() {
    $('#News_tabs > ul').children().each(function () {
        $(this).attr("data-toggle", "tab");
    });
}

function calcHeight() {
    ////find the height of the internal page
    //var the_height = 0;
    //document.getElementsByName('Page_Preview').height = 0;
    //the_height = document.getElementsByName('Page_Preview').contentWindow.document.body.scrollHeight;
    //// the_height = doc.body.scrollHeight;

    ////change the height of the iframe
    ////alert(the_height);
    //document.getElementsByName('Page_Preview').height =
    //the_height;
}

function SetIFrame(value) {
    var iframe = document.getElementsByName('page_frame');
    $(iframe).attr("source", value);
}
function loadSortableCode() {
    $("#columns, #media, #layouts, #working_area, #sortable-1").sortable({
        connectWith: ".sortable",
        helper: 'clone',
        placeholder: 'ui-state-highlight',
        opacity: '.5',
        start: function (event, ui) {
            var id = ui.item.parent().attr("id");
            ui.item.data("ParentID", id);
        },
        remove: function (e, li) {
            if (li.item.data("ParentID") == "columns") {
                //var id = li.item.attr("id");
                //var trimmedid = id.substring(0, 1);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                var content = li.item.data("size");
                li.item.clone(true).removeClass("col-md-2").addClass(content).css("margin", "0").insertAfter(li.item);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                //li.item.attr("id", id);
                $(this).sortable('cancel');
            }
            else if (li.item.data("ParentID") == "layouts") {
                //var id = li.item.attr("id");
                //var trimmedid = id.substring(0, 1);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                alert("Hi");
                var content = li.item.data("layout");
                $('#working_area').append(content);
                $(this).sortable('cancel');
                $(document).trigger("ready");
                $('#working_area').children().each(function () {
                    $(this).removeClass("btn btn-success");
                    $(this).addClass("sorted_layout");
                    $(this).removeClass("ui-sortable-handle");
                });
                //li.item.clone(true).removeClass("col-md-2 btn btn-success ui-sortable-handle").removeAttr("data-layout").html(content).css("margin", "0").insertAfter(li.item);
                //trimmedid++;
                //id = trimmedid + "-" + id.substring(2);
                //li.item.attr("id", id);

            }


        }
    }).disableSelection();
}
function SelectTab() {
    $('#myTabs > ul').children().children('a[role="tab"]').each(function () {
        $(this).attr("data-toggle", "tab");
    });
    $('ul.nav-tabs').children().removeClass('active');
    $('a[href="#navigation"]').parent().addClass("active");
    $('div.tab-content').children().removeClass('active');
    $('#navigation').addClass("active");
    $('#add_Nav').addClass("in");
}
function SelectTabs() {
    $('#myTabs > ul').children().children('a[role="tab"]').each(function () {
        $(this).attr("data-toggle", "tab");
    });
    $('.active').each(function () {
        $(this).removeClass("active");
    });
    $('a[href="#navigation"]').parent().addClass("active");
    $('#navigation').addClass("active");
    $('#add_Nav').addClass("in");
}
function ActivateNewsTab(value) {
    $('#editNews > ul').children('.active').each(function () {
        $(this).removeClass("active");
    });
    $('#editNews').children().children('.active').each(function () {
        $(this).removeClass("active");
    });
    $('a[href="' + value + '"]').parent().addClass("active");
    $(value).addClass("active");
}

function ActivateNewsTabEdit(value) {
    $('#editNews > ul').children('.active').each(function () {
        $(this).removeClass("active");
    });
    $('#editNews').children().children('.active').each(function () {
        $(this).removeClass("active");
    });
    $('a[href="' + value + '"]').parent().addClass("active");
    $(value).addClass("active");
}
function OpenCollapse() {
    $('#myTabs > ul').children().children('a[role="tab"]').each(function () {
        $(this).attr("data-toggle", "tab");
    });
    $('.active').each(function () {
        $(this).removeClass("active");
    });
    $('.in').each(function () {
        $(this).removeClass("in");
    });
    $('a[href="#navigation"]').parent().addClass("active");
    $('#navigation').addClass("active");
    $('#edit_Nav').addClass("in");
}

function ActivatePanels() {
    $('#myTabs > ul').children().children('a[role="tab"]').each(function () {
        $(this).attr("data-toggle", "tab");
    });
    $('a[href="#basicInfo"]').parent().addClass("active");
    $('#basicInfo').addClass("active");
}

function OpenMainsTabs() {
    $('#myTabs > ul').children().children('a[role="tab"]').each(function () {
        $(this).attr("data-toggle", "tab");
    });
    $('a[href="#basicInfo"]').parent().addClass("active");
    $('#basicInfo').addClass("active");
}

function OpenPageTab() {

    $('#myTabs > ul').children('.active').each(function () {
        $(this).removeClass('active');
    });
    $('#myTabs').children('div').children('.active').each(function () {
        $(this).removeClass('active');
    });
    $('#myTabs > ul').children().children('a[role="tab"]').each(function () {
        $(this).attr("data-toggle", "tab");
    });
    //$('.active').each(function () {
    //    $(this).removeClass("active");
    //});
    $('a[href="#pages"]').parent().addClass("active");
    $('#pages').addClass("active");

}

function SaveLayout(content, name, id) {
    var contents = content + "SPLIT" + name + "SPLITPageSPLIT" + id;
    $.ajax({
        url: "../../Components/PageTemplate/LayoutSave.ashx",
        type: "POST",
        contentType: false,
        processData: false,
        data: contents,
        success: function (result) {
            $('#working_area').html(result);
            alert("Successfuly saved the layout!");
        },
        error: function (err) {
            alert(err.statusText)
        }
    });
}

function RetriveLayout(LayoutName, PageName, DreamID) {
    $.ajax({
        url: "../../Components/PageTemplate/LayoutRetrive.ashx?TemplateName=" + LayoutName,
        type: "POST",
        contentType: false,
        processData: false,
        success: function (result) {
            SaveLayout(result, PageName, DreamID);
        },
        error: function (err) {
            alert(err.statusText)
        }
    });
}

function OpenTab(data) {
    // var result = document.getElementsByClassName(data);
    // var p = data[0];
    // x = result[0].parentElement;

    //$('#myTabs > ul').children('.active').each(function () {
    //     $(this).removeClass('active');
    // });
    // $('#myTabs').children('div').children('.active').each(function () {
    //     $(this).removeClass('active');
    // });
    //// $('#myTabs > ul').children().children('a[role="tab"]').each(function () {
    ////     $(this).attr("data-toggle", "tab");
    //// });
    //// //$('.active').each(function () {
    //// //    $(this).removeClass("active");
    // // //});

    // result[0].parentElement;
    // result.addClass("active");
}

function ChangeAuthorization() {

}

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
function OpenBasicInfo(data)
{
    document.getElementsByName('Page_Preview')[0].src = data;
    $('.page_frame').css('display', 'block');
    $('#content_item').css('display', 'none');
}
function OpenUmrahDetail(data) {
    
    document.getElementsByName('Page_Preview')[0].src = data;
    $('.page_frame').css('display', 'block');
    $('#content_item').css('display', 'none');
}