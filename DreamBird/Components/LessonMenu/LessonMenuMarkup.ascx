<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonMenuMarkup.ascx.cs" Inherits="Components_LessonMenu_LessonMenuMarkup" %>




<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
    <ItemTemplate>
        <li role="presentation" id="ListItem_<%# Eval("id")%>">
            <asp:LinkButton ID="HyperLink1" CssClass="menu_link" runat="server" data-toggle="collapse" data-target=".navbar-ex1-collapse" href="" Style="margin-bottom: 0px;" role="tab">
                <span class="nav-header-primary"  ><%# Eval("displayName") %></span>
            </asp:LinkButton>
            <div class="collapse" id="parent_menu_<%# Eval("id")%>">
                <div style="padding-left: 20px; background-color: #e6e6e6;">
                    <%--<ul class=" nav-secondary nav-list collapse" style="padding-left: 20px;" id="parent_menu_<%# Eval("id")%>">--%>
                    <ul class="nav">
                        <asp:PlaceHolder ID="placeHolderContainer" runat="server"></asp:PlaceHolder>
                    </ul>
                    <%--</ul>--%>
                </div>
            </div>
        </li>
    </ItemTemplate>
</asp:Repeater>
