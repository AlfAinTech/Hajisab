<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamView.ascx.cs" Inherits="Components_Dreams_DreamView" %>
<%@ Register Src="~/Components/Dreams/DreamSort.ascx" TagPrefix="uc1" TagName="DreamSort" %>
<%@ Register Src="~/Components/Dreams/DreamSearch.ascx" TagPrefix="uc1" TagName="DreamSearch" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<div>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
        <uc1:DreamSort runat="server" ID="DreamSort" OndreamSort="dreamSorted_DreamSort" Visible="false" />

</div>
<div class="content_wrapper">
    <div class="container" id="content_wrap">
        <h2>Most Popular Dreams</h2>
        <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="DreamView_UpdatePanel" runat="server">
            <ProgressTemplate>
                <div class="modal" style="display: block">
                    <div class="center">
                        <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:DataList ID="Dream_data_list" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" OnItemDataBound="set_enableEditing" Width="100%" RepeatLayout="Flow">
            <ItemStyle />

            <ItemTemplate>

                <div class="col-md-3">
                    <div class="content_item container_featured">
                        <asp:Panel ID="Panel1" runat="server">
                            <div class="cont_img_wrap">
                                <div class="col-md-9" style="margin-right: auto; padding-left: 5; padding-right: 5px; margin-left: auto; float: none">
                                    <%--<img src="img/gmat.jpg" />--%>
                                    <asp:Image ID="dream_img" runat="server" ImageUrl='<%# Eval("MediaItem.Path500") %>' Width="100%" Visible='<%# Bind("IsMediaItemImage") %>' />
                                    <br />
                                    <video id="dream_video" runat="server" onclick="playvideo(this)" visible='<%# Bind("IsMediaItemVideo") %>' width="100%">
                                        <source type="video/mp4" src='<%# Eval("MediaItem.Path480") %>'>
                                    </video>
                                </div>
                            </div>
                            <div class="cont_label_featured"></div>
                            <div class="content_pan">
                                <div class="col-md-12" style="padding: 0; min-height: 135px;">

                                    <asp:LinkButton ID="dreamName" runat="server" Visible="true" Width="32%" Font-Bold="true" CommandArgument='<%# Eval("id") %>' CausesValidation="False" OnClick="dream_description_Click"><h3><%# Eval("DreamName") %></h3></asp:LinkButton>
                                    <h5 style="text-align: justify;">
                                        <asp:Label ID="dream_description" runat="server" Text='<%# Eval("Description").ToString().PadRight(100).Substring(0,100).TrimEnd()+"..." %>'></asp:Label></h5>
                                </div>
                                <div class="content_social_detail">
                                    <div class="soc_det likes" style="text-align: left;">
                                        <asp:Label ID="likes_count" runat="server" Text='<%# GetLikesCount(Eval("id").ToString()) %>'></asp:Label>
                                        Likes
                                    </div>
                                    <div class="soc_det comments" style="text-align: right;">
                                        <asp:Label ID="featured_dream" runat="server" Visible='<%# Eval("IsFeatured") %>' ForeColor="White" BackColor="Black"> Featured  </asp:Label>
                                    </div>
                                </div>
                                <div class="dream_footer">
                                    <div style="width: 16%; float: left; margin-right: 38%;">
                                        <%--<img src="img/like.png" width="100%">--%>
                                        <asp:LinkButton ID="like_link" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="like_link_Click" Style='<%# getLikeButtonStyle(Eval("isNotLikedByLoginUser"))%>'> <i class="material-icons" >favorite</i></asp:LinkButton>

                                    </div>
                                    <div style="width: 46%; float: left;">
                                        <asp:LinkButton class="btn btn-default" ID="dream_detail" runat="server" Width="100%" CommandArgument='<%# Eval("id") %>' CausesValidation="False" OnClick="dream_description_Click">View Detail</asp:LinkButton>
                                        <%--<button class="btn btn-default">View Detail</button>--%>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div style="width: 30%; text-align: right">

                        <asp:LinkButton ID="edit_link" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="edit_link_Click" Visible="False" Style="text-align: right">Edit</asp:LinkButton>
                        <br />
                    </div>
                </div>

            </ItemTemplate>


        </asp:DataList>


        <asp:UpdatePanel ID="DreamView_UpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="load_more">
                    <asp:LinkButton ID="load_more" runat="server" Visible="False" OnClick="load_more_Click"><h3>Load More</h3></asp:LinkButton>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<%--<div >
<div  style="text-align:center; width: 1219px; height: 25px;">
<asp:Button ID="load_more" runat="server" Text="Load More" Visible="False" OnClick="load_more_Click" width="15%" Height="26px"/></div></div>--%>

<style type="text/css">
    .modalBackground {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }

    .modalPopup {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        width: 450px;
        height: 600px;
    }
</style>
<script>
    function playvideo(thisobj) {
        thisobj.paused ? thisobj.play() : thisobj.pause();
        if (thisobj.hasAttribute("controls")) {
            thisobj.removeAttribute("controls")
        } else {
            thisobj.setAttribute("controls", "controls")
        }
    }
</script>
<script>
    function setLikeStyle(clientID) {

        colorrgb = $(clientID).css('color');
        colorName = rgb2hex(colorrgb);
        if (colorName == '#ff0000') {
            $(clientID).css('color', 'gray');
        } else {
            $(clientID).css('color', 'red');
        }

    }

    function rgb2hex(orig) {
        var rgb = orig.replace(/\s/g, '').match(/^rgba?\((\d+),(\d+),(\d+)/i);
        return (rgb && rgb.length === 4) ? "#" +
         ("0" + parseInt(rgb[1], 10).toString(16)).slice(-2) +
         ("0" + parseInt(rgb[2], 10).toString(16)).slice(-2) +
         ("0" + parseInt(rgb[3], 10).toString(16)).slice(-2) : orig;
    }
</script>

<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>

<!-- ModalPopupExtender -->
<%--<cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnClose"
    CancelControlID="btnClose" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style = "display:none" >
     <iframe id="frameeditexpanse" src="/Account/LoginSetting.aspx" width="450px" height="600px">
    </iframe>
    <asp:Button ID="btnClose" runat="server" Text="Close" />
</asp:Panel>--%>
<!-- ModalPopupExtender -->
