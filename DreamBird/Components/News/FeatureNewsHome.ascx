<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FeatureNewsHome.ascx.cs" Inherits="Components_News_FeatureNewsHome" %>
<%@ Register Src="~/Components/News/NewsFeed.ascx" TagPrefix="uc1" TagName="NewsFeed" %>
<%@ Register Src="~/Components/News/NewsFeedAdmin.ascx" TagPrefix="uc1" TagName="NewsFeedAdmin" %>
<%@ Register Src="~/Components/News/MainNews.ascx" TagPrefix="uc1" TagName="MainNews" %>
<%@ Register Src="~/Components/News/MainNewsAdmin.ascx" TagPrefix="uc1" TagName="MainNewsAdmin" %>

<%@ Register Src="~/Components/News/AddNews.ascx" TagPrefix="uc1" TagName="AddNews" %>



<%--<%@ Register Src="~/Components/News/SearchNews.ascx" TagPrefix="uc1" TagName="SearchNews" %>--%>

<div style="width:900px;height:900px;border:1px solid red;padding:5px;background-color: #CCCCCC">
    <div>
    <asp:TextBox ID="tb_search_news" runat="server"></asp:TextBox><asp:Button ID="cmd_search_news" runat="server" Text="Search" OnClick="cmd_search_news_Click" />
        <p class="text-danger">
         <asp:Literal ID="ErrorMessage" runat="server" />
            </p>
    </div>
    <asp:Button ID="cmd_add_news" runat="server" Text="Add News" OnClick="cmd_add_news_Click" />
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
             <asp:Panel ID="p_search_news" runat="server">
                 <div style="width:800px;height:800px;padding:5px; overflow-y: scroll; overflow-x:hidden;">
                 <asp:DataList ID="dl_search_news" runat="server" DataKeyField="id" OnItemCommand="dl_search_news_ItemCommand">
                      <ItemTemplate>
                            <table>
                                <tr>
                                   <td rowspan="2">
                                        <asp:Image ID="nav_img" runat="server" Width="50px" Height="50px"  ImageUrl='<%#Eval("MediaItem.Path100") %>' />
                                   </td>
                                    <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("to_date")).ToString("M")%>'></asp:Label>
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                     <asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server" CommandName="id"></asp:LinkButton>
                                     <td>
                                </tr>
                                
                            </table>
                     </ItemTemplate>

                 </asp:DataList>
                 </div>
                 <%--<uc1:SearchNews runat="server" ID="SearchNews" />--%>
            </asp:Panel>
    </ContentTemplate>

    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
             <asp:Panel ID="p_add_news" runat="server">
                 <uc1:AddNews runat="server" ID="AddNews"   OnMyEvents="OnMyEvents_hundler"/>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        
    <asp:Panel ID="p_for_admin" runat="server">
        <uc1:MainNewsAdmin runat="server" ID="MainNewsAdmin" />
    </asp:Panel>
    <asp:Panel ID="panal_for_default" runat="server">
       <table style="height:auto;width:100%;border-spacing: 20px 10px;padding:5px;">
           <tr>
               <td colspan="2" style="width:300px"><b><asp:Label ID="lbl_defult_news_title" runat="server" Text=""></asp:Label></b>
               </td>               
           </tr>
           <tr>
               <td><asp:Label ID="lbl_to_date_default" runat="server" Text=""></asp:Label></td>
           </tr>
           <tr >
               <td rowspan="2"style="width:200px;height:250px;border:1px solid black;padding:5px">
                <asp:Image ID="main_img_default" runat="server" Width="300px" Height="250px"  ImageUrl='<%#Eval("MediaItem.Path500") %>' />
               </td>
               <td style="width:350px;height:100px;border:1px solid black;padding:5px"><asp:Label ID="lbl_lbl_defult_news_title_description" runat="server" Text=""></asp:Label><asp:LinkButton ID="lb_news_detail_default" runat="server" OnClick="lb_news_detail_default_Click">More</asp:LinkButton><asp:Label ID="lblID_default" runat="server" text="" Visible="false" /></td>
           </tr>
           <tr style="margin-top:10px;">
               <td style="width:350px;height:100px;border:1px solid black;padding:5px;margin-top:10px;" >
                   <h6>Related News</h6>
                   <asp:DataList ID="dl_related_news_for_default" runat="server" DataKeyField="id" OnItemCommand="dl_related_news_for_default_ItemCommand">
                       <ItemTemplate>
                     <ul>
                         <%--<li><%# DataBinder.Eval(Container.DataItem,"news_title") %></li>--%>
                         <li><asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server" CommandName="id"></asp:LinkButton></li>
                 
                     </ul>

                
                     </ItemTemplate>
                   </asp:DataList></td>
               
           </tr>
           <tr>
               <td colspan="2" style="width:500px;height:150px">
                   <asp:DataList ID="dl_featured_news_for_default" runat="server" DataKeyField="id" OnItemCommand="dl_featured_news_for_default_ItemCommand"  >
                    <ItemTemplate>
                        <table style="table-layout: fixed; width: 100%;height:100px">
                            <tr>
                                <%--<td><%# DataBinder.Eval(Container.DataItem,"news_title") %></td>--%>
                                <td rowspan="2">
                                    <asp:Image ID="img_feature_news" runat="server" Width="50px" Height="50px"  ImageUrl='<%#Eval("MediaItem.Path100") %>' />
                                </td>
                                <td style="word-wrap: break-word;width:150px">
                                    <asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server" CommandName="id"></asp:LinkButton>
                                 </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_to_date" runat="server" Text='<%#Eval("to_date")%>'></asp:Label>
                                </td>                                    
                            </tr>
                        </table>
                     </ItemTemplate>   
                   </asp:DataList>
               </td>
               
           </tr>
       </table> 
    </asp:Panel>
    <asp:Panel ID="p_main_news"  runat="server">
        <uc1:MainNews runat="server" id="MainNews" />

    </asp:Panel>

   <asp:LinkButton ID="cmdEdit" runat="server" Visible="False" OnClick="cmdEdit_Click">Save</asp:LinkButton>
   <asp:Panel ID="p_for_news_feed" runat="server">
             <uc1:NewsFeed runat="server" ID="NewsFeed" />
   </asp:Panel>
   <asp:Panel ID="p_for_news_feed_admin" runat="server">
      <uc1:NewsFeedAdmin runat="server" ID="NewsFeedAdmin" />
   </asp:Panel>



</ContentTemplate>
        </asp:UpdatePanel>
</div>
<p>
    I am feature News Home</p>

