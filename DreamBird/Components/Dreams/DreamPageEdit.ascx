<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamPageEdit.ascx.cs" Inherits="Components_Dreams_PageEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/Dreams/DreamPageAdd.ascx" TagPrefix="uc1" TagName="DreamPageAdd" %>

<asp:Panel ID="Page_panel" runat="server" BorderWidth="1px" height="291px">
                      <div style="width:inherit">
                          <asp:Label ID="page_lbl" runat="server" Text="Dream Page" ></asp:Label>
                          &nbsp;&nbsp;&nbsp;
                          <asp:DropDownList ID="ddlPage" runat="server" Height="19px" Width="122px" AutoPostBack="True" DataTextField="Page" DataValueField="id" OnSelectedIndexChanged="ddlPage_SelectedIndexChanged"></asp:DropDownList>
                          <asp:Button ID="page_add" runat="server" Text="Add" OnClick="page_add_Click" />
                      </div>
                      <br/>
                      <div style="width:inherit">
                          <asp:Panel ID="pageDetail_panel" runat="server" Height="223px">
                          <br/>
                          <br/>
                          <table style="width:60%;padding:20px;">
                          <tr><td>
                              <asp:Label ID="pageName_lbl" runat="server" Text="Name"></asp:Label></td>
                              <td><asp:TextBox ID="page_name" runat="server" Enabled="False"></asp:TextBox>
                                  <br />
                              </td>
                            
                              </tr>
                              <tr>
                                <td> <asp:Label ID="decPage_lbl" runat="server" Text="Description"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="DescriptionPage_text" runat="server" Height="72px"></asp:TextBox>
                                    <br />
                                  </td>
                                </tr>
                              <tr>
                              <td colspan="2"><asp:CheckBox ID="addNav_chk" runat="server" Text="Add Navigation" />
                                  <br />
                                  </td>
                              </tr>
                              <tr><td colspan="2">
                              <asp:CheckBox ID="publishPage_chk" runat="server" Text="Published" />
                                  </td></tr>
                                 <tr><td colspan="2">
                                  <asp:CheckBox ID="default_chk" runat="server" Text="Default Page" AutoPostBack="True" OnCheckedChanged="default_chk_CheckedChanged" />
                                     &nbsp;<asp:Label ID="defaultPage_validation" runat="server" ForeColor="Red" style="font-size: x-small" Text="Default Page Already Exist" Visible="False"></asp:Label>
                                  </td></tr>
                           
                              <tr><td colspan="2">
                                  <asp:Button ID="edit_Page" runat="server" Text="Save Page" OnClick="edit_Page_Click" />
                                  </td></tr>
                              </table>
                          </asp:Panel>
                      </div>
                      <div>

                      </div>
                      </asp:Panel>


                        <ajaxToolkit:ModalPopupExtender BackgroundCssClass="modalBackground"
    CancelControlID="btnClose" runat="server" PopupControlID="popupPanel" ID="ModalPopupExtender1"
    TargetControlID="page_add" />
               <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px">
                  
                   <br />
                   <uc1:DreamPageAdd runat="server" ID="DreamPageAdd"  OnMyEvents="DreampageAdd_MyEvents"  OnpageAdded="PageCreate_pageCreated" />
               <br />
                  
                   <asp:Button ID="btnClose" runat="server" Text="Cancel" />
     </asp:Panel>
