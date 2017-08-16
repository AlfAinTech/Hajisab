<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamEnroll.ascx.cs" Inherits="Components_DreamEnrollment_DreamEnroll" %>

<div class="panel panel-default hideme" style="font-size: 16px; opacity: 1;">
		  <!-- Default panel contents -->
		  <div class="panel-heading">
              <asp:Label ID="dreamName_lbl" runat="server"></asp:Label></div>
		  <!-- List group -->
		  <div class="panel-body">
              <asp:Panel ID="register_panel" runat="server">
		  	<h3>Free for Students*</h3>
               <asp:Button ID="Enroll_btn" runat="server" Text="Enroll Now"  class="btn btn-success" OnClick="Enroll_btn_Click" />
                  </asp:Panel>
                <asp:Panel ID="resume_panel" runat="server" Visible="false">
		  	<h3>
                  <asp:Label ID="resume_menu" runat="server" ></asp:Label></h3>
               <asp:Button ID="resume_btn" runat="server" Text="Resume"  class="btn btn-success" OnClick="resume_btn_Click" />
                  </asp:Panel>
		  	<%--<button class="btn btn-success" style="height:40px; font-size: 18px; width: 100%;">Enroll Now</button>--%>
		  </div>
		  <div class="panel-footer">
		  	* Fair Usage Policy
		  </div>
		</div>