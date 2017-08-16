<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuizView.ascx.cs" Inherits="Components_QuizBank_User_QuizView" ViewStateMode="Enabled" %>
<%@ Register Src="~/Components/Timer/Timer.ascx" TagPrefix="uc1" TagName="Timer" %>

<script src="<%# Server.MapPath("~/") %>/Components/QuizBank/Content/js/jquery.countdown.js"></script>

<asp:HiddenField ID="TotalTime" runat="server" />
<div class="col-md-12">
    <asp:TextBox ID="hidden_quizid" data-class="QuizID" Style="display:none;" runat="server"></asp:TextBox>
    <div class="col-md-2" style="float:right; margin-top:30px;">
        <div class="col-md-12" style="padding:0";>
        <h5 style="text-align:center;">Time Remaining</h5>
        <div id="remaining-time" style="text-align:center; font-size: 16px; font-weight:800;"></div>
            <uc1:Timer runat="server" ID="Timer" />
        </div>
    </div>
    <div class="col-md-10" style="padding:0;">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-7" style="float:right; margin-top:35px; text-align:center;">
       <h4>Quiz Start Time :
            <asp:Label ID="CurrentTime" runat="server"></asp:Label></h4> 
    </div>
    <div class="col-md-5" style="float:right; margin-top:20px; padding:15px; background-color:#e6e6e6;">
        <h3>
            <asp:Label ID="quiz_name" runat="server"></asp:Label></h3>
    </div>
            </div>
        </div><div class="row">
            <div class="col-md-12">
                <div class="col-md-12" style="padding:15px; margin-top:10px; margin-bottom:5px; background-color:#e6e6e6;">
                    <h4><asp:Label ID="current" runat="server"></asp:Label>
                        <asp:Label ID="total" runat="server"></asp:Label></h4>
                </div>
            </div>

              </div>
          </div>
    <asp:Button ID="hidden_timeup" OnClick="hidden_timeup_Click" runat="server" Text="Button" Style="display: none;" />
</div>
<asp:PlaceHolder ID="RenderQuiz" runat="server"></asp:PlaceHolder>

        <div class="col-md-12" style="height:100px;">
            <div class="col-md-3" style="padding:0;">
                <asp:Button ID="Previous" Visible="false" CssClass="btn btn-success" Width="100%" runat="server" Text="Previous" OnClick="Previous_Click" />
            </div>
            <div class="col-md-6"></div>
            <div class="col-md-3" style="padding:0;">
                <asp:Button ID="Next" CssClass="btn btn-success" Width="100%" runat="server" Text="Next" OnClick="Next_Click" />
            </div>
        </div>




