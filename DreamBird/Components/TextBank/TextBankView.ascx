<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TextBankView.ascx.cs" Inherits="Components_TextBank_TextBankView" %>
<%@ Register Src="~/Components/LessonBank/Lesson/LessonMultiMedia.ascx" TagPrefix="uc1" TagName="LessonMultiMedia" %>


<asp:Literal ID="literalHTML" runat="server"></asp:Literal>
<div style="width:90%;">
    <div style="float:right">
<asp:Button ID="save_progress" runat="server" Text="Mark As Read" OnClick="save_progress_Click" CssClass="btn btn-default" />
<asp:Label ID="completed" runat="server" Text="Completed!" Visible="False" style="color:green"></asp:Label>
</div></div>

