<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageEmailReminder.ascx.cs" Inherits="UmrahComponents_AdminControls_Booking_PackageEmailReminder" %>
<div class="col-md-12">
    	<div class="col-md-12">
    		<p>
                umarah Package Booking is available online. At the time of package reservation a tracking id will sent to related person via email for further processes.
                if a user does not pay complete Amount of booked umrah Package within 24 hours a reminder email sent to user after 24. if user not able to pay still after 48 hours of initial Package booking 
                it will be cancled and an email sent for cancelation notice of related booking.
                Click the following link to send Reminder Email.
    		</p>
    	</div>
    <div class="col-md-12">
        <asp:Button ID="EmailReminder"  CssClass="btn btn-primary" runat="server" Text="Send Reminder" OnClick="submit_Click" />
    	</div>
    </div>