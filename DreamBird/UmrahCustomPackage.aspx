<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.master" CodeFile="UmrahCustomPackage.aspx.cs" Inherits="UmrahCustomPackage" %>

<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/headerFooter/DetailHeader.ascx" TagPrefix="uc1" TagName="DetailHeader" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/CustomPackageAdd.ascx" TagPrefix="uc1" TagName="CustomPackageAdd" %>


  <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">













   

      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
       
        <div class="row">
          
            
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>
    
          
                        <div id="body_content" class="col-md-12" runat="server">
                            <div  class="col-md-12" runat="server">
                                <uc1:Packageheader runat="server" ID="Packageheader" />
                                <uc1:DetailHeader runat="server" ID="DetailHeader" />

                               
                        </div>
                        <div  class="content_wrap" runat="server">
                             <div  class="container" runat="server">
                                 <uc1:CustomPackageAdd runat="server" ID="CustomPackageAdd" />
                            </div>
                            </div>
                            <div  class="col-md-12" runat="server">
                                 <uc1:PackageFooter runat="server" ID="PackageFooter" />
                            </div>
                        
    </div>
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>

        </div> 
       
     
  </asp:Content>