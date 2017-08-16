<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LessonVideoAdmin.aspx.cs" Inherits="Components_LessonBank_Lesson_LessonVideoAdmin" MasterPageFile="~/AdminBlank.master" %>
  <%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>--%>

<%@ Register Src="~/Components/LessonBank/Lesson/LessonVideoAdmin.ascx" TagPrefix="uc1" TagName="LessonVideoAdmin" %>

     <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

   
        
        <%--<uc1:LessonVideoAdmin runat="server" ID="LessonVideoAdmin" />--%>
                  
       <uc1:MediaBankControl ID="MediaBankControl1" runat="server" ShowAudioTypeMedia="true" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" ShowTranscriptOptions="true"  />
    

        </asp:Content>
