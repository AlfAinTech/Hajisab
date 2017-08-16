<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonQuiz.ascx.cs" Inherits="Components_LessonBank_Lesson_LessonQuiz" %>
<div style="width: 393px">
<asp:Label ID="Question" runat="server" >The world's highest mountain is in __________.</asp:Label>
<%--<br />
<asp:RadioButton ID="option1" runat="server"  ValidationGroup="option" Text="China" />
<br />
<asp:RadioButton ID="option2" runat="server" ValidationGroup="option"  Text="Pakistan"/>
<br />
<asp:RadioButton ID="option3" runat="server" ValidationGroup="option" Text="Nepal" />
<br />
<asp:RadioButton ID="option4" runat="server" ValidationGroup="option" Text="India" />--%>
<asp:RadioButtonList ID="RadioButtonList1" RepeatColumns="1"
    RepeatDirection="Vertical" RepeatLayout="Table" runat="server">
    <asp:ListItem>China</asp:ListItem>
    <asp:ListItem>Pakistan</asp:ListItem>
    <asp:ListItem>Nepal</asp:ListItem>
    <asp:ListItem>India</asp:ListItem>
</asp:RadioButtonList>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
    ControlToValidate="RadioButtonList1" Text="Required">
</asp:RequiredFieldValidator>
<br />
<br />
<div style="float:right">
<asp:Button ID="submit_quiz" runat="server" Text="Submit" OnClick="submit_quiz_Click" />
    </div>
    </div>