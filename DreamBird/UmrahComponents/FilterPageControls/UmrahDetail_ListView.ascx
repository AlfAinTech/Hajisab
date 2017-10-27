<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UmrahDetail_ListView.ascx.cs" Inherits="UmrahComponents_FilterPageControls_UmrahDetail_ListView" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
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
                        <asp:UpdatePanel ID="packageUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true" >
                             
                             <ContentTemplate>
                                <div class="col-md-12 search_result" style="margin-top: 15px; margin-bottom: 10px; padding: 0;">
                                    <div id="search_result_filter">

                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs nav-stacked" role="tablist">
                                            <li role="presentation" class="active"><a href='<%# "#makkah"+Eval("id") %>' aria-controls="makkah" role="tab" data-toggle="tab">Makkah Hotel</a></li>
                                            <li role="presentation"><a href='<%# "#madina"+Eval("id") %>' aria-controls="madina" role="tab" data-toggle="tab">Madina Hotel</a></li>
                                        </ul>

                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id='<%# "makkah"+Eval("id") %>'>
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <div class="col-md-7">
                                                            <div class="row">
                                                                <img src='<%# Eval("Hotel1.MediaItem.Path500") %>' width="100%">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 search_detail">
                                                            <div class="row">
                                                                <div class="col-md-12" style="border-bottom: 1px solid #a6a6a6;">
                                                                    <h3><%# Eval("Hotel1.distance")+" Meter" %></h3>
                                                                    <h5>From Masjid Haram</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12" style="border-bottom: 1px solid #a6a6a6;">
                                                                    <h3>
                                                                        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><asp:LinkButton ID="LinkButton1" runat="server"><div class="arrow-down"></div></asp:LinkButton>--%>
                                                                        <asp:DropDownList ID="makkahAccom" CssClass="form-control" Style="background-color: #f6f6f6; border-radius: 0px;" runat="server" DataSource='<%# Eval("Hotel1.Accommodations") %>' DataValueField="id" DataTextField="Name" AutoPostBack="True" ClientIDMode="AutoID"  OnSelectedIndexChanged="AccommodationMakkah_Changed"></asp:DropDownList></h3>
                                                                    <h5>Accommodation Makkah</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h3><%# Eval("Hotel1.getServiceCount") %></h3>
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
                                                        <div class="col-md-7">
                                                            <div class="row">
                                                                <img src='<%# Eval("Hotel.MediaItem.Path500") %>' width="100%">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 search_detail">
                                                            <div class="row">
                                                                <div class="col-md-12" style="border-bottom: 1px solid #a6a6a6;">
                                                                    <h3><%# Eval("Hotel.distance")+" Meter" %></h3>
                                                                    <h5>From Masjid Nabvi</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12" style="border-bottom: 1px solid #a6a6a6;">
                                                                    <h3>
                                                                        <asp:DropDownList ID='madinaAccom' CssClass="form-control" Style="background-color: #f6f6f6; border-radius: 0px;" runat="server" DataSource='<%# Eval("Hotel.Accommodations") %>' DataValueField="id" DataTextField="Name" ClientIDMode="AutoID"   OnSelectedIndexChanged="AccommodationMakkah_Changed"></asp:DropDownList></h3>
                                                                    </h3>
                                       
                                                                    <h5>Accommodation Madina</h5>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <h3><%# Eval("Hotel.getServiceCount") %></h3>
                                                                    <h5>Additional Services</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-5" style="padding-top: 15px;">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-4 detail_package_name">
                                                    <h5>Madina Hotel : </h5>
                                                </div>
                                                <div class="col-md-8 detail_package_detail">
                                                    <h5><%# Eval("Hotel.hotelName").ToString().Length > 20 ? Eval("Hotel.hotelName").ToString().Substring(0,20)+"..." : Eval("Hotel.hotelName") %></h5>
                                                    <div class="col-md-12" style="padding: 0;" runat="server" id="star_div">
                                                        <h6 style="font-size: .8em;"><span class="stars" data-rating='<%# Eval(" Hotel.rating") %>' data-num-stars='<%# Eval(" Hotel.rating") %>'></span></h6>
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
                                                        <h6 style="font-size: .8em;"><span class="stars" data-rating='<%# Eval(" Hotel1.rating") %>' data-num-stars='<%# Eval(" Hotel1.rating") %>'></span></h6>
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
                                    <div class="col-md-3" style="padding-top: 35px;">
                                        <div class="row" style="border-left: 3px solid #a6a6a6;">
                                            <h5>Starting From</h5>
                                            <h2>
                                                <asp:Label ID="price" runat="server" Text='<%# decimal.Parse(Eval("minRange").ToString()).ToString("#,##0")+" " %>'></asp:Label>
                                                PKR</h2>
                                            <div class="col-md-8" style="margin-right: auto; margin-left: auto; float: none;">
                                                ‏‏ 
                                               
                                                <asp:Button runat="server" CommandArgument='<%# Eval("id") %>' Text="Book Now" ID="bookNow" class="btn btn-primary" OnClick="bookNowClicked" />
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
