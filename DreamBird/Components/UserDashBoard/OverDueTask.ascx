<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OverDueTask.ascx.cs" Inherits="Components_UserDashBoard_OverDueTask" %>
<asp:Panel ID="detail_panel" runat="server">
<div class="col-md-12" style="padding:0;">
     <div class="panel panel-danger" style="border-radius: 0px;">
  <!-- Default panel contents -->
         <asp:Repeater ID="overdue_task" runat="server">

             <HeaderTemplate>
                
                  <div class="panel-heading" style="border-radius: 0px; background-color: #9e0000 !important;"><h4><span class="glyphicon glyphicon-warning-sign" style="margin-right: 15px;"></span>First Things First</h4>
                  <h6>Take a look at your overdue activities</h6></div>
                   
       </HeaderTemplate>
            
            <ItemTemplate>
                <div class="alert alert-danger" role="alert" style=" margin-bottom: 0px;">
                        <h5><strong>0 Days</strong> left for Attempting <%# Eval("displayName") %> in <%# Eval("DreamLayout.Dream.DreamName") %></h5>
                       <b><asp:LinkButton ID="menu_link" runat="server" OnClick="menu_link_Click" Text='<%# "Go to "+Eval("displayName") %>' CommandArgument='<%# Eval("id") %>' style="color: inherit;"></asp:LinkButton></b>
                </div>
                
            </ItemTemplate>

        </asp:Repeater>
   </div>
</div>
    </asp:Panel>