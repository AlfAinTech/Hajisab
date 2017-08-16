<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuizBankAdmin.ascx.cs" Inherits="Components_QuizBank_QuizBankAdmin" %>
<%@ Register Src="~/Components/QuizBank/Admin/FilterQuiz.ascx" TagPrefix="uc1" TagName="FilterQuiz" %>
<%@ Register Src="~/Components/QuizBank/Admin/QuizGrid.ascx" TagPrefix="uc1" TagName="QuizGrid" %>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="col-md-12" style="padding: 0">
    <div class="col-md-3" id="side-nav">
        <uc1:FilterQuiz runat="server" ID="FilterQuiz" OnQuizSearched="QuizSearched" />
    </div>
    <div class="col-md-9" style="background-color: #e6e6e6; height: 500px; overflow-y: auto;">
        <div class="col-md-3" style="float: right; padding: 15px;">
            <a href="#" onclick="window.open('../../../Components/QuizBank/Admin/ManageQuiz.aspx', 'mywin','left=20,top=20,width=1300,height=600,toolbar=1,resizable=0');" class="btn btn-success" style="width: 100%;">Add New Quiz</a>
        </div>
        <uc1:QuizGrid runat="server" ID="QuizGrid" />
    </div>
</div>
