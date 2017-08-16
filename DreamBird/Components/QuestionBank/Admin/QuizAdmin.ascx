<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuizAdmin.ascx.cs" Inherits="Components_QuestionBank_Admin_QuizAdmin" %>

<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/QuestionBank/Content/js/myScripts.js"></script>
<script>

    jQuery(document).ready(function ($) {
        $(document).on('change', '.HintOpt', function () {
            if ($(this).val() == "Zero") {
                $('#hint_marks').val("0");
            }
        });
    });
    //window.onunload = refreshParent;
    //function refreshParent() {
    //var retVal = confirm("Are you sure ?");
    //if (retVal == true) {
    //    window.opener.location.reload();
    //}
    //else
    //    return false;

    //}
</script>
<script>

    //jQuery(document).ready(function ($) {
    //    $(document).on('change', '.lowlevel', function () {
    //        var lowtypeid = $(this).data("ltypeid");
    //        var lowvalue = $(this).val();
    //        var highvalue = $('input[data-htypeid=' + lowtypeid + ']').val();
    //        if(lowvalue > highvalue)
    //        {
    //            alert("Value cannot be higher");
    //            $(this).val(highvalue);
    //        }
    //    });
    //    $(document).on('change', '.highlevel', function () {
    //        var hightypeid = $(this).data("htypeid");
    //        var highvalue = $(this).val();
    //        var lowvalue = $('input[data-ltypeid=' + hightypeid + ']').val();
    //        if (lowvalue > highvalue) {
    //            alert("Value cannot be lower");
    //            $(this).val(lowvalue);
    //        }
    //    });
    //});
</script>
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#manualSelection" aria-controls="manualSelection" role="tab" data-toggle="tab">Manual Selection</a></li>
    <li role="presentation"><a href="#autoSelection" aria-controls="autoSelection" role="tab" data-toggle="tab">Automatic Selection</a></li>
</ul>
<div class="tab-content" style="padding-top: 0px; padding-bottom: 20px; background-color: #e6e6e6; height: inherit; overflow-y: scroll;">
    <div role="tabpanel" class="tab-pane active" id="manualSelection">
        <div class="col-md-12" style="padding: 0;">
            <div class="col-md-3" id="side-nav" style="overflow-y: auto; height: 600px;">
                <h4 style="color: dodgerblue; text-align: center;">Select Question Type</h4>
                <asp:Repeater ID="rptr_qtype" runat="server">
                    <HeaderTemplate>
                        <div class="list-group">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="question_type" CssClass="list-group-item" OnClick="question_type_Click" data-typeid='<%# Eval("id") %>' runat="server"><%# Eval("QTypeName") %></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-9" style="background-color: #e6e6e6; height: 600px; overflow-y: auto;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="popup_dummy" Style="display:none;" runat="server" Text="Button" />
                        <ajaxToolkit:ModalPopupExtender ID="popup_QuestionOptions" TargetControlID="popup_dummy" PopupControlID="popup_panel_QuestionOptions" runat="server"></ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="popup_panel_QuestionOptions" runat="server" Width="400px" Height="320px" BackColor="#e6e6e6" BorderWidth="2px" BorderColor="#464646" BorderStyle="Solid">
                            <div class="col-md-12">
                                <asp:HiddenField ID="QuestionIDHidden" runat="server" />
                                <h4 style="text-align: center;">Select User Options for Selected Question</h4>
                            </div>
                            <div class="col-md-12">
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-md-3">
                                        <h6>Select Hint Option</h6>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddl_qopt" CssClass="form-control HintOpt" runat="server">
                                            <asp:ListItem Text="Normal Grading" Value="Normal"></asp:ListItem>
                                            <asp:ListItem Text="Zero Grading" Value="Zero"></asp:ListItem>
                                            <asp:ListItem Text="Negative Grading" Value="Negative"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-md-3">
                                        <h6>Hint Marks</h6>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="hint_marks" ClientIDMode="Static" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-md-3">
                                        <h6>Show Answer to User</h6>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:CheckBox ID="show_question_answer" CssClass="form-control" runat="server" />
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-md-3">
                                        <h6>Question Duration</h6>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="duration" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="hide_button" CssClass="btn btn-default" runat="server" Text="Cancel" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button ID="select_question" OnClick="select_question_Click" CssClass="btn btn-primary" runat="server" Text="Select" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="row">
                            <div class="col-md-12" style="background-color: #464646; padding: 15px; color: white;">
                                <div class="col-md-4">
                                    <h4>Select Category</h4>
                                    <asp:DropDownList ID="ddl_cat" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_cat_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <h4>Select Sub Category</h4>
                                    <asp:DropDownList ID="ddl_sub_cat" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_sub_cat_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <h4>Select Level</h4>
                                    <asp:DropDownList ID="ddl_level" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_level_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <asp:Repeater ID="questionGrid" OnItemDataBound="questionGrid_ItemDataBound" runat="server">
                            <HeaderTemplate>
                                <div class="col-md-12">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="col-md-12" style="margin-top: 15px; margin-bottom: 15px;">
                                    <div class="col-md-9" style="height: 30px; background-color: #e6e6e6;">
                                        <h4 style="margin-top: 10px; margin-bottom: 5px;"><%# Eval("QuestionText").ToString().PadRight(100).Substring(0,100).TrimEnd()+"..." %></h4>
                                    </div>
                                    <div class="col-md-1">
                                        <asp:CheckBox ID="show_answer" CssClass="form-control" title="Show Answer" runat="server" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:CheckBox ID="SelectedQuestion" data-qid='<%# Eval("id") %>' CssClass="form-control" runat="server" Visible="false" />
                                        <asp:Button ID="SelectQuestion" data-qid='<%# Eval("id") %>' ValidationGroup='<%# Eval("id") %>' runat="server" Text="Select" CssClass="btn btn-default" Visible="false" Style="width: 100%" OnClick="SelectQuestion_Click" />
                                    </div>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                        <div class="col-md-3" style="float: right;">
                            <asp:Button ID="SelectMultiQuestions" Style="width: 100%" OnClick="SelectMultiQuestions_Click" runat="server" CssClass="btn btn-danger" Visible='<%# AllowMulti && ((Repeater)Container.NamingContainer).Items.Count != 0 %>' Text="Select Questions" />
                        </div>
                                <h3 style="text-align: center; color: gray;">
                                    <asp:Label ID="lblEmptyData" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>' Text="No questions found for given selection criteria" /></h3>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="autoSelection">
        <div class="col-md-12" style="padding: 0; height: 600px; background-color: #e6e6e6;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="rptr_autoselection" runat="server" OnItemDataBound="rptr_autoselection_ItemDataBound">
                        <HeaderTemplate>
                            <div class="col-md-12" style="margin-top: 10px; margin-bottom: 5px; background-color: #278ac1; color: white;">
                                <div class="col-md-2" style="padding-top: 10px; padding-bottom: 5px;">
                                    <h4>Question Type
                                    </h4>
                                </div>
                                <div class="col-md-8" style="padding: 0; padding-top: 10px; padding-bottom: 5px;">
                                    <div class="col-md-3">
                                        <h4>Category
                                        </h4>
                                    </div>
                                    <div class="col-md-3">
                                        <h4>Sub Category
                                        </h4>
                                    </div>
                                    <div class="col-md-3">
                                        <h4>Maximum Level
                                        </h4>
                                    </div>
                                    <div class="col-md-3">
                                        <h4>Minimum Level
                                        </h4>
                                    </div>
                                </div>
                                <div class="col-md-1" style="padding-top: 10px; padding-bottom: 5px;">
                                    <h4>Total Questions
                                    </h4>
                                </div>
                                <div class="col-md-1" style="padding-top: 10px; padding-bottom: 5px;">
                                    <h4>Selected Questions
                                    </h4>
                                </div>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="col-md-12" style="margin-top: 10px; margin-bottom: 5px; background-color: white;">
                                <div class="col-md-2">
                                    <h4>
                                        <asp:Label ID="question_type_name" runat="server" data-qtypeid='<%# Eval("id") %>' Text='<%# Eval("QTypeName") %>'></asp:Label>
                                    </h4>
                                </div>
                                <div class="col-md-8" style="padding: 0; padding-top: 10px; padding-bottom: 5px;">
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddl_cat_auto" OnSelectedIndexChanged="ddl_cat_auto_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddl_sub_cat_auto" CssClass="form-control" OnSelectedIndexChanged="ddl_sub_cat_auto_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="max_level" CssClass="form-control" runat="server" OnSelectedIndexChanged="max_level_TextChanged"></asp:DropDownList>
                                        <%--<asp:TextBox ID="max_level" TextMode="Number" OnTextChanged="max_level_TextChanged" AutoPostBack="true" CssClass="form-control highlevel" data-htypeid='<%# Eval("id") %>' runat="server"></asp:TextBox>--%>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="min_level" CssClass="form-control" runat="server"></asp:DropDownList>
                                        <%--<asp:TextBox ID="min_level" TextMode="Number" CssClass="form-control lowlevel" data-ltypeid='<%# Eval("id") %>' runat="server"></asp:TextBox>--%>
                                    </div>
                                </div>
                                <div class="col-md-1" style="padding-top: 10px; padding-bottom: 5px;">
                                    <asp:TextBox ID="TotalQuestions" ReadOnly="true" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="col-md-1" style="padding-top: 10px; padding-bottom: 5px;">
                                    <asp:TextBox ID="no_of_questions" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                </div>

                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div class="col-md-3" style="float: right; padding: 15px;">
                                <asp:Button ID="finalizeSelection" OnClick="finalizeSelection_Click" runat="server" Text="Finalize Selection" CssClass="btn btn-danger" Style="width: 100%" />
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>
</div>

