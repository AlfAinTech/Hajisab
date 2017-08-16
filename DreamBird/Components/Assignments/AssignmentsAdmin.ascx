<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AssignmentsAdmin.ascx.cs" Inherits="Components_Assignments_AssignmentsAdmin" %>
<%@ Register Src="~/Components/Assignments/FilterAssignments.ascx" TagPrefix="uc1" TagName="FilterAssignments" %>
<%@ Register Src="~/Components/Assignments/AssignmentGrid.ascx" TagPrefix="uc1" TagName="AssignmentGrid" %>


<div class="col-md-12" style="padding: 0; color: white;">
    <div class="col-md-3" id="side-nav">
        <uc1:FilterAssignments runat="server" ID="FilterAssignments" OnAssignmentSearched="FilterAssignments_AssignmentSearched" />
    </div>
    <div class="col-md-9" style="background-color: #e6e6e6; height: 500px;">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3" style="padding:15px; float:right;" id="add_assignment" runat="server">
                    <a href="#" onclick="window.open('../../../Components/Assignments/ManageAssignment.aspx', 'mywin','left=20,top=20,width=1300,height=600,toolbar=1,resizable=0');" class="btn btn-success" style="width: 100%;">Add New Assignment</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <uc1:AssignmentGrid runat="server" ID="AssignmentGrid" mode="view" />
            </div>
        </div>
    </div>
</div>
