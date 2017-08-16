<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageQuiz.ascx.cs" Inherits="Components_QuizBank_Admin_ManageQuiz" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Components/MediaBank/MediaSelection.ascx" TagPrefix="uc1" TagName="MediaSelection" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:HiddenField ID="quizid" runat="server" Value="0" />
<div class="col-md-12">
    <div class="col-md-3">
        <h4>Quiz Name</h4>
        <asp:TextBox ID="QuizName" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_QuizName" ControlToValidate="QuizName" ValidationGroup="AddQuiz" runat="server" ErrorMessage="Field Required"></asp:RequiredFieldValidator>
    </div>
    <div class="col-md-3">
        <h4>Quiz Category</h4>
        <asp:DropDownList ID="ddl_cat" CssClass="form-control" runat="server"></asp:DropDownList>
    </div>
</div>
<div class="col-md-12">
    <div class="col-md-6">
        <h4>Quiz Description</h4>
        <asp:TextBox ID="QuizDescription" TextMode="MultiLine" Height="200px" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_QuizDescription" runat="server" ValidationGroup="AddQuiz" ErrorMessage="Field Required" ControlToValidate="QuizDescription"></asp:RequiredFieldValidator>

    </div>
    <div class="col-md-6">
        <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
            <ProgressTemplate>
                <div class="modal" style="display: block">
                    <div class="center">
                        <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Image ID="quizmedia" Width="200px" Height="200px" Style="padding: 10px;" runat="server" />
                <asp:TextBox ID="mediaIdHolder" runat="server" Style="display: none;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_mediaIdHolder" runat="server" ValidationGroup="AddQuiz" ErrorMessage="Image Required" ControlToValidate="mediaIdHolder"></asp:RequiredFieldValidator>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="select_media" runat="server" Text="Select Media" CssClass="btn btn-default" />
        <asp:ModalPopupExtender ID="popup_media" TargetControlID="select_media" PopupControlID="media_panel" runat="server">
        </asp:ModalPopupExtender>
        <asp:Panel ID="media_panel" runat="server" Style="width: 95vw; height: 90vh;">
            <uc1:MediaSelection runat="server" ID="MediaSelection" ShowImageTypeMedia="true" OncloseMediaBank="MediaSelection_closeMediaBank" OnMyEvents="MediaSelection_MyEvents" OnMediaSelectedEvent="MediaSelection_MediaSelectedEvent" />
        </asp:Panel>
    </div>
</div>
<div class="col-md-12" style="margin-top: 15px;">
    <div class="col-md-3">
        <asp:Button ID="save_Quiz" runat="server" OnClick="save_Quiz_Click" Text="Save Quiz & Select Questions" ValidationGroup="AddQuiz" CssClass="btn btn-default" />
    </div>
    <div class="col-md-3">
        <a href="#" id="select_Questions" class="btn btn-primary" runat="server" visible="false">Select Questions</a>
    </div>
</div>
<div class="col-md-12">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Repeater ID="rptr_quizQuestions" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-md-6" style="margin-top: 10px; margin-bottom: 5px;">
                        <div class="col-md-12" style="padding: 15px; background-color: #e6e6e6">
                            <div class="col-md-8">
                                <h5><%# Eval("QuestionBank.QuestionText") %></h5>
                            </div>
                            <div class="col-md-2">
                                <asp:CheckBox ID="isActive" Checked='<%# Eval("isActive") %>' data-qid='<%# Eval("id") %>' OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" runat="server" />
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="delete_quiz_question" OnClick="delete_quiz_question_Click" runat="server" Text="X" CssClass="btn btn-danger" CommandName='<%# Eval("id") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
