<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GroupQuestionsHandler.ascx.cs" Inherits="Components_QuestionBank_GroupQuestionsHandler" %>
<%@ Register Src="~/Components/TextBank/TextBankAdmin.ascx" TagPrefix="uc1" TagName="TextBankAdmin" %>
<%@ Register Src="~/Components/QuestionBank/Admin/QuizAdmin.ascx" TagPrefix="uc1" TagName="QuizAdmin" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div class="col-md-12">
    <asp:HiddenField ID="QuestionIdentifier" ClientIDMode="Static" runat="server" />
    <h3>Question Text</h3>
    <div style="padding: 15px; display: none;" id="question_pan">
        <div class="col-md-12">
            <div class="col-md-12" style="padding: 15px; background-color: #e6e6e6;">
                <div class="col-md-1">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <button type="button" class="btn btn-primary" id="Edit_Question_ordinary">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <button class="btn btn-default" id="remove_question">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-11">
                    <h4>
                        <asp:Label ID="QuestionText" ClientIDMode="Static" runat="server"></asp:Label></h4>
                </div>
                <div class="col-md-12" style="padding: 0; display: none;" id="inline_edit">
                    <div class="col-md-12" style="padding: 0;">
                        <asp:TextBox ID="QuestionText1" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="float: right; padding: 0;">
                        <div class="col-md-1" style="float: right; padding: 0;">
                            <button type="button" class="btn btn-default" id="cancel_inline" style="float: right;">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="col-md-1" style="float: right; padding: 0;">
                            <button type="button" class="btn btn-primary" id="save_inline" style="float: right;">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="col-md-3" style="float: right; padding: 0;">
                            <button type="button" class="btn btn-primary" data-toggle="modal" style="float: right;" data-target="#GroupQuestionEditor" data-purpose="editQuestionText" id="Edit_Question">
                                Advanced Edit
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="padding: 15px; background-color: #d6d6d6;">
                <div class="col-md-1">
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#GroupQuestionEditor" data-purpose="AddHint" id="Add_Hint">
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    </button>
                </div>
                <div class="col-md-11">
                    <h5>
                        <asp:Label ID="HintText" runat="server" ClientIDMode="Static" Text="This is my hint"></asp:Label></h5>
                </div>
            </div>
            <div class="col-md-12" style="padding: 15px; background-color: #c6c6c6;">
                <div class="col-md-1">
                    <a class="btn btn-warning" role="button" data-toggle="modal" data-target="#GroupQuestionEditor" data-purpose="addExplanation" id="Add_Explanation">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                    </a>
                </div>
                <div class="col-md-11">
                    <h5>
                        <asp:Label ID="ExplanationText" ClientIDMode="Static" runat="server" Text="Explanation Text"></asp:Label>
                    </h5>
                </div>
            </div>
        </div>
    </div>

    <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" id="addQuestion" data-target="#GroupQuestionEditor" data-purpose="AddNewQuestion">
        Add Question Text
    </button>

    <div class="col-md-12" style="padding: 10px; border: 1px solid #e6e6e6;">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddl_cat" ClientIDMode="Static" runat="server" OnSelectedIndexChanged="ddl_cat_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddl_sub_cat" OnSelectedIndexChanged="ddl_sub_cat_SelectedIndexChanged" AutoPostBack="true" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <asp:DropDownList ID="ddl_btax" OnSelectedIndexChanged="ddl_btax_SelectedIndexChanged" AutoPostBack="true" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <%--<div class="col-md-3">
                                <asp:Button ID="save_prop" CssClass="btn btn-primary" Width="100%" runat="server" Text="Save" OnClick="save_prop_Click" />
                            </div>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<div class="col-md-12">
    <div class="row">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="rptr_selectedQuestionPool" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6">
                            <div class="col-md-12" style="background-color: #e6e6e6">
                                <div class="col-md-9">
                                    <h5><%# Eval("QuestionBank1.QuestionText") %></h5>
                                </div>
                                <div class="col-md-3">
                                    <asp:Button ID="Remove_group_Question" OnClick="Remove_group_Question_Click" data-groupid='<%# Eval("id") %>' data-pgroupid='<%# Eval("PrimaryQuestionID") %>' runat="server" CssClass="btn btn-danger" Text="X" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<div class="col-md-12" style="margin-top:10px; margin-bottom:5px;">
    <div class="col-md-3">
        <button class="btn btn-success" id="Select_group_Questions">Select Questions</button>
    </div>
</div>
<div class="col-md-12" id="QuestionGroupRepeater" style="display: none;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:QuizAdmin runat="server" OnQuestionsSelectedForGroup="QuizAdmin_QuestionsSelectedForGroup" ID="QuizAdmin" QuizMode="Question" AllowMulti="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<div class="modal fade" id="GroupQuestionEditor" tabindex="-1" role="dialog" aria-labelledby="GroupQuestionEditorLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="GroupQuestionEditorLabel">Add Group Question</h4>
            </div>
            <div class="modal-body">
                <div class="progress"></div>
                <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" />
                <asp:HiddenField ID="Hf1" ClientIDMode="Static" runat="server" />
                <asp:HiddenField ID="OptionIdentifier" ClientIDMode="Static" runat="server" />
                <asp:HiddenField ID="QuestionType" ClientIDMode="Static" runat="server" />
                <asp:HiddenField ID="HiddenEditor" ClientIDMode="Static" runat="server" />

                <span type="hidden" clientid="<%=txtEditor.ClientID%>" class="textEditor" style="padding: 0; margin: 0" value="blank"></span>
                <textarea name="txtEditor" id="txtEditor" runat="server" rows="10" cols="80">
                This is my textarea to be replaced Editor.
            </textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <asp:Button ID="cmdGQSave" ClientIDMode="Static" runat="server" CssClass="btn btn-primary" Text="Save" />
            </div>
        </div>
    </div>
</div>

