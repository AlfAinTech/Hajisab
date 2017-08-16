<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuestionResult.ascx.cs" Inherits="Components_QuestionBank_User_QuestionResult" %>
<div class="col-md-12">
    <div class="row">
       <table>
           <tr>
               <th>Correct Answer</th>
               <th>Given Answer</th>
               <th>Duration of Response</th>
               <th>Awarded Marks</th>
           </tr>
           <tr>
               <td>
                   <asp:Label ID="CorrectAnswer" runat="server"></asp:Label>
               </td>
               <td>
                   <asp:Label ID="GivenAnswer" runat="server"></asp:Label>
               </td>
               <td>
                   <asp:Label ID="ResponseDuration" runat="server"></asp:Label>
               </td>
               <td>
                   <asp:Label ID="AwardedMarks" runat="server"></asp:Label>
               </td>
           </tr>
       </table>
    </div>
</div>