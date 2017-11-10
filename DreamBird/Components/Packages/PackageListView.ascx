<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageListView.ascx.cs" Inherits="Components_Package_PackageListView" %>
<%@ Register Src="~/Components/Packages/PackageSearch.ascx" TagPrefix="uc1" TagName="PackageSearch" %>


        <asp:Panel ID="search_panel" runat="server">
            <uc1:PackageSearch runat="server" ID="PackageSearch" OnpackageSearch="packageSearched_PackageSearch" />
            <div class="col-md-2" style="padding: 15px 15px 15px 0; background-color: #404040; display: inline-block;">
                <asp:Button ID="add_btn" CssClass="btn btn-default" runat="server" CausesValidation="false" OnClick="add_btn_Click" Text="+" Visible="false" />
            </div>
        </asp:Panel>

        <div class="col-md-12">
            <asp:Repeater ID="Package_data_list" runat="server">
                <HeaderTemplate>
                    <div class="list-group">
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="PackageName" Text='<%# Eval("PackageName") %>' CssClass="list-group-item" CommandArgument='<%# Eval("id")%>' name='<%# Eval("id").ToString()+"_PackageButton" %>' OnClick="Package_btn_Click" CausesValidation="false" runat="server"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    </div>

                </FooterTemplate>
            </asp:Repeater>
              <h5>
        <asp:Label ID="errormessage" style="color:white" runat="server"></asp:Label></h5>
        </div>

<%--<asp:DataList ID="Dream_data_list" runat="server" RepeatDirection="Horizontal"  RepeatColumns="1" Height="100%"  Width="100%" BorderColor="#666666" BorderWidth="1px" >
   <HeaderTemplate>
       
   </HeaderTemplate>
    <ItemTemplate>
                <asp:Button  ID="PackageName" runat="server" Height="27px" Text='<%# Eval("PackageName") %>'  CommandArgument='<%# Eval("id")%>' OnClick="dream_btn_Click" BackColor="White" BorderStyle="None" ForeColor="Black" />
       
    </ItemTemplate>
   <FooterTemplate>
   </FooterTemplate>

</asp:DataList>--%>


