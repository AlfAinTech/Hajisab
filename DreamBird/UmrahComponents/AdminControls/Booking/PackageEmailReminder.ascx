<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageEmailReminder.ascx.cs" Inherits="UmrahComponents_AdminControls_Booking_PackageEmailReminder" %>
<div class="col-md-12">
    	<div class="col-md-12">
    		<p>
                
                Click the following link to send Reminder Email.
    		</p>
    	</div>
    <div class="col-md-12">
        <asp:Button ID="EmailReminder"  CssClass="btn btn-primary" runat="server" Text="Send Reminder" OnClick="submit_Click" />
    	</div>
    </div>