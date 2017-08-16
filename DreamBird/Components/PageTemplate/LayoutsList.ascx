<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LayoutsList.ascx.cs" Inherits="Components_PageTemplate_LayoutsList" %>
<asp:Repeater ID="repeat_layouts" runat="server">
    <ItemTemplate>
        <div class="col-md-2 btn btn-success" data-layout="<%# Eval("layoutContent") %>" style="">
            <h4 style="margin: 0;"><%# Eval("layoutName") %></h4>
            <span class="glyphicon glyphicon-asterisk handle" aria-hidden="true" style="position: absolute; top: 2px; left: 4px;"></span>
        </div>
    </ItemTemplate>
</asp:Repeater>
