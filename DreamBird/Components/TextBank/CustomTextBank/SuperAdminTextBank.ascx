<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuperAdminTextBank.ascx.cs" Inherits="Components_TextBank_SuperAdminTextBank" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextBankSelection.ascx" TagPrefix="uc1" TagName="SharedTextBankSelection" %>
  <%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextBankList.ascx" TagPrefix="uc1" TagName="SharedTextBankList" %>
<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextDetail.ascx" TagPrefix="uc1" TagName="SharedTextDetail" %>



<div class="col-md-12" style="text-align:center">
    <div class="row">
        <div class="col-md-6">
                Dream: 
            </div>
         <div class="col-md-6">
                <asp:Label ID="dream_name" runat="server"></asp:Label>
             </div>
        </div>
   <div class="row">
        <div class="col-md-6">
             Page:
        </div>
    <div class="col-md-6">
        <asp:Label ID="page_name" runat="server"></asp:Label>
        </div>
     </div>
     <div class="row">
        <div class="col-md-6">
             <asp:CheckBox ID="custome_chk" runat="server" Text="Custom" AutoPostBack="True" OnCheckedChanged="custome_chk_CheckedChanged" groupname="grup1"/>
            </div>
          <div class="col-md-6">
            </div>
         </div>
     <div class="row">
        <div class="col-md-6">
             <asp:CheckBox ID="shared_chk" runat="server" AutoPostBack="True" OnCheckedChanged="shared_chk_CheckedChanged" Text="Shared" groupname="grup1" />
            </div>
          <div class="col-md-6">
            </div>
         </div>
 </div>

    <asp:Panel ID="Custome_Panel" runat="server" Visible="false">
        <div class="col-md-12">
            <div class="row" style="text-align:center">
                <div class="col-md-6">
                    Name:
                    </div>
                 <div class="col-md-6">
                    <asp:TextBox ID="text_name" runat="server"></asp:TextBox>
                </div>
                </div>
<div class="row">
 <asp:LinkButton ID="copy_textBank" runat="server" OnClick="copy_textBank_Click" CausesValidation="False" >Copy</asp:LinkButton>

 </div>
<asp:Panel ID="Selection_panel" runat="server" Visible="False" >
      Dream: <asp:DropDownList ID="Dream_list" runat="server" AutoPostBack="True" DataTextField="DreamName" DataValueField="id"  OnSelectedIndexChanged="Dream_list_SelectedIndexChanged" Width="181px"></asp:DropDownList>&nbsp;&nbsp; 
    Layout: <asp:DropDownList ID="Page_list" runat="server" AutoPostBack="True" DataTextField="Page" DataValueField="id"  Height="16px" OnSelectedIndexChanged="Page_list_SelectedIndexChanged" Width="156px"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    TextBank <asp:DropDownList ID="TextBank_list" runat="server" AutoPostBack="True" DataTextField="textdata" DataValueField="id" Height="16px" Width="173px" OnSelectedIndexChanged="TextBank_list_SelectedIndexChanged"></asp:DropDownList>
    <br />
      <br />
</asp:Panel>
<%-- Dream Edit Detail --%>
<asp:Panel ID="detail_panel" runat="server">
<br />



<%-- Related Dreams information of a shared Text --%>
    <br />
    <%-- Text editor --%>
    <br />
<asp:HiddenField ID="HiddenEditor"  runat="server" />
<br />
 
<span type="hidden" clientID="<%=txtEditor.ClientID%>" class="textEditor" style="padding:0;margin:0" value="blank">        </span>
<textarea name="txtEditor" id="txtEditor" runat="server" rows="10" cols="80">
                This is my textarea to be replaced Editor.
            </textarea>
    
   
         <br />
    <asp:Button ID="cmdSave" runat="server" BackColor="Maroon" ForeColor="White" Height="29px" OnClick="cmdSave_Click" Text="Save" Width="123px" />
    
   
         </asp:Panel>   
             </div>
</asp:panel>

<asp:Panel ID="Shared_panel" runat="server" Visible="false">
    <uc1:SharedTextBankSelection runat="server" id="SharedTextBankSelection" OnTextBankSelected="TextBank_Selected" />
</asp:Panel>
      

   
   
  



      

      