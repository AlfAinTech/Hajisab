<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrimaryUmrahPackages.ascx.cs" Inherits="UmrahComponents_PackageComponent_PrimaryUmrahPackages" %>
<div id="primary_package_wrapper">
    <h2 style="margin-top:30px;">Primary Packages</h2>
    <h4 style="color:black;">Our Primary Umrah Packages have been divided into three major categories</h4>
    <div class="container">
        <asp:Repeater runat="server" ID="primaryPkg_list">
            <ItemTemplate>
                <div class="col-md-4">
            <div class="col-md-12 primary_packages">
                <div class="primary_package_overlay">
                    <div class="col-md-9" style="float:right;">
                        <div class="col-md-12" style="padding:0;">
                            <h3><%# Eval("PackageType") %></h3>
                        </div>
                        <div class="col-md-12" style="padding:0; border-bottom: 1px solid white;">
                            <h4>Starting From <span ><%# Eval("minRange") %></span> PKR</h4>
                        </div>
                        <div class="col-md-12" style="padding:0;">
                            <ul>
                                <li><%# Eval("getTotelnights")+" Nights" %>
                                </li>
                                <li><%# Eval("Hotel1.hotelName").ToString().Length > 10 ? Eval("Hotel1.hotelName").ToString().Substring(0,10)+"..." : Eval("Hotel1.hotelName") %>
                                </li>
                                <li><%# Eval("Hotel.hotelName").ToString().Length > 10 ? Eval("Hotel.hotelName").ToString().Substring(0,10)+"..." : Eval("Hotel.hotelName") %>
                                </li>
                                
                            </ul>
                        </div>
                        <div class="col-md-6" style="padding:0; margin-right: auto; margin-left: auto; float: none;">
                            <asp:Button runat="server" ID="Explore"  CommandArgument='<%# Eval("id") %>' class="btn btn-default" Text="Explore"  OnClick="Explore_clicked"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </ItemTemplate>
        </asp:Repeater>
        
        
    </div>
</div>