<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FillInBlanksUserView.ascx.cs" Inherits="Components_QuestionBank_User_FillInBlanksUserView" %>
<div class="col-md-12">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h4>
                <asp:Label ID="Notification" runat="server"></asp:Label>
            </h4>
            <div class="q1" id="question" runat="server" visible="false">
                <div class="col-md-12" style="background-color: #e6e6e6; padding: 15px;">
                    <h4>Question 1</h4>
                    <h4>
                        <asp:Label ID="QuestionHeading" runat="server"></asp:Label>
                        <asp:TextBox ID="HF1" runat="server" Style="display:none;"></asp:TextBox>
                    </h4>
                </div>
               <div class="col-md-12" style="background-color: #e6e6e6; padding: 15px;">
                    <h4>Enter your answer here</h4>
                   <asp:TextBox ID="user_reply_fib" CssClass="form-control" runat="server"></asp:TextBox>
                   <h5><span id="fib_Correction" runat="server"></span></h5>
               </div>
               <div class="col-md-12" style="padding:0;">
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff;">
                        <asp:Button ID="submit_quiz" OnClick="submit_quiz_Click" CssClass="btn btn-primary" runat="server" Visible="false" Text="Submit Your Quiz" />
                    </div>
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff;"></div>
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff;">
                        <asp:Button ID="show_answer" ClientIDMode="Static" CssClass="btn btn-danger" Visible="false" runat="server" Text="Button" />
                    </div>
                    <div class="col-md-3" style="background-color: #e6e6e6; padding: 15px; border: 3px solid #fff; float:right;">
                        <button id="show_hint" class="btn btn-warning">Show Hint</button>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</div>