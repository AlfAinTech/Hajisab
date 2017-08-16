<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FilterAssignments.ascx.cs" Inherits="Components_Assignments_FilterAssignments" %>
<h4 style="text-align: center;">Filter Assignments</h4>
<div class="col-md-12">
    <h5>Assignment Name</h5>
    <asp:TextBox ID="assignment_name" runat="server" CssClass="form-control"></asp:TextBox>

</div>
<div class="col-md-12">
    <h5>Category</h5>
    <asp:DropDownList ID="ddl_cat" CssClass="form-control" runat="server"></asp:DropDownList>
</div>
<div class="col-md-12">
    <h5>Dream</h5>
    <asp:DropDownList ID="ddl_dream" CssClass="form-control" runat="server"></asp:DropDownList>
</div>
<div class="col-md-12" style="margin-top: 15px;">
    <asp:Button ID="Button1" runat="server" Text="Filter Assignments" OnClick="Button1_Click" CssClass="btn btn-primary" />
</div>