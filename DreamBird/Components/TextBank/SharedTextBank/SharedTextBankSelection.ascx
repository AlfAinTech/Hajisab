<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SharedTextBankSelection.ascx.cs" Inherits="Components_TextBank_SharedTextBankSelection" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextBankList.ascx" TagPrefix="uc1" TagName="SharedTextBankList" %>
<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextDetail.ascx" TagPrefix="uc1" TagName="SharedTextDetail" %>

<div class="col-md-12" style="padding: 0;">
    <div class="well">
        <a href="#" target="_blank" style="color: white;" runat="server" id="pageNavigate">
            <h3>
                <asp:Label ID="dream_name" runat="server"></asp:Label>/<asp:Label ID="page_name" runat="server"></asp:Label>
            </h3>
        </a>
    </div>
</div>
<div class="col-md-12">
    <div class="col-md-3" id="side-nav">
        
<uc1:SharedTextBankList runat="server" ID="SharedTextBankList"  OnTextClicked="TextClicked_searchText" ShowAddBtn="false"/>
        
    </div>
    <div class="col-md-9">
        
<uc1:SharedTextDetail runat="server" ID="SharedTextDetail"  EditableText="false"  OnSelect_clicked="SelectClicked_Clicked"/>
        
    </div>
</div>
                                 
                                          
