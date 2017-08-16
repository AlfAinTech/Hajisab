<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultiFIBUserView.ascx.cs" Inherits="Components_QuestionBank_User_MultiFIBUserView" %>
<div class="col-md-12">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="HF1" runat="server" Style="display: none;"></asp:TextBox>
            <asp:HiddenField ID="questionid" runat="server" />
            <h4>
                <asp:Label ID="Notification" runat="server"></asp:Label>
            </h4>
            <div class="q1" id="question" runat="server" visible="false">
                <div class="col-md-12" style="background-color: #e6e6e6; padding: 15px;">
                    <asp:PlaceHolder ID="ComponentHolder" runat="server"></asp:PlaceHolder>
                </div>
                <div class="col-md-12" style="padding: 0;">
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff;">
                        <asp:Button ID="submit_quiz" OnClick="submit_quiz_Click" CssClass="btn btn-primary" runat="server" Visible="false" Text="Submit Your Quiz" />
                    </div>
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff;"></div>
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff;">
                        <asp:Button ID="show_answer" CssClass="btn btn-warning" ClientIDMode="Static" runat="server" Text="Show Answer" Visible="false" />
                    </div>
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff; float: right;">
                        <button id="show_hint" class="btn btn-warning">Show Hint</button>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
