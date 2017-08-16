<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TextBankAdmin.ascx.cs" Inherits="Components_TextBank_TextBankAdmin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/Tags/TagControl.ascx" TagPrefix="uc1" TagName="TagControl" %>
<%@ Register Src="~/Components/TextBank/ImportTextBanks.ascx" TagPrefix="uc1" TagName="ImportTextBanks" %>



<div class="col-md-12" id="TextBankAdminPanel" runat="server">
    <div class="row">
        <div class="col-md-3">
            <asp:TextBox ID="tbank_name" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
            <asp:HiddenField ID="tbank_id" runat="server" />
        </div>
        <div class="col-md-3">
            <uc1:TagControl runat="server" ID="TagControl" />
        </div>
        <div class="col-md-3">
            <div class="dropdown">
                <a id="dLabel" class="btn btn-success" data-target="#" href="http://example.com" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-import" aria-hidden="true"></span>
                    <span class="caret"></span>
                </a>

                <div class="dropdown-menu" aria-labelledby="dLabel" style="width:600px; overflow-y:auto; right:0 !important; left: auto !important;">
                    <uc1:ImportTextBanks runat="server" ID="ImportTextBanks" />
                </div>
            </div>
        </div>
        <div class="col-md-3">
            
                <asp:Button ID="save_textBank" Width="100%" runat="server" Text="Save" CssClass="btn btn-danger" OnClick="cmdSave_Click" />
            
        </div>
    </div>
</div>
<%--<asp:TextBox ID="HiddenEditor" name="HiddenEditor" runat="server"  TextMode="MultiLine" Visible="true" Height="18px" />--%>
<div class="col-md-12" style="padding:15px;">
<asp:HiddenField ID="HiddenEditor" runat="server" />

<span type="hidden" clientid="<%=txtEditor.ClientID%>" class="textEditor" style="padding: 0; margin: 0" value="blank"></span>
<textarea name="txtEditor" id="txtEditor" runat="server" rows="10" cols="80">
                This is my textarea to be replaced Editor.
            </textarea>

</div>



