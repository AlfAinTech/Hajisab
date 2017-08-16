<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageAssignment.ascx.cs" Inherits="Components_Assignments_ManageAssignment" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<div class="col-md-12">
    <div class="col-md-6">
        <h5>Assignment Name</h5>
        <asp:TextBox ID="assignment_name" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-6">
        <h5>Assignment Category</h5>
        <asp:DropDownList ID="ddl_cat" CssClass="form-control" runat="server"></asp:DropDownList>
    </div>
    <div class="col-md-12">
        <h5>Assignment Statement</h5>
        <asp:TextBox ID="assignment_description" CssClass="form-control" TextMode="MultiLine" Height="200px" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-3">
        <asp:Button ID="save_assignment" OnClick="save_assignment_Click" runat="server" Text="Save" CssClass="btn btn-primary" />
    </div>
</div>
<div class="col-md-12">
    <h4>Submitted Assignments</h4>
    <asp:Repeater ID="rptr_user_assignments" OnItemDataBound="rptr_user_assignments_ItemDataBound" runat="server">
        <ItemTemplate>
            <div class="col-md-2">
                <asp:LinkButton ID="file_item" CssClass="file_thumb" Height="70px" Width="100%" Style="background-color: #e6e6e6;" runat="server" PostBackUrl='<%# Eval("UploadedFilePath") %>' OnClick="file_item_Click"><h1 style="vertical-align: bottom; margin-top:15px; font-size:3.5em; text-align: right; margin-bottom:5px; margin-right:5px;"><%# Eval("UploadedFileType") %></h1></asp:LinkButton>
                <a href='<%# "#"+Eval("UserID") %>' data-toggle="collapse" aria-expanded="false" aria-controls='<%# Eval("UserID") %>'>
                    <asp:Label ID="user_name" runat="server" Width="100%" Height="25px" Style="background-color: #00769c; color: white; vertical-align: middle; text-align: center;"></asp:Label></a>
                <div class="collapse" id='<%# Eval("UserID") %>''>
                    <div class="well">
                        <asp:TextBox ID="marks" Width="100%" runat="server" Text='<%# Eval("AssignmentResult") %>'></asp:TextBox>
                        <asp:Button ID="btn_save_marks" OnClick="btn_save_marks_Click" user-id=<%# Eval("UserID") %> aid='<%# Eval("AssignmentID") %>' CssClass="btn btn-danger" Width="100%" runat="server" Text="Save Marks" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
