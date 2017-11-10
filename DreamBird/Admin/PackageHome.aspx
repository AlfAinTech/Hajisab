<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="PackageHome.aspx.cs" Inherits="Admin_PackageHome" %>

<%@ Register Src="~/Components/Packages/PackageGrid.ascx" TagPrefix="uc1" TagName="PackageGrid" %>
<%@ Register Src="~/Components/Packages/PackageBasicInfo.ascx" TagPrefix="uc1" TagName="PackageBasicInfo" %>



<asp:Content ContentPlaceHolderID="Header" runat="server">
    <script>//open package Page
        $(function () {
            $(".packages").parent().addClass("active");
        });
    </script> 
   
    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-2" id="side-nav" style="height: 650px; overflow-y: auto;"></div>
            <div class="col-md-10" style="background-color: #e6e6e6; height: 650px; overflow-y: auto;">
                <div class="col-md-12" style="border-bottom: 1px solid #a6a6a6;">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <h3>Umrah Packages</h3>
                            </div>
                        </div>
                        <div class="col-md-3" style="float: right; padding-top: 15px;">
                            <div class="row">
                                <button type="button" id="add_new_Package_first" runat="server" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float: right;">
                                    Add New Package
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="col-md-12" id="welcome_note" runat="server">
                        <div class="row">
                            <h3>Welcome to Admin Panel</h3>
                            <p>
                                Emmmmm i dont know what to say, i'm may cry due to overwhelming happiness because you cared to join HajiSab. This is really a great honour for us that you graced us with your presence.
                We'll make sure not to lose you as you are our last hope in this rude, curel, selfish and egoistic world. Please Please Please don't go anywhere untill you have created a dozens of Packages. 
                            </p>
                        </div>
                        <div class="row">
                            <div class="col-md-4" style="margin-right: auto; margin-left: auto; margin-top: 50px; float: none">
                                <button class="btn btn-lg btn-primary" type="button" data-toggle="modal" data-target="#myModal">Add New Package</button>
                            </div>
                        </div>
                    </div>
                    <div id="normal_flow" runat="server">
                        

                        <div class="row">
                            <div class="col-md-12">
                                <h4>All Packages</h4>
                            </div>
                            <uc1:PackageGrid runat="server" id="PackageGrid" OnPackageClicked="PackageGrid_PackageClicked" />
                        </div>
                    </div>

                </div>
               
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document" style="width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">New Package</h4>
            </div>
            <div class="modal-body" style="height: 620px;">
                <div class="col-md-12">
                    <uc1:PackageBasicInfo runat="server" ID="PackageBasicInfo" OnPackageAdded="PackageBasicInfo_PackageAdded"/>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
