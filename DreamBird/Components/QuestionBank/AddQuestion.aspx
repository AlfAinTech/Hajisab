<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddQuestion.aspx.cs" Inherits="Components_QuestionBank_AddQuestion" %>

<%@ Register Src="~/Components/QuestionBank/QuestionTypeList.ascx" TagPrefix="uc1" TagName="QuestionTypeList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12" style="padding: 0;">
        <div class="col-md-3" id="side-nav">
            <div class="col-md-12" style="float: right">
                <asp:LinkButton ID="AddQuestion" CssClass="btn btn-primary" Style="float: right; width: 100%;" PostBackUrl="~/Components/QuestionBank/QuestionBankAdmin.aspx" runat="server">Question Bank</asp:LinkButton>
            </div>
            <br /><br /><br />
            <asp:Repeater ID="rptr_typeList" runat="server">
                <HeaderTemplate>
                    <ul class="nav nav-stacked" role="tablist">
                </HeaderTemplate>
                <ItemTemplate>
                    <li role="presentation">
                        <asp:LinkButton ID="question_type" CssClass="list-group-item" OnClick="question_type_Click" runat="server" data-typeid='<%# Eval("id") %>' aria-controls='<%# Eval("QTypeName") %>' role="tab"><%# Eval("QTypeName") %></asp:LinkButton></li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="col-md-9" style="padding: 0;">
            <iframe id="AddPage" runat="server" style="width: 100%; height: 500px; overflow-y: auto; border: none;"></iframe>
        </div>
    </div>
</asp:Content>

