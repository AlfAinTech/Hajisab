<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.master" CodeFile="UmrahCustomBooking.aspx.cs" Inherits="UmrahCustomBooking" %>
<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/headerFooter/BookingFormHeader.ascx" TagPrefix="uc1" TagName="BookingFormHeader" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/BookingForm.ascx" TagPrefix="uc1" TagName="BookingForm" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/CustomBookingUC.ascx" TagPrefix="uc1" TagName="CustomBookingUC" %>


   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


  


      <asp:ScriptManager ID="ScriptManager2" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
       
        <div class="row">
          
            
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>
    
          
                        <div id="Div1" class="col-md-12" runat="server">
                            <div  class="col-md-12" runat="server">
                                <uc1:Packageheader runat="server" ID="Packageheader1" />
                                <uc1:BookingFormHeader runat="server" ID="BookingFormHeader1" />

                                <uc1:CustomBookingUC runat="server" ID="CustomBookingUC" />
                        </div>
                            <div  class="col-md-12" runat="server">
                                 <uc1:PackageFooter runat="server" ID="PackageFooter1" />
                            </div>
                        
    </div>
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>

        </div> 
       </asp:Content>
       
     
          

   