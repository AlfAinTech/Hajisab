<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserToDoList.ascx.cs" Inherits="Components_LessonBank_Lesson_UserToDoList" %>
<div class="col-md-12">
    <h4>
        To Do List
    </h4>
    <h6>
        Today is <asp:Label ID="today" runat="server" ></asp:Label>
    </h6>
 
        <asp:Label ID="dreamName_lbl" runat="server" ></asp:Label>
        <asp:DataList ID="overdue_task" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="menu_link" runat="server" OnClick="menu_link_Click" Text='<%# Eval("displayName") %>' CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
            </ItemTemplate>

        </asp:DataList>
   
</div>