<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionGrid.ascx.cs" Inherits="Components_QuestionBank_QuestionGrid" %>
<div class="col-md-3" style="float:right; margin-top:10px; margin-bottom:10px;">
    <asp:LinkButton ID="AddQuestion" CssClass="btn btn-primary" Style="float:right; width:100%;" PostBackUrl="~/Components/QuestionBank/AddQuestion.aspx" runat="server">Add Question</asp:LinkButton>
</div>
<div class="col-md-12">
    <asp:Repeater ID="questionGrid" runat="server">
        <ItemTemplate>
            <div class="col-md-3" style="margin-top:15px; margin-bottom:15px;">
                <div class="col-md-12 QType<%# Eval("TypeID") %>" style="height:130px;">
                   <a href="#" onclick="window.open('<%# "../../"+Eval("QuestionType.EditTypeControl")+"?QID="+Eval("id") %>', 'mywin','left=20,top=20,width=500,height=500,toolbar=1,resizable=0');"><h4 style="color:white;"><%# Eval("QuestionText").ToString().PadRight(100).Substring(0,100).TrimEnd()+"..." %></h4></a> 
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>