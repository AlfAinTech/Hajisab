jQuery(document).ready(function ($) {
    closeModal();
    $('#load_more').click(function (e) {
        //alert("The Data will be appended on this event");
        e.preventDefault();
    });
    $(document).on('click', '.next-previous', function () {
        var MenuID = $(this).data("menuid");
        $('#ListItem_' + MenuID).children("a").click();
    });
});
jQuery(document).ready(function ($) {
    $(document).on('click', '.next_page', function (e) {
        e.preventDefault();
        var url = window.location.href;
        var CurrentPage = getParameterByName("PageNumber", url);
        if (CurrentPage == MyArray.length) {
            window.location.href = MyArray[0];
        }
        else {
            window.location.href = MyArray[CurrentPage];
        }
    });
    $(document).on('click', '.previous_page', function (e) {
        e.preventDefault();
        var url = window.location.href;
        var CurrentPage = getParameterByName("PageNumber", url);
        if (CurrentPage == 1) {
            window.location.href = MyArray[MyArray.length - 1];
        }
        else {
            window.location.href = MyArray[CurrentPage - 2];
        }
    });
    $(document).on('click', '.menu_link', function (e) {
        var MenuID = $(this).parent().attr("id");
        var Source = $(this).attr("src");
        $.ajax({
            type: "POST",
            url: "../../Components/LessonMenu/CheckPreReq.ashx?MenuID="+MenuID,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.length == 0)
                {
                    $('#notification_panel').html("");
                    var Message = $.hub.message(Source);
                    $.hub.publish("page_nav", Message);
                }
                else
                {
                    RenderMenu(result);
                }
               
            },
            failure: function (response) {
                alert(response.d);
            }
        });

        //var CheckPreRequisite = false;
        //if (CheckPreRequisite)
        //{
        //    
        //}
        //else
        //{
        //    alert("Complete the Pre-Requisite First, You Moron!!!")
        //}
        
    });

    $.hub.subscribe("page_nav", function (channel, message) {
        var MessageSource = JSON.parse(message.body);
        //$.post(MessageSource[0].Value, function (data) {
        //    $("#Content_area").html(data);
        //});
        $('#page_frame').attr("src", MessageSource[0].Value+"?PageNumber=1").css("display", "block");
        calcHeight();
        if (objs[3] == "Hide") {
            $("#next_previous").css("display", "none");
        }
        else if (MessageSource[3].Value == "Show") {
            $("#next_previous").css("display", "block");
            if (MessageSource[1].Value != "Undefined") {
                $('#next').attr("data-MenuID", objs[1]);
                $('#next').css("display", "block");
            }
            else {
                $('#next').css("display", "none");
            }
            if (MessageSource[2].Value != "Undefined") {
                $('#previous').css("display", "block");
                $('#previous').attr("data-MenuID", objs[2]);
            }
            else {
                $('#previous').css("display", "none");
            }
        }
    });
    $.hub.subscribe("OutMenu", function (channel, message) {
        var MessageBody = message.body;
        $("a[href='#parent_menu_" + MessageBody.QueryString + "']").click().parent().addClass("active");
    });
    $(document).on('click', '.CustomLinks', function (e) {
        e.preventDefault();
        var LinkUrl = $(this).attr("href");
        var LinkToHighLite = getParameterByName("FID", LinkUrl);
        var Message = $.hub.message({ 'URL': LinkUrl, 'QueryString': LinkToHighLite });
        
        $.hub.publish("Menu", Message);
    });

    $.hub.subscribe("Menu", function (channel, message) {
        var MessageBody = message.body;
        window.parent.$("a[href='#parent_menu_" + MessageBody.QueryString + "']").click().parent().addClass("active");
    });

    $.hub.subscribe("PagedHref", function (channel, message) {
        var URL = message.body;
        alert(window.parent.$('#page_frame').attr("src"));
    });

    $("[data-toggle='toggle']").click(function () {
        //alert("hello");
        var selector = $(this).data("target");
        $(selector).toggleClass('in');

    });
    $('#hint').click(function () {
        $('#freq').css('background-color', '#c1b527');
    });

    $(document).on('click', '#show_answer', function (e) {
        e.preventDefault();
        var QuizID = 0;
        if ($('input[type="text"][data-class="QuizID"]') != undefined) {
            QuizID = $('input[type="text"][data-class="QuizID"]').val();
        }
        var Qid = $(this).parent().parent().parent().parent().find('span[qid]').attr("qid");
        var pathname = window.location.pathname;
        $.ajax({
            type: "POST",
            url: "../../Components/QuestionBank/Content/Answer_Identifier.ashx?QID=" + Qid + "&&Path=" + pathname + "&&QuizID=" + QuizID,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (result) {
                HighlightAnswers(result);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });
    jQuery(document).on('click', '#show_hint', function (e) {
        e.preventDefault();

        var QuizID = 0;
        if ($('input[type="text"][data-class="QuizID"]') != undefined) {
            QuizID = $('input[type="text"][data-class="QuizID"]').val();
        }
        var Qid = $(this).parent().parent().parent().parent().find('span[qid]').attr("qid");
        var pathname = window.location.pathname;
        $.ajax({
            type: "POST",
            url: "../../Components/QuestionBank/HintIdentifier.ashx?QID=" + Qid + "&&Path=" + pathname + "&&QuizID=" + QuizID,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (result) {
                HighlightHits(result);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });


    $(".nav a").on("click", function () {
        $(".nav").find(".active").removeClass("active");
        $(this).parent().addClass("active");
        var sibling = $(this).parent().siblings();
        $(sibling).each(function () {
            $(this).find('a').addClass('collapsed');
            $(this).children().removeClass('collapse in');
            $(this).children().addClass('collapse');
            //$(this).find('a').trigger('click');
        });
        // console.log(child.length);
        //  .trigger('click');
    });

});

function RenderMenu(value)
{
    var Obj = value;
    var StringToRender = "You have the following menus pending, "
    $.each(Obj, function (key, value) {
        var LinkToRender = "<a href='../DreamHome?FID="+value.MenuID+"' class='CustomLinks'>" + value.MenuName + "</a>, ";
        StringToRender = StringToRender + LinkToRender;
    });
    StringToRender = StringToRender + ". In order to continue, progress these menu first."
    $('#notification_panel').html(StringToRender);
}

function OpenDefaultMenu(value)
{
    jQuery(document).ready(function ($) {
        var LinkUrl = "../DreamHome.aspx";
        var LinkToHighLite = value;
        var Message = $.hub.message({ 'URL': LinkUrl, 'QueryString': "1074" });
        $.hub.publish("OutMenu", Message);
    });
   
}

function OpenMenu(value) {
    $('#ListItem_' + value).children("a").click();
}
//upload page in ifram when menu clicked
uploadPage = function (src) {

    var objs = jQuery.parseJSON(src);

    if (objs[0] != "Undefined") {
        //   removeClass('active');
        openModal();
        // console.log(src);
        $('.next-previous').each(function () {
            $(this).removeAttr("disabled");
        });
        window.parent.document.getElementsByClassName("LessonMenu_PageFrame")[0].src = "";
        var doc = window.parent.document.getElementsByClassName("LessonMenu_PageFrame")[0];
        //  doc.onload = "openModal()";

        window.parent.document.getElementsByClassName("LessonMenu_PageFrame")[0].src = objs[0];
        $('#next_previous').removeAttr("style");

    }


    $("html, body").animate({ scrollTop: 0 }, 600);
    console.log("i am printintg here");
    calcHeight();
    return false;
}
//calculate height for iframe
function calcHeight() {
    //find the height of the internal page
    //var the_height = 0;
    //document.getElementById('page_frame').height = 0;
    //the_height = document.getElementById('page_frame').contentWindow.document.body.scrollHeight;
    //// the_height = doc.body.scrollHeight;

    ////change the height of the iframe
    ////alert(the_height);
    //document.getElementById('page_frame').height =
    //the_height + "px";


    var iframe = document.getElementById("page_frame").contentWindow;
    $("#page_frame").css({ height: iframe.document.body.scrollHeight + "px" });
}
//Load Parent Menu From ifram TAG Button
SelectMenu = function (src, id) {
    openModal();
    window.parent.document.getElementsByClassName("LessonMenu_PageFrame")[0].src = "";
    window.parent.document.getElementsByClassName("LessonMenu_PageFrame")[0].src = src;
    var li = window.parent.document.getElementById("ListItem_" + id);
    //.window.parent.document.getElementById("ListItem_2").firstElementChild.click();
    li.firstElementChild.click();

    console.log(li.firstElementChild.innerHTML);

    closeModal();
    return false;
}

function openModal() {
    window.parent.document.getElementsByClassName("LessonMenu_PageFrame")[0].src = "";
    // alert("here");

    window.parent.document.getElementsByClassName("loading")[0].style.display = "block";
    console.log(window.parent.document.getElementsByClassName("loading")[0]);

}

function closeModal() {
    var data = window.parent.document.getElementsByClassName("loading")[0];
    if (data != null) {
        data.style.display = 'none';
    }
}
function showPopupPanel() {
    var data = document.getElementById("myModal");
    data.classList.add("in");
    data.style.display = "block";
}
function HighlightHits(value) {
    $('span[qidspan=' + value.QuestionID + ']').html(value.CorrectionOption);
}

function HighlightAnswers(value) {

    if (value.Qtype == "MCQ's") {
        var objs = value.CorrectOptions;
        for (var i = 0; i < objs.length; i++) {
            $('span[data-opid = "' + objs[i] + '"]').parent().css("background-color", "#e65413");
        }
    }
    else if (value.Qtype == "FillInBlanks") {
        $('span[qidspan="' + value.QID + '"]').html(value.Answer);
    }
}


function getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}