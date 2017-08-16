<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SharedTextBankList.ascx.cs" Inherits="Components_TextBank_SharedTextBankList" %>
<script>
    jQuery(document).ready(function ($) {
        $(document).on('input', '#search_textBanks', function (e) {
            var Text = $(this).val();
            Text = Text.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });
            if (Text != "") {
                $('.list-group').find("a:not(:contains('" + Text + "'))").css("display", "none");
                $('.list-group').find("a:contains('" + Text + "')").css("display", "block");
            }
            else {
                $('.list-group').children().each(function () {
                    $(this).css("display", "block");
                });
            }
        });
    });
</script>
<div class="col-md-12">
    <input type="text" class="form-control" id="search_textBanks" placeholder="Search Text Banks" />
</div>
<div class="col-md-12">
<asp:Repeater ID="SharedText_list" runat="server" EnableTheming="True" >
    <HeaderTemplate>
        <div class="list-group">
    </HeaderTemplate>
    
    <ItemTemplate>
        <asp:LinkButton ID="TextName" Text='<%# Eval("TextName") %>' data-id='<%# Eval("id") %>' CssClass="list-group-item" CommandArgument='<%# Eval("id")%>' OnClick="text_btn_Click" CausesValidation="false" runat="server"></asp:LinkButton>
    </ItemTemplate>
        
    <FooterTemplate>
       </div>

    </FooterTemplate>
</asp:Repeater>
    </div>