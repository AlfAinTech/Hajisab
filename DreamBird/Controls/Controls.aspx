<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Controls.aspx.cs" Inherits="Controls_Controls" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
     <script   src="https://code.jquery.com/jquery-2.2.4.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="EntityDataSource1" Height="50px" OnItemInserting="DetailsView1_ItemInserting" Width="450px">
            <EmptyDataTemplate>
                <asp:Button ID="Button1" runat="server" Text="Add Controls" OnClick="BtnClick"/>
            </EmptyDataTemplate>
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="Name" DataValueField="Name">
                        </asp:DropDownList>
                        <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=DreamBirdEntities" DefaultContainerName="DreamBirdEntities" EnableFlattening="False" EntitySetName="ControlCategories" EntityTypeFilter="ControlCategory">
                        </asp:EntityDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ControlCategory_id") %>' CssClass="form-control"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IconURL" SortExpression="IconURL">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("IconURL") %>'> CssClass="form-control"</asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("IconURL") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NormalMarkup" SortExpression="NormalMarkup">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("NormalMarkup") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Height="104px" Text='<%# Bind("NormalMarkup") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("NormalMarkup") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OnEditMarkup" SortExpression="OnEditMarkup">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("OnEditMarkup") %>' CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Height="149px" Text='<%# Bind("OnEditMarkup") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("OnEditMarkup") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OnSettingChangedMarkup" SortExpression="OnSettingChangedMarkup">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("OnSettingChangedMarkup") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("OnSettingChangedMarkup") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("OnSettingChangedMarkup") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AdminControlName" SortExpression="AdminControlName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("AdminControlName") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Height="61px" Text='<%# Bind("AdminControlName") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("AdminControlName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DefautControlName" SortExpression="DefautControlName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("DefautControlName") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Height="87px" Text='<%# Bind("DefautControlName") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("DefautControlName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=DreamBirdEntities" DefaultContainerName="DreamBirdEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="HTMLControls" EntityTypeFilter="HTMLControl">
        </asp:EntityDataSource>
    </div>
    </form>
</body>
</html>
