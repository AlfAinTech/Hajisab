<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomPackageAdd.ascx.cs" Inherits="UmrahComponents_PackageComponent_CustomPackageAdd" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackageItenryDetail.ascx" TagPrefix="uc1" TagName="PackageItenryDetail" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">
      <asp:HiddenField ID="hiddenprice" runat="server" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
 <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
<script  type="text/javascript" >
    
    $.fn.stars = function() {
        return $(this).each(function() {

            var rating = $(this).data("rating");

            var numStars = $(this).data("numStars");

            var fullStar = new Array(Math.floor(rating + 1)).join('<i class="fa fa-star" style="color: #ff9900;"></i>');

            var halfStar = ((rating%1) !== 0) ? '<i class="fa fa-star-half-empty"></i>': '';

            var noStar = new Array(Math.floor(numStars + 1 - rating)).join('<i class="fa fa-star-o"></i>');

            $(this).html(fullStar + halfStar + noStar);

        });
    }

    $('.stars').stars();
   
  
    </script></asp:PlaceHolder>


<div class="col-md-12 search_result" style="margin-top: 15px; margin-bottom: 10px; padding:0;">
      <div id="search_result_hotel" class="big_detail">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#makkahImg" aria-controls="home" role="tab" data-toggle="tab">Makkah Hotel</a></li>
          <li role="presentation"><a href="#madinaImg" aria-controls="profile" role="tab" data-toggle="tab">Madina Hotel</a></li>
        </ul>

       <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="makkahImg">
            <div class="col-md-4" style="padding:0;">
                <asp:Image ID="hotelMakkah_img" runat="server" width="100%"  style="border-right:3px solid #e6e6e6;"/>
            </div>
          </div>
          <div role="tabpanel" class="tab-pane" id="madinaImg">
            <div class="col-md-4" style="padding:0;">
                <asp:Image ID="hotelMadina_img" runat="server" width="100%" style="border-right:3px solid #e6e6e6;"/>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-8">
           <h2 style="text-align:left;"><asp:Label ID="package_name" runat="server" ></asp:Label></h2>
        <div class="row">
          <div class="col-md-3">
              <h5 style="text-align:left;">Total Nights : </h5>
          </div>
          <div class="col-md-9 detail_package_detail">
             <h5> <asp:Literal ID="totelNights" runat="server"></asp:Literal> Nights </h5>
          </div>
        </div>
          <div class="row">
          <div class="col-md-3">
              <h5 style="text-align:left;">Visit Month : </h5>
          </div>
          <div class="col-md-3 detail_package_detail">
             <h5> <asp:TextBox type="month" ID="txtMonth" OnTextChanged="txtMonth_TextChanged" CssClass="form-control" runat="server" AutoPostBack="True"></asp:TextBox> </h5>
          </div>
        </div>
        <div class="col-md-7" style="border:2px solid #e6e6e6;">

          <div class="row">
              <div class="col-md-12">
                  <div class="col-md-3">
                      <h5 style="text-align:left;">Stay At Madina : </h5>
                  </div>
                  <div class="col-md-8 detail_package_detail">
                       <h5><asp:TextBox ID="nights_inMadina" OnTextChanged="nights_inMadina_TextChanged" CssClass="form-control" ClientIDMode="Static" runat="server" AutoPostBack="True" ></asp:TextBox></h5>
                  </div>
              </div>
          </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Madina Hotel : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
              <h5><asp:TextBox ID="hotelDistance_madina" OnTextChanged="hotelDistance_madina_TextChanged" placeholder="Distance in meter" CssClass="form-control" runat="server" AutoPostBack="True" ></asp:TextBox></h5>
              <div class="col-md-4" style="padding:0;font-size: .8em;"><h3 style="font-size: .8em;"><asp:Label runat="server" id="hotelRating_madina" CssClass="stars"></asp:Label></h3></div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <h4><a style="font-weight:800; color:#871ec3;">Select Hotel</a></h4>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Room Type : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
                              <asp:RadioButtonList ID="madinaAccommodation_list" OnSelectedIndexChanged="madinaAccommodation_list_SelectedIndexChanged"  CssClass="RadioButtonList"  ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="id" RepeatDirection="Horizontal" AutoPostBack="True" ViewStateMode="Enabled"> </asp:RadioButtonList>
            </div>
          </div>
        </div>
        
      </div>
      <div class="col-md-7" style="border:2px solid #e6e6e6; margin-top:15px;">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <h5 style="text-align:left;">Stay at Makkah : </h5>
                </div>
                <div class="col-md-8 detail_package_detail">
                       <h5> <asp:TextBox ID="nights_inMakkah" OnTextChanged="nights_inMakkah_TextChanged" CssClass="form-control" ClientIDMode="Static" runat="server" AutoPostBack="True"></asp:TextBox></h5>
                </div>
            </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Makkah Hotel : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
              <h5><asp:TextBox ID="hotelDistance_makkah"  OnTextChanged="hotelDistance_makkah_TextChanged" CssClass="form-control" runat="server" AutoPostBack="True" ></asp:TextBox></h5>
              <div  style="padding:0;font-size: .8em;" runat="server" id="star_div"><h6 style="font-size: .8em;"><asp:Label runat="server" ID="hotelRating_makkah"  CssClass="stars" data-rating='<%# Eval(" Hotel.rating") %>' data-num-stars='<%# Eval(" Hotel.rating") %>' ></asp:Label></h6></div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <h4><a style="font-weight:800; color:#871ec3;">Select Hotel</a></h4>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Room Type : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
                            <asp:RadioButtonList ID="makkahAccommodation_list" OnSelectedIndexChanged="makkahAccommodation_list_SelectedIndexChanged" ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="id" RepeatDirection="Horizontal"  CssClass="RadioButtonList" AutoPostBack="True" ViewStateMode="Enabled"> </asp:RadioButtonList>
            </div>
          </div>
        </div>
       
      </div>




        <div class="row">
            <div class="col-md-7">
                <div class="col-md-2">
                    <h5 style="text-align:left;">Flight </h5>
                </div>
                <div class="col-md-10 detail_package_detail">
                     
                    <div class="col-md-6">
                        <h4><asp:RadioButton  GroupName="trip" runat="server" ID="one_way_chk" OnCheckedChanged="one_way_chk_CheckedChanged" style="margin-right: 15px;" AutoPostBack="True"/>One Way</h4>
                    </div>
                    <div class="col-md-6">
                        <h4><asp:RadioButton  GroupName="trip" runat="server"  OnCheckedChanged="one_way_chk_CheckedChanged" ID="roundTrip_chk" style="margin-right: 15px;" AutoPostBack="True"/>Round Trip</h4>
                    </div>
                    </div>             
                </div>
              <div class="col-md-7">
                 <div class="col-md-2">
                            <h5  style="text-align:left;">AirLine</h5>
                            </div>
                        <div class="col-md-10">
                        <asp:DropDownList ID="ddlAirLine"  OnSelectedIndexChanged="ddlAirLine_SelectedIndexChanged" DataValueField="id" DataTextField="Name" class="form-control"  runat="server" AutoPostBack="True"></asp:DropDownList>
                    
                        </div>
                  </div>
            </div>
       
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <h5 style="text-align:left;">Original Price : </h5>
                </div>
                <div class="col-md-8 detail_package_detail">
                    <h4 >
                      <asp:Label ID="Computed_amount" runat="server" ClientIDMode="Static">--</asp:Label>  PKR
                    </h4>
                </div>
            </div>
        </div>
      
      
        <div class="row">
            <div class="col-md-3">
                           <asp:Button runat="server" ID="bookPackage" class="btn btn-primary" Text="Book Now"    ValidationGroup="bookInput" OnClick="bookPackage_Click"/>
            </div>
        </div>
       
    </div>