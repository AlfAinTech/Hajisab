<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonDashBoard.ascx.cs" Inherits="Components_LessonBank_LessonDashBoard_LessonDashBoard" %>



<div class="col-md-12" style="padding: 0">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

        <asp:Repeater ID="LessonCards" runat="server" OnItemDataBound="Repeater_ItemDataBound">
            <ItemTemplate>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id='<%# "heading"+Eval("id")%>'>
                        <div class="warning" style="display: inline; font-size: 24px; float: right;" runat="server" visible='<%# (Eval("OverdueTask").Equals(true) && Eval("completedTask").Equals(false))  %>'>
                            <a href="#" data-toggle="tooltip" title="Overdue" style="display: inline">
                                <p style="display: inline; margin-bottom: 0px;"><span class="glyphicon glyphicon-warning-sign" style="color: #f0ad4e;"></span></p>
                            </a>
                        </div>
                        <div class="ok" style="display: inline; font-size: 24px; float: right;" runat="server" visible='<%# Eval("completedTask")  %>'>
                            <a href="#" data-toggle="tooltip" title="Completed" style="display: inline">
                                <p style="display: inline; margin-bottom: 0px;"><span class="glyphicon glyphicon-ok" style="color: #4db53c;"></span></p>
                            </a>
                        </div>
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="<%# "#collapse"+Eval("id")%>" aria-expanded="true" aria-controls='<%#"collapse"+Eval("id")%>'>
                                <%# Eval("displayName")%>
                            </a>
                        </h4>
                    </div>
                    <div id='<%# "collapse"+Eval("id")%>' class="panel-collapse collapse in" role="tabpanel" aria-labelledby='<%# "heading"+Eval("id")%>'>
                        <div class="panel-body">
                            <h4><%# Eval("displayName")%></h4>
                            <div class="col-md-5">

                                <div class="col-md-6">
                                    <div class="col-md-12" style="padding: 15px; padding-top: 25px;">
                                        <div class="c100 p<%# Eval("video_progress").ToString()!="-1"?Eval("video_progress"):"None" %> small green" style="margin-left: auto; margin-right: auto; float: none;">
                                            <span><%# Eval("video_progress").ToString()!="-1"?Eval("video_progress")+"%":"None"%></span>
                                            <div class="slice">
                                                <div class="bar"></div>
                                                <div class="fill"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <h6 style="text-align: center;">Videos:</h6>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-12" style="padding: 15px; padding-top: 25px;">
                                        <div class="c100 p<%#  Eval("reading_progress").ToString()!="-1"?Eval("reading_progress"):"None"%> small green" style="margin-left: auto; margin-right: auto; float: none;">
                                            <span><%# Eval("reading_progress").ToString()!="-1"?Eval("reading_progress")+"%":"None" %></span>
                                            <div class="slice">
                                                <div class="bar"></div>
                                                <div class="fill"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <h6 style="text-align: center;">Reading: </h6>
                                </div>

                            </div>
                            <div class="col-md-7">
                                <div class="col-md-6">
                                    <div class="col-md-12" style="padding: 15px; padding-top: 25px;">
                                        <div class="c100 p<%#  Eval("quiz_grade").ToString()!="-1"?Eval("quiz_grade"):"None"%> small green" style="margin-left: auto; margin-right: auto; float: none;">
                                            <span><%# Eval("quiz_grade").ToString()!="-1"?Eval("quiz_grade")+"%":"None" %></span>
                                            <div class="slice">
                                                <div class="bar"></div>
                                                <div class="fill"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <h6 style="text-align: center;">Quiz </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                <%-- Label used for showing Error Message --%>
                <asp:Label ID="lblDefaultMessage" runat="server" Text="Sorry, no item is there to show." Visible="false">
                </asp:Label>
            </FooterTemplate>
        </asp:Repeater>

    </div>
</div>
<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
