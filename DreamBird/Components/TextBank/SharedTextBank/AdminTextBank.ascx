<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminTextBank.ascx.cs" Inherits="Components_TextBank_AdminTextBank" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>

<div class="col-md-12">
    <div class="col-md-1">
        <h5>Name</h5>
    </div>
    <div class="col-md-3">
        <asp:TextBox ID="name_txt" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name_txt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="col-md-12">
            <div class="col-md-3" style="padding: 0;">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Import From Existing Text Banks
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <div class="col-md-4">
                                <h5>Dream</h5>
                            </div>
                            <div class="col-md-12" style="padding: 0;">
                                <asp:DropDownList ID="Dream_list" runat="server" AutoPostBack="True" CssClass="form-control" DataTextField="DreamName" DataValueField="id" OnSelectedIndexChanged="Dream_list_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <h5>Page</h5>
                            </div>
                            <div class="col-md-12" style="padding: 0;">
                                <asp:DropDownList ID="Page_list" runat="server" AutoPostBack="True" DataTextField="Page" DataValueField="id" OnSelectedIndexChanged="Page_list_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <h5>Text Bank</h5>
                            </div>
                            <div class="col-md-12" style="padding: 0;">
                                <asp:DropDownList ID="TextBank_list" runat="server" AutoPostBack="True" DataTextField="textdata" DataValueField="id" CssClass="form-control" OnSelectedIndexChanged="TextBank_list_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <asp:HiddenField ID="HiddenEditor" runat="server" />
                <span type="hidden" clientid="<%=txtEditor.ClientID%>" class="textEditor" style="padding: 0; margin: 0" value="blank"></span>
                <textarea name="txtEditor" id="txtEditor" runat="server" rows="10" cols="80">
                This is my textarea to be replaced Editor.
            </textarea>


            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Panel ID="shared_panel" runat="server" Visible="true">
    <div class="col-md-3" style="padding-right:30px; padding-top:15px; float:right;">
        <asp:Button ID="cmdSave" runat="server" OnClick="cmdSave_Click" Text="Save" CssClass="btn btn-primary" Width="100%" />
    </div>
</asp:Panel>


