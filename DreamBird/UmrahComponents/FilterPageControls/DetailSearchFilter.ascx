<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DetailSearchFilter.ascx.cs" Inherits="UmrahComponents_FilterPageControls_DetailSearchFilter" %>
<%@ Register Src="~/UmrahComponents/FilterPageControls/UmrahDetail_ListView.ascx" TagPrefix="uc1" TagName="UmrahDetail_ListView" %>

<%--<uc1:UmrahDetail_ListView runat="server" ID="UmrahDetail_ListView" />--%>
<script type="text/javascript">
    bindDataScript = function (id) {
        console.log("here");
        var el, newPoint, newPlace, offset;

        // Select all range inputs, watch for change
        //$("#price_txt").change(function () {

        // Cache this for efficiency
        dataInput = $("input[type='range']");
        dataInput.each(function () {
            console.log(this)
            // Measure width of range input
            el = $(this);
            width = el.width();

            // Figure out placement percentage between left and right of input
            newPoint = (el.val() - el.attr("min")) / (el.attr("max") - el.attr("min"));

            // Janky value to get pointer to line up better
            offset = -1.3;

            // Prevent bubble from going beyond left or right (unsupported browsers)
            if (newPoint < 0) { newPlace = 0; }
            else if (newPoint > 1) { newPlace = width; }
            else { newPlace = width * newPoint + offset; offset -= newPoint; }

            // Move bubble
            console.log(el.next("output"))
            el
            .next("output")
            .css({
                left: newPlace,
                marginLeft: offset + "%"
            })
            .text(el.val());
            //})
            // Fake a change to position bubble at page load
            //.trigger('change');

        });
    }
    </script>
<div id="slider_wrapper">
    <div id="slider_overlay">
        <h1>Filter Packages
        </h1>
        <h3>Filter Packages right according to your needs!
       </h3>
        <div class="container search_bar" data-spy="affix" data-offset-top="310">

            <div class="col-md-12">
                <div class="col-md-2 search_items">
                    <h5>Price Range</h5>
                    <asp:TextBox ID="control1" Style="margin-top:47px;" type="range" runat="server" name="price_range" OnTextChanged="price_range_TextChanged" onchange="bindDataScript()"></asp:TextBox>
                    <output for="price_range" onforminput="value = price_range.valueAsNumber;"></output>
                </div>
                <div class="col-md-2 search_items">
                    <h5>Month</h5>
                    <asp:TextBox ID="control2" CssClass="form-control" runat="server" type="month" OnTextChanged="package_month_TextChanged" onchange="bindDataScript()"></asp:TextBox>

                </div>
                <div class="col-md-2 search_items">
                    <h5>Duration of Stay</h5>
                    <asp:TextBox ID="control3" Style="margin-top:47px;" name="duration_txt" type="range" runat="server" OnTextChanged="duration_txt_TextChanged" onchange="bindDataScript()"></asp:TextBox>
                    <output for="duration_txt" onforminput="value = fooduration_txtvalueAsNumber;" onchange="bindDataScript()"></output>
                </div>
                <div class="col-md-2 search_items">
                    <h5>Accommodation</h5>
                    <asp:DropDownList runat="server" class="form-control" ID="control4" OnSelectedIndexChanged="rating_Changed" onchange="bindDataScript()">
                        <asp:ListItem Selected="True">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Economy</asp:ListItem>
                        <asp:ListItem Value="2">Budget</asp:ListItem>
                        <asp:ListItem Value="3">3 Star</asp:ListItem>
                        <asp:ListItem Value="4">4 Star</asp:ListItem>
                        <asp:ListItem Value="5">5 Star</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 search_items">
                    <h5>Flight</h5>
                    <asp:DropDownList ID="control5" runat="server" CssClass="form-control" OnSelectedIndexChanged="airLine_list_SelectedIndexChanged" DataTextField="Name" DataValueField="id" onchange="bindDataScript()">
                        <asp:ListItem Selected="True">--Select--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 search_items_last">
                    <h5>Distance</h5>
                    <asp:TextBox name="foo" ID="control6" Style="margin-top:47px;" runat="server" type="range" OnTextChanged="distanceHaram_txt_TextChanged" onchange="bindDataScript()"></asp:TextBox>
                    <output for="foo" onforminput="value = foo.valueAsNumber;"></output>
                </div>
            </div>
           <%-- <div class="col-md-12">
                <div class="col-md-2" style="margin-top: 10px;">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2" style="margin-top: 10px;">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-2" style="margin-top: 10px;">
                </div>
            </div>--%>

            <div class="col-md-12" style="margin-top:10px;">
                <div class="col-md-8">
                    <div class="col-md-2" style="padding: 0;">
                        <h5 style="margin-top: 10px; margin-bottom: 5px;">Current Filters</h5>
                    </div>
                    <div class="col-md-10" style="padding-right: 0; padding-top: 5px;">
                        <ul class="tags">
                            <asp:Panel ID="panel1" runat="server" Visible="false">
                                <li>
                                    <asp:LinkButton ID="btn1" CssClass="tag" runat="server" CommandArgument="1" OnClick="delete_filter">Price</asp:LinkButton></li>
                            </asp:Panel>
                            <asp:Panel ID="panel2" runat="server" Visible="false">
                                <li>
                                    <asp:LinkButton ID="btn2" runat="server" CssClass="tag" CommandArgument="2" OnClick="delete_filter">Month</asp:LinkButton></li>
                            </asp:Panel>
                            <asp:Panel ID="panel3" runat="server" Visible="false">
                                <li>
                                    <asp:LinkButton runat="server" ID="btn3" CssClass="tag" CommandArgument="3" OnClick="delete_filter">Duration</asp:LinkButton></li>
                            </asp:Panel>
                            <asp:Panel ID="panel4" runat="server" Visible="false">
                                <li>
                                    <asp:LinkButton runat="server" ID="btn4" CssClass="tag" CommandArgument="4" OnClick="delete_filter">Accommodation</asp:LinkButton></li>
                            </asp:Panel>
                            <asp:Panel ID="panel5" runat="server" Visible="false">
                                <li>
                                    <asp:LinkButton runat="server" ID="btn5" CssClass="tag" CommandArgument="5" OnClick="delete_filter">Flight</asp:LinkButton></li>
                            </asp:Panel>
                            <asp:Panel ID="panel6" runat="server" Visible="false">
                                <li>
                                    <asp:LinkButton runat="server" ID="btn6" CssClass="tag" CommandArgument="6" OnClick="delete_filter">Distance</asp:LinkButton></li>
                            </asp:Panel>

                        </ul>
                    </div>
                </div>
                <div class="col-md-4" style="padding-right: 0;">
                    <div class="col-md-6">
                        <h5 style="margin-top: 10px; margin-bottom: 0px;">
                            <asp:Label ID="foundRecord" runat="server"></asp:Label></h5>
                    </div>
                    <div class="col-md-6">
                        <asp:Button class="btn btn-primary" ID="searchBtn" Style="width: 100%;" runat="server" Text="Update Filter" OnClick="searchBtn_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
