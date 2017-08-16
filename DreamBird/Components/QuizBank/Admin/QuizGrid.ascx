<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuizGrid.ascx.cs" Inherits="Components_QuizBank_Admin_QuizGrid" %>
<div class="col-md-12" style="padding:0">
    <asp:Button ID="Button1" runat="server" Text="Button" Style="display:none;" />
        <ajaxToolkit:ModalPopupExtender ID="popup_quiz_paremeters" TargetControlID="Button1" CancelControlID="close_quiz_paremeters" PopupControlID="panel_quiz_paremeters" runat="server"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="panel_quiz_paremeters" runat="server" Width="600px" Height="330px" BackColor="#e6e6e6" BorderColor="#464646" BorderStyle="Solid" BorderWidth="1px">
            <div class="col-md-12">
                <h4>Set Quiz Parameters</h4>
            </div>
            <div class="col-md-12">
                <div class="row" style="margin-bottom:10px;">
                    <div class="col-md-3">
                        <h5>Hint Options</h5>
                    </div>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddl_qopt" CssClass="form-control HintOpt" runat="server">
                            <asp:ListItem Text="Normal Grading" Value="Normal"></asp:ListItem>
                            <asp:ListItem Text="Negative Grading" Value="Negative"></asp:ListItem>
                            <asp:ListItem Text="Zero Grading" Value="Zero"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row" style="margin-bottom:10px;">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h5>Graded Quiz?
                                </h5>
                            </div>
                            <div class="col-md-6">
                                <asp:CheckBox ID="isGraded" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-3">
                                <h5>Quiz Marks
                                </h5>
                            </div>
                            <div class="col-md-9">
                                <asp:TextBox ID="TotalMarks" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:10px;">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h5>Time Based?</h5>
                            </div>
                            <div class="col-md-6">
                                <asp:CheckBox ID="isTimeBased" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-3">
                                <h5>Total Time (Seconds)</h5>
                            </div>
                            <div class="col-md-9">
                                <asp:TextBox ID="TotalTime" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom:10px;">
                    <div class="col-md-4">
                        <h5>Total Questions</h5>
                        <h4><asp:Label ID="no_of_questions" runat="server"></asp:Label></h4>
                    </div>
                    <div class="col-md-4">
                        <h5>Questions in Quiz</h5>
                        <asp:TextBox ID="visibleQuestions" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                         <h5>Questions per Page</h5>
                         <asp:TextBox ID="questionPerPage" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row" style="margin-bottom:10px;">
                    <div class="col-md-6">
                        <asp:Button ID="set_Quiz" CssClass="btn btn-primary" OnClick="set_Quiz_Click" runat="server" Text="Set Quiz" />
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="close_quiz_paremeters" CssClass="btn btn-default" runat="server" Text="Cancel" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    <asp:Repeater ID="rptr_quizGrid" OnItemDataBound="rptr_quizGrid_ItemDataBound" runat="server">
        <ItemTemplate>
            <div class="col-md-3" style="height:290px; margin-top:15px; margin-bottom:5px;">
                <div class="col-md-12" style="padding:0; background-color:#464646;">
                    <asp:Image ID="Image1" runat="server" Width="100%" ImageUrl='<%# Eval("MediaItem.Path500") %>' />
                    <h4 style="color:white; text-align:center;"><%# Eval("Name") %></h4>
                    <a href="#" onclick="window.open('<%# "../../../Components/QuizBank/Admin/ManageQuiz.aspx?QID="+Eval("id") %>', 'mywin','left=20,top=20,width=1300,height=600,toolbar=1,resizable=0');" class="btn btn-primary" style="width:100%;">Edit Quiz</a>
                    <asp:LinkButton ID="setQuiz" Visible="false" data-quizid='<%# Eval("id") %>' OnClick="setQuiz_Click" runat="server" CssClass="btn btn-danger" Width="100%">Select Quiz</asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>