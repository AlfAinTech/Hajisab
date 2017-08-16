<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="Admin_News" %>

<%@ Register Src="~/Components/News/AddNews.ascx" TagPrefix="uc1" TagName="AddNews" %>
<%@ Register Src="~/Components/News/NewControls/GeneralNewsView.ascx" TagPrefix="uc1" TagName="GeneralNewsView" %>
<%@ Register Src="~/Components/News/NewControls/NewsListForAdmin.ascx" TagPrefix="uc1" TagName="NewsListForAdmin" %>
<%@ Register Src="~/Components/News/NewControls/EditNewsForAdmin.ascx" TagPrefix="uc1" TagName="EditNewsForAdmin" %>
<%@ Register Src="~/Components/News/NewControls/NewsSearch.ascx" TagPrefix="uc1" TagName="NewsSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-3" style="padding: 0;">
                <div class="col-md-12" id="welcome_nav">
                    <asp:LoginView ID="LoginView1" runat="server" ViewStateMode="Disabled">
                        <LoggedInTemplate>
                            <h3><a runat="server" href="~/Account/Manage" title="Manage your account">Good Day, <%: Context.User.Identity.GetUserName()  %>!</a></h3>
                        </LoggedInTemplate>
                    </asp:LoginView>
                </div>
                <div class="col-md-12" id="side-nav" style="min-height: 470px;">
                    <div class="col-md-12" id="add-dream">
                    </div>
                    <uc1:NewsSearch runat="server" ID="NewsSearch" OnSearchClicked="NewsSearch_SearchClicked" />
                </div>
                <div class="col-md-9" id="main-content">
                    <h2>News</h2>
                    <div class="media-pan">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <div class="col-md-12">
                            <div class="col-md-1">

                                <button type="button" class="btn btn-primary" id="add_news" runat="server" causesvalidation="false" onserverclick="add_news_ServerClick">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true" style="color: white;"></span>
                                </button>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <uc1:NewsListForAdmin runat="server" ID="NewsListForAdmin" OnEditClicked="NewsListForAdmin_EditClicked" />
                            <div id="EditNews">
                                <div class="modal bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog modal-lg" role="document" style="width: 95vw; height: 90vh;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Edit News</h4>
                                            </div>
                                            <div class="modal-body" style="height: auto; display: -webkit-box;">
                                                <uc1:EditNewsForAdmin runat="server" ID="EditNewsForAdmin" />
                                            </div>
                                            <div class="modal-footer" style="height: auto; display: -webkit-box;">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

