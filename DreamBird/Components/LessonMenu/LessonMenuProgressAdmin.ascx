<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonMenuProgressAdmin.ascx.cs" Inherits="Components_LessonMenu_LessonMenuProgressAdmin" %>
<%@ Register Src="~/Components/LessonMenu/LessonMenuList.ascx" TagPrefix="uc1" TagName="LessonMenuList" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>

<div>

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#menu" aria-controls="#menu" role="tab" data-toggle="tab">Select Menu for Progress</a></li>
        <li role="presentation"><a href="#pages" aria-controls="pages" role="tab" data-toggle="tab">Select Page for Progress</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="menu">
            <uc1:LessonMenuList runat="server" ID="LessonMenuList1" OnmenuClicked="LessonMenuList1_menuClicked" />
        </div>
        <div role="tabpanel" class="tab-pane" id="pages">
            <uc1:LessonMenuList runat="server" ID="LessonMenuList" OnmenuClicked="LessonMenuList_menuClicked" />
        </div>
    </div>
</div>
