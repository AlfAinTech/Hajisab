<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AssignmentUserView.ascx.cs" Inherits="Components_Assignments_AssignmentUserView" %>
<script src="<%# Server.MapPath("~/") %>/Components/Assignments/Content/js/myScripts.js"></script>
<div class="row">
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3" style="float:left">
                    <asp:FileUpload ID="FileUpload_submit_assignmet_1" ClientIDMode="Static" runat="server" />
                    <asp:Button ID="submit_assignmet_1" runat="server" ClientIDMode="Static" Text="Submit Your Assignment" CssClass="btn btn-primary assignment_uploader" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h3>
                    <asp:Label ID="assignment_title" runat="server"></asp:Label></h3>
                <p>
                    <asp:Label ID="assignment_description" runat="server"></asp:Label>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3" style="float:left">
                    <asp:FileUpload ID="FileUpload_submit_assignment_2" ClientIDMode="Static" runat="server" />
                    <asp:Button ID="submit_assignment_2" runat="server" ClientIDMode="Static" Text="Submit Your Assignment" CssClass="btn btn-primary assignment_uploader" />
                </div>
            </div>
        </div>
    </div>
</div>
