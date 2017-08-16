<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchWithHeader.ascx.cs" Inherits="Components_Header_SearchWithHeader" %>
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
<div class="main_image">
	
    
<div class="col-md-12" id="searchbar">
	<div class="col-md-8" style="margin-left:auto; margin-right:auto; float:none;">
		<div class="col-md-9">
            <asp:TextBox ID="SearchBox" runat="server" ClientIDMode="Static" onkeyup="keyStroke()" class="form-control"></asp:TextBox>
        <div class="col-md-12" id="didyoumean" style="background-color:transparent; display:none;"><h5>Did You Mean:<a id='suggestionLink' href='#' onclick='fixSuggestions(this); return false;'></a></h5></div>
		</div>
		<div class="col-md-3">
            <button id="search_dream" class="btn btn-default">Search Dream</button>
            <%--<asp:Button ID="search_dream" runat="server" OnClick="search_dream_Click" Text="Search Dream" style="width:100%" class="btn btn-default"/>--%>
		</div>
		
	</div>
  

 
</div>
    </div>
