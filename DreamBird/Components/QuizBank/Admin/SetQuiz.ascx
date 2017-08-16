<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SetQuiz.ascx.cs" Inherits="Components_QuizBank_Admin_SetQuiz" %>
<div class="col-md-12">
    <h4>Selected Quiz :</h4>
        <h3 style="background-color:#464646; color:white;"><asp:Label ID="QuizName" runat="server"></asp:Label></h3>
    <h3>Enter Additional Info</h3>
    <div class="col-md-3">
        <h4>Hint Options</h4>
        <asp:DropDownList ID="ddl_qopt" CssClass="form-control HintOpt" runat="server">
            <asp:ListItem Text="Normal Grading" Value="Normal"></asp:ListItem>
            <asp:ListItem Text="Negative Grading" Value="Negative"></asp:ListItem>
            <asp:ListItem Text="Zero Grading" Value="Zero"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="col-md-12" style="padding: 0;">
        <div class="col-md-3">
            <h4>Graded Quiz ?
                <asp:CheckBox ID="isGraded" runat="server" /></h4>
        </div>
        <div class="col-md-4">
            <div class="col-md-6">
                <h5>Total Marks</h5>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="TotalMarks" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="col-md-12" style="padding: 0;">
        <div class="col-md-3">
            <h4>Time Based ?
                <asp:CheckBox ID="isTimeBased" runat="server" /></h4>
        </div>
        <div class="col-md-4">
            <div class="col-md-6">
                <h5>Total Time (seconds)</h5>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="TotalTime" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="col-md-12" style="padding: 0;">
        <div class="col-md-3">
            <h4>Number of Questios in the Quiz:</h4> </div>
        <div class="col-md-1">
               <h4><asp:Label ID="no_of_questions" runat="server"></asp:Label></h4> 
        </div>
    </div>
    <div class="col-md-12" style="padding: 0;">
        <div class="col-md-5">
            <h4>Number of Questions to be shown to user</h4>
        </div>
        <div class="col-md-2">
            <asp:TextBox ID="visibleQuestions" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-12" style="padding: 0;">
        <div class="col-md-5">
            <h4>Number of Questions per page</h4>
        </div>
        <div class="col-md-2">
            <asp:TextBox ID="questionPerPage" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-12" style="padding: 0;">
        <div class="col-md-3">
            <asp:Button ID="SetQuiz" Width="100%" CssClass="btn btn-warning" OnClick="SetQuiz_Click" runat="server" Text="Set Quiz" />
        </div>
    </div>
</div>
