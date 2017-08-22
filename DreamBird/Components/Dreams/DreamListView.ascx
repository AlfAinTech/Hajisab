<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamListView.ascx.cs" Inherits="Components_Dreams_DreamListView" %>
<%@ Register Src="~/Components/Dreams/DreamSearch.ascx" TagPrefix="uc1" TagName="DreamSearch" %>

        <asp:Panel ID="search_panel" runat="server">
            <uc1:DreamSearch runat="server" ID="DreamSearch" OndreamSearch="dreamSearched_DreamSearch" />
            <div class="col-md-2" style="padding: 15px 15px 15px 0; background-color: #404040; display: inline-block;">
                <asp:Button ID="add_btn" CssClass="btn btn-default" runat="server" CausesValidation="false" OnClick="add_btn_Click" Text="+" />
            </div>
        </asp:Panel>

        <div class="col-md-12">
            <asp:Repeater ID="Dream_data_list" runat="server">
                <HeaderTemplate>
                    <div class="list-group">
                </HeaderTemplate>
                <ItemTemplate>

                    <asp:LinkButton ID="dreamName" Text='<%# Eval("DreamName") %>' CssClass="list-group-item" CommandArgument='<%# Eval("id")%>' name='<%# Eval("id").ToString()+"_PackageButton" %>' OnClick="dream_btn_Click" CausesValidation="false" runat="server"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    </div>

                </FooterTemplate>
            </asp:Repeater>
        </div>

<%--<asp:DataList ID="Dream_data_list" runat="server" RepeatDirection="Horizontal"  RepeatColumns="1" Height="100%"  Width="100%" BorderColor="#666666" BorderWidth="1px" >
   <HeaderTemplate>
       
   </HeaderTemplate>
    <ItemTemplate>
                <asp:Button  ID="dreamName" runat="server" Height="27px" Text='<%# Eval("DreamName") %>'  CommandArgument='<%# Eval("id")%>' OnClick="dream_btn_Click" BackColor="White" BorderStyle="None" ForeColor="Black" />
       
    </ItemTemplate>
   <FooterTemplate>
   </FooterTemplate>

</asp:DataList>--%>


