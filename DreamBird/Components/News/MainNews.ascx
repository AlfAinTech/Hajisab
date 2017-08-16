<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainNews.ascx.cs" Inherits="Components_News_MainNews" %>
 <asp:Panel ID="panal_for_default" runat="server">
       <table style="table-layout: fixed; height:auto;width:100%;border-spacing: 20px 10px;padding:5px;background-color:#CCCCCC">
           <tr>
               <td colspan="2" style="width:300px"><b><asp:Label ID="lbl_defult_news_title" runat="server" Text=""></asp:Label></b>
               </td>               
           </tr>
           <tr>
               <td><asp:Label ID="lbl_to_date_default" runat="server" Text=""></asp:Label></td>
           </tr>
           <tr >
               <td rowspan="2"style="width:200px;height:250px;border:1px solid black;padding:5px">
                <asp:Image ID="main_img_default" runat="server" Width="434px" Height="276px" BackColor="#CCCCCC"  ImageUrl='<%#Eval("MediaItem.Path500") %>' />
               </td>
               <td style="width:350px;height:100px;border:1px solid black;padding:5px ; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
                   <asp:Label ID="lbl_lbl_defult_news_title_description" runat="server" Text=""></asp:Label>
                   <%--<asp:LinkButton ID="lb_news_detail_default" runat="server" OnClick="lb_news_detail_default_Click">More</asp:LinkButton>--%>
                       <asp:Label ID="lblID_default" runat="server" text="" Visible="false" />

                   <table>
                       <tr>
                           <td>
                               <asp:LinkButton ID="lb_news_detail_default" runat="server" OnClick="lb_news_detail_default_Click">More</asp:LinkButton>
                            </td>
                       </tr>
                   </table>
               </td>
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
                   <asp:DataList ID="dl_featured_news" runat="server" DataKeyField="id" OnItemCommand="dl_featured_news_ItemCommand" CellPadding="1"  >
                    <ItemTemplate>
                       <%-- <table>
                            <tr>
                                <td>
                                   
                                    <asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server" CommandName="id"></asp:LinkButton>
                                </td>
                             <td>
                                    <asp:CheckBox ID="cb_featured_news" runat="server"  Checked='<%#Eval("is_feature_news")%>' Text= "Feature News" /><asp:Label ID="lblID" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                           </td>
                            </tr>
                            <tr>

                                <td></td>
                                    
                                <td><asp:CheckBox ID="cb_is_main" runat="server" Text="Main News" Checked='<%#Eval("is_main_news")%>'  /></td>
                            </tr>
                        </table>--%>
                        <table style="table-layout: fixed; width: 100%;height:90px">
                            <tr>
                                
                                <td rowspan="2">
                                    <asp:LinkButton Text="" ID="lb_img_click" runat="server" CommandName="img_click">
                                        <asp:Image ID="img_feature_news" runat="server"  BackColor="#CCCCCC" Width="50px" Height="50px"  ImageUrl='<%#Eval("MediaItem.Path100") %>' />
                                    </asp:LinkButton>
                                </td>
                                
                                <td style="word-wrap: break-word;width:75px">
                                    <asp:Label ID="lbl_to_date" runat="server" Text='<%# Convert.ToDateTime(Eval("to_date")).ToString("M")%>' Font-Size="Smaller"></asp:Label>
                                </td> 
                                 <td style="width:75px">
                                    <asp:CheckBox ID="cb_featured_news" runat="server"  Checked='<%#Eval("is_feature_news")%>' Text= "Feature News" Font-Size="X-Small" /><asp:Label ID="lblID" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                                </td>
                            </tr>
                            <tr>
                                 <td style="width: 50px; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
                                    <asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server" CommandName="id" Font-Size="Smaller"></asp:LinkButton>
                                 </td>
                                <td style="width:50px"><asp:CheckBox ID="cb_is_main" runat="server" Text="Main News" Checked='<%#Eval("is_main_news")%>'  Font-Size="X-Small" /></td>                                  
                            </tr>
                        </table>
                     </ItemTemplate>   
                   </asp:DataList>


                   <asp:DataList ID="dl_featured_news_for_default" runat="server" DataKeyField="id" OnItemCommand="dl_featured_news_for_default_ItemCommand" CellPadding="1"  >
                    <ItemTemplate>
                        <table style="table-layout: fixed; width: 100%;height:100px">
                            <tr>
                                <%--<td><%# DataBinder.Eval(Container.DataItem,"news_title") %></td>--%>
                                <td rowspan="2">
                                    <asp:LinkButton Text="" ID="lb_img_click" runat="server" CommandName="img_click">
                                        <asp:Image ID="img_feature_news" runat="server"  BackColor="#CCCCCC" Width="50px" Height="50px"  ImageUrl='<%#Eval("MediaItem.Path100") %>' />
                                    </asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_to_date" runat="server" Text='<%# Convert.ToDateTime(Eval("to_date")).ToString("M")%>'></asp:Label>
                                </td> 
                            </tr>
                            <tr>
                                 
                                <td style="width: 50px; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
                                    <asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server" CommandName="id"></asp:LinkButton>
                                 </td>                                  
                            </tr>
                        </table>
                     </ItemTemplate>   
                   </asp:DataList>
               </td>
               
           </tr>
       </table> 
     <asp:LinkButton ID="cmdsave" runat="server" Visible="False" OnClick="cmdEdit_Click">Save</asp:LinkButton>
    </asp:Panel>