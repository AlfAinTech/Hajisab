<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HomeControl.ascx.cs" Inherits="Components_Core_HomeControl" %>
<div id="Content_area" runat="server"></div>
<div class="col-md-12">
    <div class="row">
        <asp:PlaceHolder ID="HomePlace" runat="server"></asp:PlaceHolder>
    </div>
</div>
<div class="col-md-12" id="AdditionalControls" runat="server" visible="false">
    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <button class="btn btn-default previous_page">Previous</button>
            </div>
        </div>
        <div class="col-md-6"></div>
        <div class="col-md-3">
            <div class="row">
            <button class="btn btn-default next_page" style="float:right;">Next</button>
            </div>
        </div>
    </div>
</div>
