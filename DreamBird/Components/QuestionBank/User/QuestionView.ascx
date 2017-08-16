<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionView.ascx.cs" Inherits="Components_QuestionBank_User_QuestionView" %>
<%@ Register Src="~/Components/Timer/Timer.ascx" TagPrefix="uc1" TagName="Timer" %>

<uc1:Timer runat="server" ID="Timer" />
<asp:PlaceHolder ID="quizrender" runat="server"></asp:PlaceHolder>
