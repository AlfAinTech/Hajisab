<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UmrahChatheader.ascx.cs" Inherits="UmrahComponents_headerFooter_UmrahChatheader" %>
<%@ Register Src="~/chat/ChatControl.ascx" TagPrefix="uc1" TagName="ChatControl" %>

<div id="slider_wrapper">
    <div id="slider_overlay">

        <div id="right">
            <div id="first">
               <%-- <div class="bot chat">
                    <div class="oval-thought">
                        <p>Welcome! I'm Haji sb. I'm here to answer all your queries</p>
                    </div>
                </div>--%>
                <h1>
                    Planning for Umrah
                </h1>
                <h3>
                    Want to book <strong>Online? </strong> Need <strong>Guidline? </strong> Best <strong>Packages?</strong>
                </h3>
                <h3>We are here for you available <strong>24/7!</strong></h3>
                <h3>Lets <strong>Plan</strong></h3>
                <div class="col-md-6" style="margin-right: auto; margin-left: auto; float: none; margin-top: 20px;">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><asp:LinkButton runat="server"   class="btn btn-default" id="learn_more" style="width:100%;" OnClick="learn_moreClicked">Learn More</asp:LinkButton></div>
                     <div class="col-md-3"><asp:LinkButton runat="server"   class="btn btn-primary" id="openCustomWizard" style="width:100%;" OnClick="openCustomWizard_Click">Plan Your Tour</asp:LinkButton></div>

                    <%--<div class="col-md-3"><button class="btn btn-primary chat" id="chat_now" style="width:100%;">Chat Now</button></div>
                    <div class="col-md-3"></div>
                </div>--%>
            </div>
            <div id="second">
                <%--<uc1:ChatControl runat="server" ID="ChatControl" />--%>
            </div>
        </div>
    </div>
    </div>