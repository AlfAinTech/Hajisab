<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultipleFIBHandler.ascx.cs" Inherits="Components_QuestionBank_MultipleFIBHandler" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/QuestionBank/Content/js/myScripts.js"></script>
<input type="hidden" id="current_id" value="new" />
<input type="hidden" id="current_id_blank" value="new" />
<asp:HiddenField ID="QuestionIdentifier" ClientIDMode="Static" Value="0" runat="server" />
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="col-md-12" style="padding: 15px;">
    <div class="col-md-6" style="padding: 10px; border: 1px solid #e6e6e6;">
        <div class="col-md-6">
            <button class="btn btn-primary" type="button" style="width: 100%" data-toggle="collapse" data-target="#text" aria-expanded="false" aria-controls="text">
                Add Text
            </button>
        </div>
        <div class="col-md-12">
            <div class="collapse" id="text">
                <div class="well" style="display: -webkit-box;">
                    <div class="col-md-12" style="padding: 0;">
                        <div class="col-md-10">
                            <input type="text" id="fib_text" class="form-control"/>
                            <asp:HiddenField ID="QuestionType" ClientIDMode="Static" runat="server" />
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary" id="add_text">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6" style="padding: 10px; border: 1px solid #e6e6e6;">
        <div class="col-md-6">
            <button class="btn btn-default" type="button" style="width: 100%" data-toggle="collapse" data-target="#blank" aria-expanded="false" aria-controls="blank">
                Add Blank
            </button>
        </div>
        <div class="col-md-12">
            <div class="collapse" id="blank">
                <div class="well" style="display: -webkit-box;">
                    <div class="col-md-12" style="padding: 0;">
                        <div class="col-md-7">
                            <input type="text" id="text_blank" placeholder="Text for Blank" class="form-control"/>
                        </div>
                        <div class="col-md-3" style="padding: 0;">
                            <input type="number" class="form-control" min="1" max="100" id="weightate_blank" placeholder="Weightage" />
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary" id="add_blank">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12" style="height:200px; padding: 10px; border: 1px solid #e6e6e6; overflow-y:auto;">
        <div id="mfib" runat="server" ClientIdMode="static">

        </div>
    </div>
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
                    <asp:DropDownList ID="ddl_btax" OnSelectedIndexChanged="ddl_sub_cat_SelectedIndexChanged" AutoPostBack="true" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <%--<div class="col-md-3">
                    <asp:Button ID="save_prop" CssClass="btn btn-primary" Width="100%" runat="server" Text="Save" OnClick="save_prop_Click" />
                </div>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-12" style="padding: 10px; border: 1px solid #e6e6e6;">
        <div class="col-md-3" style="float:right;">
            <button class="btn btn-success" id="save_mfib_question" style="width:100%;">Save Question</button>
        </div>
    </div>
</div>
