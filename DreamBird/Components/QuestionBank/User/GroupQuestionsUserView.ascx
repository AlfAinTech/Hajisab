﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GroupQuestionsUserView.ascx.cs" Inherits="Components_QuestionBank_User_GroupQuestionsUserView" %>
<h4>
    <asp:Label ID="Notification" runat="server"></asp:Label>
</h4>
<div class="q1" id="question" runat="server" visible="false">
    <div class="col-md-12" style="background-color: #e6e6e6; padding: 15px;">
        <h4>
            <asp:Label ID="QuestionHeading" runat="server"></asp:Label>
            <asp:TextBox ID="HF1" runat="server" Style="display: none;"></asp:TextBox>
            <h5><span id="fib_Correction" runat="server"></span></h5>
        </h4>
    </div>
    <div class="col-md-12">
        <asp:PlaceHolder ID="GroupQuestionPlaceholder" runat="server"></asp:PlaceHolder>
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
