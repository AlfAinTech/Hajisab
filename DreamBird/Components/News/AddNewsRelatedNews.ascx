<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddNewsRelatedNews.ascx.cs" Inherits="Components_News_AddNewsRelatedNews" %>

<div class="col-md-9" style="padding:0; margin-right:auto; margin-left:auto; float:none;">
    <div class="col-md-8" style="padding:15px 0 15px 0;;">
        <asp:TextBox ID="tb_related_news_search" runat="server" CssClass="form-control" placeholder="Search News"></asp:TextBox>
    </div>
    
    <div class="col-md-4" style="padding:15px 0 15px 0;">
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="cmd_related_news_search" runat="server" Text="Search" CausesValidation="False" CssClass="btn btn-default" OnClick="cmd_related_news_search_Click" />
                    </ContentTemplate>

                </asp:UpdatePanel>
    </div>
    </div>
    <div class="col-md-12">
        <asp:Repeater ID="dl_related_news" runat="server">
        
         <ItemTemplate>
             <div class="col-md-4">
                 <div class="col-md-2" style="padding:5px;">
                    <asp:CheckBox ID="cb_is_add_related_news" runat="server"  />
                 <asp:Label ID="lblID" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                 </div>
                 <div class="col-md-4" style="padding:5px;">
                     <asp:Image ID="img_related_news" runat="server"  BackColor="#CCCCCC" Width="100%" ImageUrl='<%#Eval("MediaItem.Path100") %>' />
                 </div>
                 <div class="col-md-6" style="padding:5px;">
                     <div class="row">
                         <div class="col-md-12">
                             <asp:Label ID="lbl_to_date" runat="server" Text='<%# Convert.ToDateTime(Eval("to_date")).ToString("M")%>' Font-Size="Smaller"></asp:Label>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-md-12">
                              <%# DataBinder.Eval(Container.DataItem,"news_title") %>
                         </div>
                     </div>
                   
                 </div>
             </div>
    </ItemTemplate>
         
    </asp:Repeater>
    </div>
    <div class="col-md-12">
        <div class="col-md-6" >
         <%--<asp:Button ID="cmd_add_dream" runat="server" Text="Add" OnClick="cmd_add_related_news_Click" CssClass="btn btn-default" CausesValidation="False" />--%>
   </div>
         <div class="col-md-6">
                                <a href="#" id="next_selectDream" class="btn btn-default">Next</a>
                            </div>
       
        
             </div>
