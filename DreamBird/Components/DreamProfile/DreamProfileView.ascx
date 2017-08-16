<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamProfileView.ascx.cs" Inherits="Account_DreamProfile_DreamProfileView" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Components/DreamProfile/DreamProfileAddEdit.ascx" TagPrefix="uc1" TagName="DreamProfileAddEdit" %>
<script src="//cdn.jsdelivr.net/webshim/1.14.5/polyfiller.js"></script>
<script>
    webshims.setOptions('forms-ext', {types: 'date'});
webshims.polyfill('forms forms-ext');
</script>
<div id="profile_sidebar">
    <div class="col-md-12" style="padding: 15px; padding-top: 25px;">
        <div class="c100 small green" id="percent_sign" clientidmode="static" runat="server" style="
    margin-right: auto;
    margin-left: auto;
    float: none;
">
            <asp:Label ID="percentageLabel" runat="server"></asp:Label>
            <div class="slice">
                <div class="bar"></div>
                <div class="fill"></div>
            </div>
        </div>
    </div>
    <div class="col-md-12" style="background-color: rgba(42, 44, 44, 0.7); background: rgba(42, 44, 44, 0.7); color: rgba(42, 44, 44, 0.7);">
        <h3 style="color: #eb8c2e;">Profile Completness</h3>
    </div>
    <div class="col-md-12" style="padding: 0">
        <asp:LinkButton ID="update_btn" runat="server" CssClass="btn btn-primary" Style="width: 100%; margin-top: 15px;" data-toggle="modal" data-target="#myModal" >Update Your Profile</asp:LinkButton>
    </div>

</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit Profile</h4>
            </div>
            <div class="modal-body" style="height:350px;">
                <uc1:DreamProfileAddEdit runat="server" ID="DreamProfileAddEdit" OnProfileUpdaterEvent="ProfileUpdated_event" OnMyEvent="showPopupEvent"   />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

