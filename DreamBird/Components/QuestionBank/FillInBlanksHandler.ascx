<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FillInBlanksHandler.ascx.cs" Inherits="Components_QuestionBank_Content_FillInBlanksHandler" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/QuestionBank/Content/js/myScripts.js"></script>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="col-md-12">
    <asp:HiddenField ID="QuestionIdentifier" ClientIDMode="Static" runat="server" />
    <h3>Question Text</h3>
    <div style="padding: 15px; display: none;" id="question_pan">
        <div class="col-md-12">
            <div class="col-md-11">
                <h4>
                    <asp:Label ID="QuestionText" ClientIDMode="Static" runat="server"></asp:Label></h4>
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
                            <button type="button" class="btn btn-primary" data-toggle="modal" style="float: right;" data-target="#FIBEditor" data-purpose="editFIBQuestionText" id="Edit_Question">
                                Advanced Edit
                            </button>
                        </div>
                    </div>
                </div>
                <h5>
                    <asp:Label ID="HintText" runat="server" ClientIDMode="Static" Text="This is my hint"></asp:Label></h5>

            </div>
            <div class="col-md-1">
                <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                    <button type="button" class="btn btn-primary" id="Edit_Question_ordinary">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </button>
                </div>
                <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px; display: none;">
                </div>
                <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                    <button class="btn btn-default" id="remove_question_fib">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </button>
                </div>
                <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                    <a class="btn btn-warning" role="button" data-toggle="modal" data-target="#FIBEditor" data-purpose="addExplanation" id="Add_Explanation">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                    </a>
                </div>
                <div class="col-md-12" style="padding: 0; margin-top: 5px; margin-bottom: 5px;">
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#FIBEditor" data-purpose="AddHint" id="Add_Hint">
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" id="addQuestion" data-target="#FIBEditor" data-purpose="AddNewFIBQuestion">
        Add Question Text
    </button>
    <div class="col-md-12" style="padding: 10px; border: 1px solid #e6e6e6;">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddl_cat" ClientIDMode="Static" runat="server" OnSelectedIndexChanged="ddl_cat_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddl_sub_cat" ClientIDMode="Static" OnSelectedIndexChanged="ddl_sub_cat_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <asp:DropDownList ID="ddl_btax" ClientIDMode="Static" OnSelectedIndexChanged="ddl_sub_cat_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <%--<div class="col-md-3">
                    <asp:Button ID="save_prop" CssClass="btn btn-primary" Width="100%" runat="server" Text="Save" OnClick="save_prop_Click" />
                </div>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <h3>Answer Text</h3>
    <div style="padding: 15px;" id="answer">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="col-md-9">
                    <asp:TextBox ID="AnswerText" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:Button ID="SaveFIBAnswer" runat="server" Text="Save Answer" CssClass="btn btn-default" OnClick="SaveFIBAnswer_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>


</div>
<div class="modal fade" id="FIBEditor" tabindex="-1" role="dialog" aria-labelledby="FIBEditorLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="FIBEditorLabel">Modal title</h4>
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
                <asp:Button ID="cmdSaveFIB" ClientIDMode="Static" runat="server" CssClass="btn btn-primary" Text="Save" />

            </div>
        </div>
    </div>
</div>
