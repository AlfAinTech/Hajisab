<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ComponentsList.ascx.cs" Inherits="Components_PageTemplate_ComponentsList" %>
<%@ Register Src="~/Components/PageTemplate/AddControls.ascx" TagPrefix="uc1" TagName="AddControls" %>
<%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>--%>
<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div class="modal" style="display:block">
                <div class="center">
                    <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
       
        <asp:Label ID="lbl_message" runat="server"><h2 style="color:#a9a6a6; text-align:center; margin-top:230px;">Select Category from the List to View Components or <a href="#AddsControls" data-toggle="modal" data-target="#AddsControls">Add New Component</a></h2></asp:Label>
        <asp:Repeater ID="rprt_controls" runat="server">
            <HeaderTemplate>
                 <div class="col-md-12">
          
                
               <h2><a href="#AddsControls" data-toggle="modal" data-target="#AddsControls">Add New Component</a></h2>
          
        </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="col-md-2" style="margin-bottom: 20px; margin-top: 20px;">
                    <asp:ImageButton ID="img_thumb" runat="server" OnClick="img_thumb_Click" control-id='<%# Eval("id") %>' cat-id='<%# Eval("ControlCategory_id") %>' ImageUrl='<%# Eval("MediaItem.Path500") %>' Width="100%"/>
                    
                    <div class="col-md-12" style="padding: 0; background-color: #627b90; height:50px; color: white;">
                        <h5 style="text-align: center;"><%# Eval("name") %></h5>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="modal" id="AddsControls" tabindex="-1" role="dialog" aria-labelledby="AddsControlsLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Control</h4>
                    </div>
                    <div class="modal-body" style="display:-webkit-box">
                        <uc1:AddControls runat="server" ID="AddControls" OnControlSaved="ControlSaved" />
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
    </ContentTemplate>
</asp:UpdatePanel>


