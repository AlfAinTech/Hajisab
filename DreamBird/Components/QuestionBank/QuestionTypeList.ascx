<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionTypeList.ascx.cs" Inherits="Components_QuestionBank_QuestionTypeList" %>
<div class="col-md-12" style="padding: 15px;">
    <button class="btn btn-primary" type="button" data-toggle="collapse" style="width: 100%" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
    </button>
    <div class="collapse" id="collapseExample">
        <div class="well" style="height: 270px;">
            <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                <asp:TextBox ID="TypeName" placeholder="Add Type Name" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="menuName_validator" ValidationGroup="QCategory" runat="server" ErrorMessage="enter Control Name" ForeColor="Red" ControlToValidate="TypeName"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ControlToValidate="TypeName" ValidationGroup="QCategory" ValidationExpression="([a-z]|[A-Z]|[0-9])*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Special characters not allowed"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                <asp:TextBox ID="EditControlPath" CssClass="form-control" placeholder="Add Edit Control Path" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="QCategory" runat="server" ErrorMessage="Field Required" ForeColor="Red" ControlToValidate="EditControlPath"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                <asp:TextBox ID="ViewControlPath" CssClass="form-control" placeholder="Add View Control Path" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="QCategory" runat="server" ErrorMessage="Field Required" ForeColor="Red" ControlToValidate="ViewControlPath"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                <asp:Button ID="add_qtype" runat="server" OnClick="add_qtype_Click" Text="Add Question Type" ValidationGroup="QCategory" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</div>
<div class="col-md-12" style="padding: 0;">
    <asp:Repeater ID="rptr_QuestionTypes" runat="server">
        <HeaderTemplate>
            <div class="list-group">
        </HeaderTemplate>
        <ItemTemplate>
            <h4>
                <a class="list-group-item">
                    <asp:CheckBox ID="questionType" OnCheckedChanged="questionType_CheckedChanged" runat="server" data-id='<%# Eval("id") %>' AutoPostBack="true" /><%# Eval("QTypeName") %> </h4>
            </a>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</div>
