<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddControlCategory.ascx.cs" Inherits="Components_PageTemplate_AddControlCategory" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="collapse" id="collapseExample">

        <div class="col-md-12" style="padding: 0;">
            <div class="col-md-8">
                <asp:TextBox ID="cat_name" runat="server" CssClass="form-control" placeholder="Add Category Name"></asp:TextBox>
            </div>
            <div class="col-md-4" style="padding:0">
                <asp:Button ID="addCat" runat="server" Text="Add Category" CssClass="btn btn-default" Font-Size="Small" Height="34px" OnClick="Button1_Click" placeholder="Category Name" />
            </div>
        </div>
           </div>
    </ContentTemplate>
</asp:UpdatePanel>
