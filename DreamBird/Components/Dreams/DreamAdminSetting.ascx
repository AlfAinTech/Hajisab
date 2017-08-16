<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamAdminSetting.ascx.cs" Inherits="Components_Dreams_DreamAdminSetting" %>
<%@ Register Src="~/Components/Dreams/DreamView.ascx" TagPrefix="uc1" TagName="DreamView" %>
<%@ Register Src="~/Components/Dreams/DreamAddEdit.ascx" TagPrefix="uc1" TagName="DreamAddEdit" %>














<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <div class="row" style="text-align:left">
       
           <asp:LinkButton ID="addDream_btn" runat="server"  Text="Create Dream" CssClass="btn btn-primary" OnClick="addDream_btn_Click" />
             
    </div>
     <div class="row" style="text-align:left">
        <div class="col-md-12">
            <%--<uc1:DreamView runat="server" id="DreamView" EnableEditing="true" OndreamEdit="dreamEditClick_dreamEdit" />--%>
            <%--<uc1:DreamView runat="server" ID="DreamView" EnableEditing="true" OndreamEdit="dreamEditClick_dreamEdit" />--%>
            <%--<uc1:DreamView runat="server" id="DreamView"   EnableEditing="true"  OndreamEdit="dreamEditClick_dreamEdit" OndreamLiked="dreamLiked_dreamLiked"/>--%>
            <uc1:DreamView runat="server" ID="DreamView" EnableEditing="true"  OndreamEdit="dreamEditClick_dreamEdit"  OndreamLiked="dreamLiked_dreamLiked"/>
            <%--<uc1:DreamAddEdit runat="server" ID="DreamAddEdit"  OnDreamAdded="dreamAdd_dreamAdded" />--%>
            <%--<uc1:DreamAddEdit runat="server" id="DreamAddEdit"  OnDreamAdded="dreamAdd_dreamAdded" />--%>
            <uc1:DreamAddEdit runat="server" ID="DreamAddEdit"  OnDreamAdded="dreamAdd_dreamAdded" />
        </div>
    </div>
            
            
            
         
   
   

</ContentTemplate>

 </asp:UpdatePanel>
        
