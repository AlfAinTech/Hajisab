<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SharedTextDetail.ascx.cs" Inherits="Components_TextBank_SharedTextDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/Tags/TagControl.ascx" TagPrefix="uc1" TagName="TagControl" %>

<div class="col-md-12">
    <div class="dropdown">
        <button id="viewRelated" class="btn btn-default" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            View related Dreams
    <span class="caret"></span>
        </button>
        <div class="dropdown-menu" aria-labelledby="viewRelated">
            <div class="col-md-12">
                <div class="col-md-12">
                    <asp:DataList ID="RelatedDream_list" runat="server" Height="38px" RepeatDirection="Horizontal" Width="664px">
                        
                        <ItemTemplate>
                            <div class="col-md-6">
                                <h3 style="color: #278ac1;">
                                    <asp:Label ID="dream_name" Text='<%# Eval("DreamLayout.Dream.dreamName") %>' runat="server"></asp:Label></h3>
                                <h4 style="color: #81c82e;">
                                    <asp:Label ID="Page_name" Text='<%# Eval("DreamLayout.Page") %>' runat="server"></asp:Label></h4>
                                <asp:Label ID="dream_id" Text='<%# Eval("id") %>' runat="server" Visible="false"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
</div>

