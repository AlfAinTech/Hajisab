<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotelSearch.ascx.cs" Inherits="UmrahComponents_AdminControls_Hotel_HotelSearch" %>
<script src="<%# Server.MapPath("~/") %>/Content/JavaScriptSpellCheck/include.js"></script>
<script type="text/javascript">
    var timoutInterval
    function keyStroke() {
        $('#didyoumean').css("display", "block")
        clearTimeout(timoutInterval)
        timoutInterval = setTimeout(ajaxDYM(), 500)
    }

    function fixSuggestions(link) {
        SearchBoxText = document.getElementById('SearchBox').value = link.innerHTML;
        link.innerHTML = "";
        $('#didyoumean').css("display", "none");
    }

    function ajaxDYM() {
        var SearchBoxText = document.getElementById('SearchBox').value;

        o = $Spelling.AjaxDidYouMean(SearchBoxText)

        o.onDidYouMean = function (result) {
            var oSuggestionLink = document.getElementById('suggestionLink');
            if (result) {

                oSuggestionLink.innerHTML = result
            } else {
                oSuggestionLink.innerHTML = "";
            }
        }
    }

</script>


<div class="col-md-10" style="padding: 15px; background-color: #404040; display: inline-block;">
    <div class="col-md-8" style="padding: 0;">
        <asp:TextBox ID="SearchBox" Name="SearchBox" ClientIDMode="Static" onkeyup="keyStroke()" class="form-control" runat="server"></asp:TextBox>
        <%--<input type="text" class="form-control" />--%>
    </div>
    <div class="col-md-4" style="padding: 0;">
        <asp:Button ID="search_hotel" runat="server" OnClick="search_hotel_Click" Text="Search" Style="width: 100%;" class="btn btn-default" CausesValidation="false" />
        <%--<button type="button" style="width:100%" class="btn btn-default">Search Everything</button>--%>
    </div>
        <div class="col-md-12" id="didyoumean" style="background-color:white; display:none;">Did You Mean:<a id='suggestionLink' href='#' onclick='fixSuggestions(this); return false;'></a></div>

</div>

