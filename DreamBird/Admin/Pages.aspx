<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Pages.aspx.cs" Inherits="Admin_Pages" %>

<%@ Register Src="~/Components/PageTemplate/LayoutBuilder.ascx" TagPrefix="uc1" TagName="LayoutBuilder" %>
<%@ Register Src="~/Components/PageTemplate/AddControls.ascx" TagPrefix="uc1" TagName="AddControls" %>
<%@ Register Src="~/Components/PageTemplate/AddControlCategory.ascx" TagPrefix="uc1" TagName="AddControlCategory" %>
<%@ Register Src="~/Components/PageTemplate/ControlsList.ascx" TagPrefix="uc1" TagName="ControlsList" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        <div class="col-md-12" style="height: auto; padding:0;">

            <div class="col-md-3" style="padding:0;">
                <div class="col-md-12" id="welcome_nav">
        <asp:LoginView ID="LoginView1" runat="server" ViewStateMode="Disabled">
            <LoggedInTemplate>
               <h3><a runat="server" href="~/Account/Manage" title="Manage your account">Good Day, <%: Context.User.Identity.GetUserName()  %>!</a></h3>
            </LoggedInTemplate>
        </asp:LoginView>
	</div>
                
            <div class="col-md-12" id="side-nav">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active"><a href="#Layout_Builder" class="list-group-item" aria-controls="Layout_Builder" role="tab" data-toggle="tab">Layout Builder</a></li>
                    <li role="presentation"><a href="#Components" class="list-group-item" aria-controls="Components" role="tab" data-toggle="tab">Components</a></li>
                    <li role="presentation"><a href="#Dreams" class="list-group-item" aria-controls="Dreams" role="tab" data-toggle="tab">Dreams</a></li>
                </ul>
            </div></div>
            <div class="col-md-9" id="design-pan">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="tab-content" style="height: auto; max-height: 500px; overflow-y: scroll;">
                    <div role="tabpanel" class="tab-pane active" id="Layout_Builder">
                        <uc1:LayoutBuilder runat="server" ID="LayoutBuilder" />
                    </div>
                    <div role="tabpanel" class="tab-pane" id="Components">
                        <uc1:AddControlCategory runat="server" ID="AddControlCategory" OnCategoryAdded="AddControlCategory_CategoryAdded" />
                        <div class="col-md-12">
                            

                            <!-- Modal -->
                            <div class="modal" id="AddsControls" tabindex="-1" role="dialog" aria-labelledby="AddControlsLabel">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="AddControlsLabel">Add New Control</h4>
                                        </div>
                                        <div class="modal-body" style="display: -webkit-box;">
                                            <uc1:AddControls runat="server" ID="AddControls" OnControlAdded="ControlAdded" />
                                            <div class="modal-footer">
                                                <div class="col-md-12">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h3>Controls List</h3>
                            </div>

                            <uc1:ControlsList runat="server" ID="ControlsList" />
                        </div>
                    <div role="tabpanel" class="tab-pane" id="Dreams">...</div>
                </div>
        </div>
    </div>
</asp:Content>

