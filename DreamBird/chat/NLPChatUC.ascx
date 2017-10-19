<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NLPChatUC.ascx.cs" Inherits="chat_NLPChatUC" %>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
       
         .nano {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;

        }
        
        .nano>.nano-content {
            position: absolute;
            overflow: scroll;
            overflow-x: hidden;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;

        }
        
        .pad-all {
            padding: 15px;

        }
        #bot_msg_Area {
            overflow-y: auto;

        }
	</style>
<link rel="stylesheet" href='<%= ResolveUrl("~/chat/contents/css/bootstrap.css") %>' />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.0.0/animate.min.css">
    <link rel="stylesheet" href='<%= ResolveUrl("~/chat/contents/css/liquid-slider.css") %>'>
    <link rel="stylesheet" href='<%= ResolveUrl("~/chat/contents/css/bootstrap-theme.css") %>'>
    <link rel="stylesheet" href='<%= ResolveUrl("~/chat/contents/css/style.css") %>' />
    <%--<script src="https://code.jquery.com/jquery-3.1.0.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Latest compiled and minified JavaScript -->
  
    <script src='<%= ResolveUrl("~/chat/contents/js/jquery.cycle.lite.js") %>'></script>
  <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
<script src='<%= ResolveUrl("~/chat/contents/js/jquery.tmpl.min.js") %>'></script>
    <script type="text/javascript">
        jQuery(document).ready(function($){
            $('#right').cycle({ 
                fx:      'scrollRight', 
                next:   '#chat_now',
                timeout:  0, 
                easing:  'easeInOutBack' 
            });
            $('#learn_more').click(function(e){
                e.preventDefault();
                window.location.href = "http://www.google.com";
            });
        });
        
    </script>
    <script id="pkgTemplate" type="text/x-jquery-tmpl">
                              <div class="col-md-12 slider_item banner" >
                        <div class="row">
                            <div class="col-md-12" style="padding:0;">
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/chat/contents/img/two-passports.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6>${nightsInMakkah + nightsInMadina} Nights</h6>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/chat/contents/img/kaba-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6>${nightsInMakkah} Nights</h6>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/chat/contents/img/madina-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6>${nightsInMadina} Nights</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                              <div class="row">
                            <div class="col-md-12" style="padding:0;">
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/chat/contents/img/jahaz.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding-right:0">
                                        <h6 style="overflow: hidden; white-space: nowrap;  text-overflow: ellipsis;">${airLineName}</h6>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/chat/contents/img/kaba-hotel-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding-right:0">
                                        <h6 style="overflow: hidden; white-space: nowrap;  text-overflow: ellipsis;">${hotelMakkah}</h6>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/chat/contents/img/madina-hotel-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding-right:0">
                                        <h6 style="overflow: hidden; white-space: nowrap;  text-overflow: ellipsis;">${hotelMadina}</h6>
                                    </div>
                                </div>
                            </div></div>
                        <div class="row">
                                <div class="col-md-12" style="padding:0; margin-top: 10px;">
                                    <div class="col-md-7">
                                        <h3>${minRange}-${maxRange} PKR</h3>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Button class="btn btn-primary" runat="server" id="button" CommandArgument='${id}' OnClick="BookNowClick" />
                                    </div>
                                </div>
                            </div>
                              </div>
                         </script>
    <script src='<%= ResolveUrl("~/chat/contents/js/bootstrap.js") %>'></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
   <%--<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>--%>
 <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"/>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" ><ContentTemplate>
<div class="container">
   <div class="col-md-7">
                        <div class="col-md-12" style="padding:0;">
                            <div class="chat_haji">
                                <div class="col-md-12" style="padding:0">
                                    <div class="chat_icons">
                                        <div class="col-md-4" style="border:none;">
                                            <div class="row">
                                                <div class="col-md-4" style="border:none;"></div> <!-- this column empty -->
                                                <div class="col-md-4">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/404-200.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="month_data"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/two-passports-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="duration"></span></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/kaba-icon-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="makkah_nights"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/madina-icon-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="madina_nights"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/kaba-hotel-icon-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="makkah_hotel"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/madina-hotel-icon-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="madina_hotel"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/jahaz-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="airLine"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding-top: 20px;">
                                                        <asp:UpdatePanel ID="refreshPanel" runat="server" ><ContentTemplate>
                                                        <asp:LinkButton ID="refresh" ClientIDMode="AutoID" runat="server" OnClick="RefreshButton_OnClick"  style="color:white;border:none;background-color:inherit" ><i class="fa fa-refresh" aria-hidden="true"></i></asp:LinkButton>
                                                        
                                                        </ContentTemplate></asp:UpdatePanel>
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="myrefresh"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2" style="border: none;"></div> <!-- this column empty -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="nano has-scrollbar" style="height:200px">
    				                <div class="nano-content pad-all" tabindex="0" style="right: -18px;">
                                    <div class="chat_box" id="bot_msg_Area">
                                        <div class="col-md-12">
                                            <div class="col-md-1" style="padding:5px; padding-top: 0;">
                                            <img src="/chat/contents/img/HajiSb.png" width="100%">
                                            </div>
                                            <div class="col-md-7 hajisb">
                                                <h6>Type any words… no digits, symbols or special letters!</h6>
                                            </div>
                                        </div>
                                    </div>
                        </div></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding:0;">
                            <div class="col-md-9" style="padding: 0">
                                <input type="text" class="form-control chat-input" name="message"  id="usermsg" placeholder="Enter your message here">
                            </div>
                            <div class="col-md-3" style="padding: 0">
                                <input  type="button" id="submitmsg"  name="Submit" value="Send" class="btn btn-primary btn-block"/>
                            </div>
                        </div>
                    </div>
    <%-- related ppkgs area --%>
    <div class="col-md-5">
                    <h4 style="color: white; text-align: center; margin-top: 0;">Recommended Packages</h4>
                    <div class="col-md-10" style="margin-right: auto; margin-left: auto; float: none; padding:0;"  id="recommended_packages">
                   
                     
                        </div></div>
</div>
</ContentTemplate></asp:UpdatePanel>
<%--<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
<script type="text/javascript">
    var data;
    var month="";
    var budget=0;
    var nights=0;
    function LoadScript() {
        data = jsondata;
        console.log(data)
        var x = $.grep(data, function (n, i) {
            return (n && i < 2);
        });
        $("#pkgTemplate").tmpl(x).appendTo("#recommended_packages");


          accesstoken = '<%=token%>';
           sessionID = '<%=sessionID%>';
        pythonServer = '<%=pythonServer%>';

        //enter key Functionality
        $('#usermsg').keypress(function (e) {
            console.log("i came here")
            var key = e.which;
            if (key == 13)  // the enter key code
            {
                console.log("now here me")
                $('input[name = Submit]').click();
                return false;
            }
        });


       $("#submitmsg").click(function(){
		
           accessPoint = pythonServer + "sendmsg";
           var user_text = $("#usermsg").val();
           if (!user_text) { window.alert("Enter Message"); return;}
           var user_textArr = user_text.split(/\n/);
           $.each(user_textArr, function(){
               //$("#user-chat-area").append(this);
               $("#bot_msg_Area").append('<div class="col-md-12" style="margin-top:5px"><div class="col-md-7 clientsb"><h6>'+this+'</h6></div>');
               console.log("i m here");
               $('#bot_msg_Area')[0].lastChild.scrollIntoView(false);
           });
           jdata = {'userMessage': $("#usermsg").val(),
               'token': accesstoken,
               'sessionID': sessionID
           };
           jdataString = JSON.stringify(jdata);
           console.log(jdataString);
		$.ajax({
		    type: "POST",
		    crossOrigin: true,
		    url: accessPoint,
			data: jdataString,
			dataType: "json",
			contentType: "application/json",
			success: function (data_output) {
			    $("#usermsg").text = "";
			    console.log(data_output[0]);
			    getMessageFunction();
			},
			error: function (data_output) {
			    console.log(data_output)
			    $("#usermsg").val('');
			    console.log($("#usermsg")[0].Value);
			    getMessageFunction();
		}
		
		});
       }); exp = "n";
       context_json = {};
        getMessageFunction=(function(){
           jdata = {
               'token': accesstoken,
               'sessionID': sessionID
           };
           jdataString = JSON.stringify(jdata);
           accessPoint = pythonServer + "getmsg";
           $.ajax({
               type: "POST",
               crossOrigin: true,
               url: accessPoint,
               data: jdataString,
               dataType: "json",
               contentType: "application/json",
               success: function (data_output) {
                   console.log(data_output)
                   jQuery.each(data_output, function () {
                       if (this.msg === undefined) {
                           context = this.context;
                           con = JSON.stringify(eval("(" + context + ")"));
                           context_json = JSON.parse(con)
                           if (context_json['get_month'] === undefined)
                           { console.log(context_json); }
                           else {
                               
                               month = context_json['get_month'];
                               console.log(month);
                               $("#month_data").html("");
                               $("#month_data").html(month);
                               exp = "n.getMonth == month";
                               
                           }
                           if (context_json['get_budget'] === undefined) { console.log(context_json) } else {
                               console.log("here i m");
                               budget = context_json['get_budget'];
                               exp += " && (n.minRange <= budget || n.maxRange <= budget)"
                           }
                       }
                       else{
                       msg=this.msg;
                       $('#data').text(msg)
                       $("#bot_msg_Area").append(' <div class="col-md-12"><div class="col-md-1" style="padding:5px; padding-top: 0;"><img src="/chat/contents/img/HajiSb.png" width="100%"></div><div class="col-md-7 hajisb" style="margin-top:5px"> <h6>' + msg + '</h6> </div> </div>');
                       
                   }
                   });
                   $("#recommended_packages").html("");
                   var y = $.grep(data, function (n, i) {
                       console.log(exp);
                       return (eval(exp));
                   });
                   //var table = $("#recommended_packages");
                   //table.html("");
                   $("#pkgTemplate").tmpl(y).appendTo("#recommended_packages");
                   //$('#bot_msg_Area').scrollTop($('#bot_msg_Area')[0].scrollHeight)

                   $('#bot_msg_Area')[0].lastChild.scrollIntoView(false);
               },
               error: function (data) { console.log('............................');console.log(data);}

           });

       });

       
     //  var interval = 1000 * 60 * 0.1; // where X is your every X minutes

        // setInterval(getMessageFunction, interval);
      
}
	
</script>