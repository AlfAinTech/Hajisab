<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OfferedPackages.ascx.cs" Inherits="UmrahComponents_PackageComponent_OfferedPackages" %>
<%@ Register Src="~/UmrahComponents/HomePageControls/OfferedPackages/BudgetPackages_ListView.ascx" TagPrefix="uc1" TagName="BudgetPackages_ListView" %>
<%@ Register Src="~/UmrahComponents/HomePageControls/OfferedPackages/HotelBasedPackages.ascx" TagPrefix="uc1" TagName="HotelBasedPackages" %>
<%@ Register Src="~/UmrahComponents/HomePageControls/OfferedPackages/NightBasedPackages.ascx" TagPrefix="uc1" TagName="NightBasedPackages" %>




<asp:UpdatePanel ID="baseUpdatePanel"  runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true" ClientIDMode="Static"><ContentTemplate>

<div id="what_we_offer">
    <h1>
       Select Packages
    </h1>
    <h4>
        We offer a great variety of umrah packages based on your needs. Filter by:
    </h4>
</div>
<div class="col-md-12 offer_tabs" style="padding:0">
    <div class="container">
        <div id="what_we_offer_tabs">
          <ul class="nav nav-tabs nav-justified" role="tablist">
            <li role="presentation" id="budget_tab"><a href="#budget" aria-controls="budget" role="tab" data-toggle="tab"><h2>Budget Packages</h2></a></li>
            <li role="presentation" id="hotel_tab"><a href="#hotel" aria-controls="hotel" role="tab" data-toggle="tab"><h2>Hotel Based</h2></a></li>
            <li role="presentation" id="night_tab"><a href="#nights" aria-controls="nights" role="tab" data-toggle="tab"><h2>No of Nights</h2></a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane" id="budget">

                <uc1:BudgetPackages_ListView runat="server" ID="BudgetPackages_ListView" />
    </div>
    <div role="tabpanel" class="tab-pane" id="hotel">
        <uc1:HotelBasedPackages runat="server" ID="HotelBasedPackages" />
    </div>
    <div role="tabpanel" class="tab-pane" id="nights">
        <uc1:NightBasedPackages runat="server" ID="NightBasedPackages" />
    </div>
</div>
</div>
</div>
</div></ContentTemplate></asp:UpdatePanel>