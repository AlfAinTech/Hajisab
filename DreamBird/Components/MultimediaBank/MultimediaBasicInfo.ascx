<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultimediaBasicInfo.ascx.cs" Inherits="Components_MultimediaBank_MultimediaBasicInfo" %>
<%@ Register Src="~/Components/MultimediaBank/FileGridCS.ascx" TagPrefix="uc1" TagName="FileGridCS" %>

<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<div class="col-md-12">
    <div class="col-md-6">
        <div class="col-md-12" style="margin-top:10px; margin-bottom:5px;">
            <h5>Multimedia Name</h5>
            <asp:TextBox ID="mmbank_name" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:HiddenField ID="mmbank_id" Value="0" runat="server" />
        </div>
        <div class="col-md-12" style="margin-top:10px; margin-bottom:5px;">
            <h5>Description</h5>
            <asp:TextBox ID="mmbank_description" CssClass="form-control" TextMode="MultiLine" Height="150px" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-6">
         <div class="col-md-12" style="margin-top:10px; margin-bottom:5px;">
            <h5>Directory Path</h5>
            <asp:TextBox ID="mmbank_directory_path" ReadOnly="true" CssClass="form-control" TextMode="MultiLine" Height="90px" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-12" style="margin-top:10px; margin-bottom:5px;">
            <h5>Index File Path</h5>
            <asp:TextBox ID="mmbank_index_path" ReadOnly="true" CssClass="form-control" TextMode="MultiLine" Height="90px" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-12">
        <div class="col-md-3" style="float:right;">
            <asp:Button ID="save_multimedia" CssClass="btn btn-primary" OnClick="save_multimedia_Click" Enabled="false" Width="100%" runat="server" Text="Save"  />
        </div>
        <div class="col-md-8" style="float:right;">
            <div class="col-md-9">
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
            </div>
            <div class="col-md-3">
                <asp:Button ID="upload_zip" OnClick="upload_zip_Click" runat="server" CssClass="btn btn-default" Width="100%" Text="Upload Zip" title="Save the Multimedia First" />
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <uc1:FileGridCS runat="server" ID="FileGridCS" />
    </div>
</div>