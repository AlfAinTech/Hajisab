<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddNewsDream.ascx.cs" Inherits="Components_News_AddNewsDream" %>
<div class="col-md-9" style="padding:0; margin-right:auto; margin-left:auto; float:none;">
    <div class="col-md-8" style="padding:15px 0 15px 0;;">
        <asp:TextBox ID="tb_dream_search" runat="server" CssClass="form-control" placeholder="Search Dream"></asp:TextBox>
    </div>
    <div class="col-md-4" style="padding:15px 0 15px 0;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="cmd_dream_search" runat="server" Text="Search" CausesValidation="False" CssClass="btn btn-default" OnClick="cmd_dream_search_Click" />
                    </ContentTemplate>

                </asp:UpdatePanel>
    </div>
    </div>
    <div class="col-md-12">
        <asp:Repeater ID="dl_dream" runat="server">
         <ItemTemplate>
             <div class="col-md-4">
                 <div class="col-md-2" style="padding:5px;">
                     <asp:CheckBox ID="cb_is_add" runat="server"  /><asp:Label ID="lblID" runat="server" Text='<%# Eval("id") %>' Visible="false"/>
                 </div>
                 <div class="col-md-4" style="padding:5px;">
                     <asp:Image ID="img_dream" runat="server" Width="100%" ImageUrl='<%#Eval("MediaItem.path") %>' />
                 </div>
                 <div class="col-md-6" style="padding:5px;">
                     <%# DataBinder.Eval(Container.DataItem,"DreamName") %>
                 </div>
             </div>
    </ItemTemplate>
    </asp:Repeater>
    </div>
    <div class="col-md-12">
        
        <div class="col-md-6" >
                               <%--<asp:Button ID="cmd_add_dream" runat="server" Text="Add" CssClass="btn btn-default" OnClick="cmd_add_dream_Click" />--%>
                            </div>
        <div class="col-md-6">
                                <a href="#" id="next_publishingOptions" class="btn btn-default">Next</a>
                            </div>
       
         
    </div>