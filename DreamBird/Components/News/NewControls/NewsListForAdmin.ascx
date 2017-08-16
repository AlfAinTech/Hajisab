<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsListForAdmin.ascx.cs" Inherits="Components_News_NewControls_NewsListForAdmin" %>
<div class="col-md-12" style="min-height:400px;">
    <script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="LinkButton2" runat="server" link-value="1" CausesValidation="false" data-id="1" data-toggle="modal" data-target="#myModal" Text="Button" Style="display:none;"></asp:Button>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>

            
                <div class="col-md-3" style=" margin:15px 0 15px 0;">
                    <div>
                    <div class="col-md-12" style="padding:15px;">
                    <asp:Image ID="nav_img" runat="server" Width="100%" ImageUrl='<%#Eval("MediaItem.Path100") %>' />
                    </div>
                    <div class="col-md-12" style="background-color:#e6e6e6; height:50px; overflow:hidden;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                
                                <h5><asp:LinkButton Text ='<%#Eval("news_title")%>' ID="LinkButton1"  OnClick="LinkButton1_Click" CommandName='<%#Eval("id")%>' CausesValidation="false" runat="server" ></asp:LinkButton><asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>' Visible="false" /></h5>
                                

                            </ContentTemplate>
                        </asp:UpdatePanel>
                       
                    </div>
            </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>