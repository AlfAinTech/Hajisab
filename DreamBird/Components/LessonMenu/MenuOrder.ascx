<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuOrder.ascx.cs" Inherits="Components_LessonMenu_MenuOrder" %>


<link href="<%# Server.MapPath("~/") %>/Content/css/style.css" rel="stylesheet" />
<script>
    $(function () {
        SortableCode();
    });
    function SortableCode() {
        $(".sortable").sortable({
            placeholder: "ui-state-highlight",
            update: function (event, ui) {
                var ParentMenuID = ui.item.data("parentmenuid");
                var DataArray = new Array;
                var counter = 1;
                $('li[data-parentmenuid=' + ParentMenuID + ']').each(function () {
                    $(this).attr("data-appearence", counter);

                    var DataArrayObject = { ParentMenuID: ParentMenuID, ChildMenuID: $(this).data("id"), AppearenceOrder: counter }
                    DataArray.push(DataArrayObject);
                    counter++;
                });

                $.ajax({
                    type: "POST",
                    url: "../../Components/LessonMenu/MenuOrder.ashx",
                    data: JSON.stringify(DataArray),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        window.opener.reload();
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            },
        });
        $(".sortable").disableSelection();
    }
</script>
<ul class="sortable" style="padding-left: 10px;">
    
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <li role="presentation" data-id='<%# Eval("id") %>' data-parentmenuid='<%# Eval("parentMenu_id") %>' data-appearence='<%# Eval("AppOrder") %>' style="list-style: none;" id="ListItem_<%# Eval("id")%>">
                        <%-- <div class="col-md-12" style="padding: 0">
                    <div class="col-md-9" style="padding: 0;">--%>

                        <asp:LinkButton ID="LinkButton1" CssClass="list-group-item" CausesValidation="false" CommandName='<%# Eval("id") %>' OnClick="LinkButton1_Click" Width="58%" runat="server"><%# Eval("displayName") %></asp:LinkButton>

                        <%-- </div>
                    <div class="col-md-3" style="padding: 0;">--%>
                        <a ID="HyperLink1" runat="server" class="btn btn-primary" data-toggle="collapse" data-target=".navbar-ex1-collapse" role="tab">
                        <span class="nav-header-primary"> <span class="glyphicon glyphicon-sort" aria-hidden="true"></span></span>
                        </a>

                        <asp:LinkButton ID="LinkButton3" CssClass="btn btn-success" CausesValidation="false" data-menuid='<%# Eval("id") %>' CommandName='<%# Eval("id") %>' OnClick="LinkButton3_Click" runat="server">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger" CausesValidation="false" CommandArgument='<%# Eval("id") + "," + Eval("DreamLayoutID") %>' OnClick="delete_menu_Click" runat="server">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </asp:LinkButton>


                        <%--</div>
                </div>--%>
                        <div class="collapse" id="parent_menu_<%# Eval("id")%>">
                            <div style="padding-left: 20px; background-color: #e6e6e6;">
                                <%--<ul class=" nav-secondary nav-list collapse" style="padding-left: 20px;" id="parent_menu_<%# Eval("id")%>">--%>
                                <ul class="nav nav-tabs nav-stacked sortable2">
                                    <asp:PlaceHolder ID="placeHolderContainer" runat="server"></asp:PlaceHolder>
                                </ul>
                                <%--</ul>--%>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:HyperLink ID="hplink2" CssClass="list-group-item" runat="server" role="button" data-toggle="collapse" aria-expanded="false"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></asp:HyperLink>
                    <div class="collapse" id="<%# ParentMenuID %>">
                        <div class="well" style="height: 70px;">
                            <div class="col-md-12" style="padding: 0;">
                                <div class="col-md-9" style="padding: 0;">
                                    <asp:TextBox ID="menu_name" data-parentmenuid='<%# ParentMenuID %>' data-parentlayoutid='<%# parentLayoutID %>' CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-primary addChild" data-parentmenuid='<%# ParentMenuID %>'>
                                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
       
</ul>

