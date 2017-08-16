<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionBankAdmin.ascx.cs" Inherits="Components_QuestionBank_QuestionBankAdmin" %>
<%@ Register Src="~/Components/QuestionBank/QuestionTypeList.ascx" TagPrefix="uc1" TagName="QuestionTypeList" %>
<%@ Register Src="~/Components/QuestionBank/QuestionGrid.ascx" TagPrefix="uc1" TagName="QuestionGrid" %>

<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<div class="col-md-12" style="padding:0;">
    <div class="col-md-3" style="padding:0;" id="side-nav">
        <uc1:QuestionTypeList runat="server" ID="QuestionTypeList" OnTypeClicked="QuestionTypeList_TypeClicked" />
    </div>
    <div class="col-md-9" style="background-color:#e6e6e6; height:500px; overflow-y:auto;">
        <uc1:QuestionGrid runat="server" ID="QuestionGrid" />
    </div>
</div>