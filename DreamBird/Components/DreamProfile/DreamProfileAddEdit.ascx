<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamProfileAddEdit.ascx.cs" Inherits="Account_DreamProfile_DreamProfileAddEdit" %>

<div class="col-md-12" style="margin-top:10px; margin-bottom:10px;">
    <div class="col-md-3">
        <h5>
            <asp:Label ID="name_lbl" runat="server" Text="Name"></asp:Label>
        </h5>
    </div>
    <div class="col-md-9">
        <asp:TextBox ID="Name_txt" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name_txt" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    </div>
<div class="col-md-12" style="margin-top:10px; margin-bottom:10px;">
    <div class="col-md-3">
        <h5>
            <asp:Label ID="ProfilePicture_lbl" runat="server" Text="Profile Picture"></asp:Label>
        </h5>
    </div>
    <div class="col-md-9" style="padding-right:0;">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
                    <ContentTemplate>
                        <div class="col-md-8" style="padding:0; margin-bottom:15px;">
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                            <asp:Button ID="upload_pic" runat="server" Text="Upload" CssClass="btn btn-default" OnClick="Upload_Click" CausesValidation="False" />
                            &nbsp;<br />
                        </div>
                        <div class="col-md-4">
                        <asp:Image ID="profile_img" runat="server" Width="100%" />
                        </div>
                        
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="upload_pic" />
                    </Triggers>
                </asp:UpdatePanel>
    </div>
    </div>
<div class="col-md-12" style="margin-top:10px; margin-bottom:10px;">
     <div class="col-md-3">
        <h5>
            <asp:Label ID="dob_lbl" runat="server" Text="Date Of Birth"></asp:Label>
        </h5>
    </div>
    <div class="col-md-9">
         <asp:TextBox ID="dob_txt" runat="server" CssClass="form-control" type="date"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dob_txt" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>
<div class="col-md-12" style="margin-top:10px; margin-bottom:10px;">
     <div class="col-md-3">
        <h5>
            <asp:Label ID="edu_lbl" runat="server" Text="Education"></asp:Label>
        </h5>
    </div>
    <div class="col-md-9">
         <asp:TextBox ID="edu_txt" runat="server" CssClass="form-control" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="edu_txt" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>
<div class="col-md-12" style="margin-top:10px; margin-bottom:10px;">
    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-success" OnClick="update_btn_Click" />
</div>
