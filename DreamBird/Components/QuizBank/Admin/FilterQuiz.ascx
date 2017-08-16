<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FilterQuiz.ascx.cs" Inherits="Components_QuizBank_Admin_FilterQuiz" %>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Filter Quiz Bank</h3>
    </div>
    <div class="col-md-12" style="margin-bottom: 5px; margin-top:15px;">
        <h4 style="color: white;">Quiz Name</h4>
        <asp:TextBox ID="quizName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-md-12" style="margin-bottom: 5px;">
        <h4 style="color: white;">Quiz Category</h4>
        <asp:DropDownList ID="ddl_qcat" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>
    <div class="col-md-12" style="margin-bottom: 5px;">
        <asp:Button ID="search_quiz" CssClass="btn btn-default" OnClick="search_quiz_Click" runat="server" Text="Search" />
    </div>
</div>
