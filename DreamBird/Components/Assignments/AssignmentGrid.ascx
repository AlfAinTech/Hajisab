<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AssignmentGrid.ascx.cs" Inherits="Components_Assignments_AssignmentGrid" %>
<div class="col-md-12">
    <asp:Repeater ID="rptr_assignmentGrid" OnItemDataBound="rptr_assignmentGrid_ItemDataBound" runat="server">
        <ItemTemplate>
            <div class="col-md-3" style="margin-top: 10px; margin-bottom: 5px; color: white; padding:15px; background-color:#464646;">
                <div class="row">
                    <div class="col-md-12">
                        <h4 style="text-align:center;">
                            <asp:Label ID="assignment_name" runat="server" Text='<%# Eval("Name") %>'></asp:Label></h4>
                            <a href="#" onclick="window.open('<%# "../../../Components/Assignments/ManageAssignment.aspx?IID="+Eval("id") %>', 'mywin','left=20,top=20,width=1300,height=600,toolbar=1,resizable=0');" class="btn btn-primary" style="width: 100%;">Edit Assignment Detail</a>
                        <asp:Button ID="select_assignment" Visible="false" CssClass="btn btn-default" data-assignmentid='<%# Eval("id") %>' OnClick="select_assignment_Click" runat="server" Text="Select" Width="100%" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
