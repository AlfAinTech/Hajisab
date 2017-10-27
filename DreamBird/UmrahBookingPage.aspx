<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.master"  CodeFile="UmrahBookingPage.aspx.cs" Inherits="UmrahBookingPage" %>

<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/headerFooter/BookingFormHeader.ascx" TagPrefix="uc1" TagName="BookingFormHeader" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/BookingForm.ascx" TagPrefix="uc1" TagName="BookingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


  


        <asp:ScriptManager ID="ScriptManager2" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

        <div class="row">


            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>


            <div id="Div1" class="col-md-12" runat="server" style="background-color:#e6e6e6;">
                <div class="col-md-12" runat="server">
                    <uc1:Packageheader runat="server" ID="Packageheader1" />
                    <uc1:BookingFormHeader runat="server" ID="BookingFormHeader1" />

                    <uc1:BookingForm runat="server" ID="BookingForm" />
                </div>
                <div class="col-md-12" runat="server">
                    <uc1:PackageFooter runat="server" ID="PackageFooter1" />
                </div>

            </div>
            <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
        </div>

</asp:Content>

