<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuizResultSummary.ascx.cs" Inherits="Components_QuizBank_User_QuizResultSummary" %>
<div class="col-md-12">
    <h3>Quiz Summary</h3>
    <h5>Following is the Summary of the Attempted Quiz</h5>
    <h4>User Name : <%= HttpContext.Current.User.Identity.Name %></h4>
    <asp:Repeater ID="rptr_quizSummary" OnItemDataBound="rptr_quizSummary_ItemDataBound" runat="server">
        <HeaderTemplate>
            <table class="mGrid">
                <tr>
                    <th style="width: 4%;">Sr. No
                    </th>
                    <th style="width: 40%;">Question
                    </th>
                    <th style="width: 30%;">Actual Answer
                    </th>
                    <th style="width: 15%;">Given Answer
                    </th>
                    <th style="width: 11%;">Awarded Marks
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Container.ItemIndex + 1 %>
                </td>
                <td>
                    <%# Eval("QuestionBank.QuestionText") %>
                </td>
                <td>
                    <asp:Repeater ID="correct_options" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4" <%# (Convert.ToBoolean(Eval("isCorrect"))) ? "style='background-color:#e6e6e6;'" : "" %>>
                                <%# Eval("OptionText") %>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
                <td>
                    <%# Eval("UserReply") %>
                </td>
                <td>
                    <h4><%# Eval("AwardedMarks") %></h4>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</div>
