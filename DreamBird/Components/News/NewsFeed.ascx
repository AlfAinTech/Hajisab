<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsFeed.ascx.cs" Inherits="Components_News_NewsFeed" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%--<%@ Register Src="~/Components/News/wuc_news_detail.ascx" TagPrefix="uc1" TagName="wuc_news_detail" %>--%>

<div style="width:880px;height:270px;border:1px solid black;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="Panel1" runat="server">
        <b> News Feed</b>
        <asp:CheckBox ID="cb_horizontal" runat="server" Text="Horizantal" OnCheckedChanged="cb_horizontal_CheckedChanged" AutoPostBack="True"  />
        <asp:CheckBox ID="cb_is_featured_news" runat="server" Text="Feature News"  AutoPostBack="True" OnCheckedChanged="cb_is_featured_news_CheckedChanged"  />
        
        <div style="width:870px;height:200px;padding:5px; overflow-y: scroll; overflow-x:hidden;">
        <asp:DataList ID="dl_news_feed" runat="server" DataKeyField="id" OnItemCommand="dl_news_feed_ItemCommand" Height="16px" Width="864px" style=" border-spacing: 20px 10px ;" >

            <ItemTemplate>
             
        <table style="table-layout: fixed;" >
            <tr>
                <td rowspan="2">
                    <asp:Image ID="nav_img" runat="server" Width="50px" Height="50px"  ImageUrl='<%#Eval("MediaItem.Path100") %>' />
                </td>
                <td style="padding:5px">
                    <asp:Label ID="to_date" runat="server" Text='<%# Convert.ToDateTime(Eval("to_date")).ToString("M")%>'></asp:Label>

                </td>  
            </tr>
            <tr> 
                <td style="padding:5px;" >


                     <table style="table-layout: fixed;width:100%;">
                <tr>
                    <td style="width: 50px; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
                        <asp:LinkButton Text = '<%#Eval("news_title")%>' ID="LinkButton1" runat="server"  OnClick="btn_Click" CommandName="id"></asp:LinkButton><asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                    </td>
                         </tr>
            </table>
                    <%--<asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server"  OnClick="btn_Click" CommandName="id"></asp:LinkButton>--%><asp:Label ID="lblID" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                </td>
                
            </tr>
           
            
        </table>
                
    </ItemTemplate>
        </asp:DataList>
            </div>
    </asp:Panel>

<%--<asp:Button ID="lb_news_detail" runat="server" Text="Button" style="display:none" />--%>

<%--<ajaxToolkit:ModalPopupExtender BackgroundCssClass="modalBackground"
     runat="server" PopupControlID="p_popup_news_detail_panel" ID="ModalPopupExtender_for_news_detail"
    TargetControlID="lb_news_detail"  />
        <asp:Panel ID="p_popup_news_detail_panel" runat="server">
            <uc1:wuc_news_detail runat="server" ID="wuc_news_detail" />
         </asp:Panel>--%>

          </ContentTemplate>
        </asp:UpdatePanel>

    </div>