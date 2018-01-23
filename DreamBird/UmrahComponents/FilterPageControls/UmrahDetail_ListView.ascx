<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UmrahDetail_ListView.ascx.cs" Inherits="UmrahComponents_FilterPageControls_UmrahDetail_ListView" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
    .max-height {
        height: 253px;
    }

    @media (max-width:1199px) {
        .search_detail h4 {
            font-size: 10px;
        }
        .search_detail b{
            font-size:14px;
        }

        h5 {
            font-size: 9px;
        }

        .max-height {
            height: 209px;
        }
    }
</style>
<script>
   
</script>

<div class="content_wrap">
    <div class="container">
        <h4>
            <asp:Label ID="package_found" runat="server"></asp:Label></h4>
        <asp:UpdatePanel ID="WholeUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <asp:Panel runat="server" ID="Empty_Panel" Visible="false">
                    <div class="col-md-12 search_result" style="text-align: center; margin-top: 15px; margin-bottom: 10px; padding: 0;">
                        <h4>
                            <asp:Label runat="server" ID="EmptyMsg">No Package Found According to your search Criteria. </asp:Label></h4>
                    </div>
                </asp:Panel>
                <asp:Repeater runat="server" ID="package_list" OnItemDataBound="package_list_ItemDataBound">
                    <ItemTemplate>
                        <asp:UpdatePanel ID="packageUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">

                            <ContentTemplate>
                                <div class="col-md-12 search_result">
                                    <div id="search_result_filter">

                                        <!-- Nav tabs -->
                                        <div class="search_result_filter" style="width: 22.3%; height: 100px; position: absolute;">
                                            <ul class="nav nav-tabs nav-stacked" role="tablist">
                                                <li role="presentation" class="active"><a href='<%# "#makkah"+Eval("id") %>' aria-controls="makkah" role="tab" data-toggle="tab">Makkah Hotel</a></li>
                                                <li role="presentation"><a href='<%# "#madina"+Eval("id") %>' aria-controls="madina" role="tab" data-toggle="tab">Madina Hotel</a></li>
                                            </ul>
                                        </div>

                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id='<%# "makkah"+Eval("id") %>'>
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="row">
                                                                <%-- <img src='<%# Eval("Hotel1.MediaItem.Path500") %>' style="width:100%;">--%>
                                                                <img src="/UmrahComponents/Contents/img/1000x1000.jpg" style="width: 100%;" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 search_detail">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h4><b><%# Eval("Hotel1.distance") %></b>KM</h4>
                                                                    <h5>From Masjid Haram</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-push-3 col-md-6" style="border-bottom: 1px solid #a6a6a6;"></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h4>
                                                                        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><asp:LinkButton ID="LinkButton1" runat="server"><div class="arrow-down"></div></asp:LinkButton>--%>
                                                                        <b>
                                                                        <asp:DropDownList ID="makkahAccom" CssClass="form-control" Style="background-color: #f6f6f6; border-radius: 0px; height: 33px;" runat="server" DataSource='<%# Eval("Hotel1.Accommodations") %>' DataValueField="id" DataTextField="Name" AutoPostBack="True" ClientIDMode="AutoID" OnSelectedIndexChanged="AccommodationMakkah_Changed"></asp:DropDownList>
                                                                        </b>
                                                                    </h4>
                                                                    <h5>Residence Makkah</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-push-3 col-md-6" style="border-bottom: 1px solid #a6a6a6;"></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h4><b><%# Eval("Hotel1.getServiceCount") %></b></h4>
                                                                    <h5>Additional Services</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id='<%# "madina"+Eval("id") %>'>
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="row">
                                                                <%-- <img src='<%# Eval("Hotel.MediaItem.Path500") %>' width="100%">--%>
                                                                <img src="/UmrahComponents/Contents/img/hotel.jpg" style="width: 100%;" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 search_detail">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h4><b><%# Eval("Hotel.distance") %></b>KM</h4>
                                                                    <h5>From Masjid Nabvi</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-push-3 col-md-6" style="border-bottom: 1px solid #a6a6a6;"></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h4>
                                                                        <b>
                                                                        <asp:DropDownList ID='madinaAccom' CssClass="form-control" Style="background-color: #f6f6f6; border-radius: 0px; height: 33px;" runat="server" DataSource='<%# Eval("Hotel.Accommodations") %>' DataValueField="id" DataTextField="Name" AutoPostBack="true" ClientIDMode="AutoID" OnSelectedIndexChanged="AccommodationMakkah_Changed"></asp:DropDownList></h4>
                                                                    </b>
                                                                    </h3>
                                       
                                                                    <h5>Residence Madina</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-push-3 col-md-6" style="border-bottom: 1px solid #a6a6a6;"></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h4><%# Eval("Hotel.getServiceCount") %></h4>
                                                                    <h5>Additional Services</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-5 max-height" style="padding-top: 45px;">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4 detail_package_name">
                                                    <h5>Madina Hotel : </h5>
                                                </div>
                                                <div class="col-md-8 detail_package_detail">
                                                    <h5><%# Eval("Hotel.hotelName").ToString().Length > 20 ? Eval("Hotel.hotelName").ToString().Substring(0,20)+"..." : Eval("Hotel.hotelName") %></h5>
                                                    <div class="col-md-12" style="padding: 0;" runat="server" id="star_div">
                                                        <h6 style="font-size: .8em; margin-top: 0;"><span class="stars" data-rating='<%# Eval(" Hotel.rating") %>' data-num-stars='<%# Eval(" Hotel.rating") %>'></span></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4 detail_package_name">
                                                    <h5>Makkah Hotel : </h5>
                                                </div>
                                                <div class="col-md-8 detail_package_detail">
                                                    <h5><%# Eval("Hotel1.hotelName").ToString().Length > 20 ? Eval("Hotel1.hotelName").ToString().Substring(0,20)+"..." : Eval("Hotel1.hotelName") %></h5>
                                                    <div class="col-md-12" style="padding: 0;" runat="server" id="Div1">
                                                        <h6 style="font-size: .8em; margin-top: 0px;"><span class="stars" data-rating='<%# Eval(" Hotel1.rating") %>' data-num-stars='<%# Eval(" Hotel1.rating") %>'></span></h6>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4 detail_package_name">
                                                    <h5>No. of Nights : </h5>
                                                </div>
                                                <div class="col-md-8 detail_package_detail">
                                                    <h5><%# Eval("getTotelNights") %></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4 detail_package_name">
                                                    <h5>Stay At Makkah : </h5>
                                                </div>
                                                <div class="col-md-8 detail_package_detail">
                                                    <h5><%# Eval("nightsInMakkah")+" Nights" %></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4 detail_package_name">
                                                    <h5>Stay at Madina : </h5>
                                                </div>
                                                <div class="col-md-8 detail_package_detail">
                                                    <h5><%# Eval("nightsInMadina")+" Nights" %></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4 detail_package_name">
                                                    <h5>Flight : </h5>
                                                </div>
                                                <div class="col-md-8 detail_package_detail">
                                                    <h5><%# Eval("getairline") %></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="banner" runat="server" visible='<%# Eval("IsDiscount") %>'>
                                            <h5>Book now for</h5>
                                            <div class="col-md-8" style="padding: 0;">

                                                <h2><%# Eval("getDiscountValue")+"%" %></h2>

                                            </div>
                                            <div class="col-md-3" style="padding: 0;">

                                                <h5>OFF</h5>

                                            </div>

                                        </div>
                                        <div class="banner_bottom" runat="server" visible='<%# Eval("IsDiscount") %>'></div>

                                    </div>
                                    <div class="col-md-3 max-height">
                                        <div class="max-height" style="display:inline-block;float:left;padding:30% 0;">
                                            <div style="border-left: 1px solid #a6a6a6;height:100%;"></div>
                                        </div>
                                        <div style="padding-top: 20%;display:inline-block;width:98%;float:right;">
                                            <div >
                                                <h4 style="font-family:'Lato-Bold';opacity:0.5;margin:0;">Starting From</h4>
                                                <h2>
                                                    <asp:Label ID="price" runat="server" Text='<%# decimal.Parse(Eval("minRange").ToString()).ToString("#,##0")+" " %>'></asp:Label>
                                                    <span class="pkr">PKR</span>
                                                </h2>
                                                <div class="col-md-10" style="margin-right: auto; margin-left: auto; float: none;">
                                                <asp:Button runat="server" CommandArgument='<%# Eval("id") %>' Text="Book Now" ID="bookNow" class="btn btn-primary" OnClick="bookNowClicked" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h6 id="disclaimer"><em>* Prices may vary according to number of visitors and room type</em></h6>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </ItemTemplate>


                </asp:Repeater>

                <div class="col-md-12">
                    <div class="col-md-5" style="margin-right: auto; margin-left: auto; float: none;">
                        <asp:UpdatePanel ID="update_forPAging" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination" id="PagingList">
                                        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand" OnItemDataBound="rptPaging_ItemDataBound">
                                            <HeaderTemplate>
                                                <li>
                                                    <asp:LinkButton ID="prevButton" OnClick="OnNextBack_clicked" CommandArgument="-1" runat="server" Font-Bold="True"><span aria-hidden="true">&laquo;</span></asp:LinkButton></li>
                                                <li>
                                                    <asp:LinkButton ID="FirstButton" OnClick="FirstButton_Click" CommandArgument="-1" runat="server" Font-Bold="True"><span aria-hidden="true">First</span></asp:LinkButton></li>

                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li id='<%# Container.DataItem %>'>
                                                    <asp:LinkButton ID="lnkPage"
                                                        CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                                        runat="server" Font-Bold="True"><%# Container.DataItem %>
                                                    </asp:LinkButton></li>
                                            </ItemTemplate>
                                            <FooterTemplate>

                                                <li>
                                                    <asp:LinkButton ID="LastButton" OnClick="LastButton_Click" ClientIDMode="AutoID" runat="server" CommandArgument="1" Font-Bold="True"><span aria-hidden="true">Last</span></asp:LinkButton></li>
                                                <li>
                                                    <asp:LinkButton ID="nextButton" OnClick="OnNextBack_clicked" ClientIDMode="AutoID" runat="server" CommandArgument="1" Font-Bold="True"><span aria-hidden="true">&raquo;</span></asp:LinkButton></li>
                                            </FooterTemplate>
                                        </asp:Repeater>

                                    </ul>
                                </nav>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
