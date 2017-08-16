<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsDetail.ascx.cs" Inherits="Components_News_NewsDetail" %>
<style type="text/css">
    .auto-style1 {
        width: 150px;
        height: 229px;
    }
</style>
<div style="width:800px;height:800px;border:1px solid black ; padding:5px; background-color: #CCCCCC">
<asp:Panel ID="Panel1" runat="server">
   <b>News Details</b>
    <table >

            <tr>
                <td colspan="2" style="width:300px">
                    <b><asp:Label ID="lbl_news_title" runat="server" Text=""></asp:Label></b>
                </td>
                
            </tr>
            <tr>
                <td><asp:Label ID="lbl_to_date" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td rowspan="1">
                    
                 <asp:Image ID="img_detail_news" runat="server" Width="434px" Height="276px" BackColor="#CCCCCC" ImageUrl='<%#Eval("MediaItem.Path500") %>' />
             </td>
                <td style="padding:5px;">
                    <asp:Label ID="lbl_news_description" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            <%--<tr>
                <td style="width:150px;height:100px"></td>
                <td></td>
            </tr>--%>
            <tr>
                
                <td style="width:300px;height:150px">
                    <b>Related News</b>
                    <asp:DataList ID="dl_related_news" runat="server" CellPadding="1">
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
                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("to_date")).ToString("M")%>'></asp:Label>
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
    
    
    
    
   <%-- <div style="width:200px;height:200px;border:1px solid red">   
    </div>--%>
    
   </asp:Panel>

    <asp:Panel ID="p_news_detail_admin" runat="server">
   <b>News Details</b>
    <table>

            <tr>
                <td><b>News Title:</b></td>
                <td colspan="2" style="width:300px"><asp:TextBox ID="tb_news_title" runat="server" Width="184px"></asp:TextBox></td>
                
            </tr>
            <tr>
                <td><b>To :</b></td>
                <td><asp:TextBox ID="tb_to_date" runat="server" TextMode="Date" Width="185px"></asp:TextBox></td>
                
                
            </tr>
            <tr>
                <td><b>From:</b></td>
                <td><asp:TextBox ID="tb_from_date" runat="server" TextMode="Date" Width="185px"></asp:TextBox></asp:TextBox</td>
                
            </tr>
            <tr>
                <td rowspan="1"style="width:150px;height:200px">
                    <asp:Image ID="img_detail_news_admin" runat="server" Width="434px" Height="276px" BackColor="#CCCCCC" ImageUrl='<%#Eval("MediaItem.Path500") %>' />

                </td>
                <td style="width:150px;height:100px">
                    
                    <asp:TextBox ID="tb_desription" runat="server" Height="264px" Width="287px"></asp:TextBox>

                </td>
            </tr>
            <tr><td colspan="2"><b>Publishing Options:</b></td></tr>
            <tr>
                <%--<td style="width:150px;height:100px"></td>--%>
                <td><asp:CheckBox ID="cb_is_feature" runat="server" Text=" Feature News" /></td>
                
                <td><asp:CheckBox ID="cb_is_leatest" runat="server" Text="Leatest News" /></td>
            </tr>
            <tr>
                
                <td style="width:300px;height:150px">
                    <b>Related News</b>
                    <asp:DataList ID="dl_related_news_admin" runat="server">
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
                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("to_date")).ToString("M")%>'></asp:Label>
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
        <asp:LinkButton ID="lb_save_news_detail" runat="server" OnClick="lb_save_news_detail_Click">Save</asp:LinkButton>

    
   </asp:Panel>

 </div>