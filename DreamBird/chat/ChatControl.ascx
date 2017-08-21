<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChatControl.ascx.cs" Inherits="chat_ChatControl" %>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"/>
<input type="submit" name="ctl11$BaseDreamControl1$ctl00$ChatControl$refresh" value="" id="ctl11_BaseDreamControl1_ctl00_ChatControl_refresh" class="fa fa-refresh" style="border:none;background-color:inherit">
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
        .userMessage
        {
            margin-right:5px;
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
                                       <h4 style="
    text-align: center;
    color: white;
">${minRange}-${maxRange} PKR</h4>
                                    </div>
                                    <div class="col-md-5">
                                       
                                        <asp:Button   CssClass="btn btn-primary"   OnClientClick="bindMyScript('${id}')" runat="server" id="button" Text="Book Now" OnClick="BookNowClick" />
                                    </div>
                                </div>
                            </div>
                              </div>
                         </script>
<script  id="userMessages_template" type="text/x-jquery-tmpl">
   
         <input type="button"  class="userMessage btn btn-primary" onclick="return UserMsgClick('${reply}')" id="button1" value='${reply}' />
    
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
                                                        <h6><span id="data1"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/price.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="data2"></span></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/kaba-hotel-icon-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="data3"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/rating.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="data4"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/kaba-hotel-icon-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="data5"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/two-passports-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="data6"></span></h6>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-md-12" style="padding:0">
                                                        <img src="/chat/contents/img/jahaz-white.png" width="100%">
                                                    </div>
                                                    <div class="col-md-12" style="padding:0;">
                                                        <h6><span id="data8"></span></h6>
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
                                                <h6>Haji Sab Available</h6>
                                            </div>
                                        </div>
                                    </div>
                        </div></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding:0;" id="userMessageArea">
                           <%-- <div class="col-md-9" style="padding: 0">
                                <input type="text" class="form-control chat-input" name="message"  id="usermsg" placeholder="Enter your message here">
                            </div>
                            <div class="col-md-3" style="padding: 0">
                                <input  type="button" id="submitmsg"  name="Submit" value="Send" class="btn btn-primary btn-block"/>
                            </div>--%>

                        </div>
                    </div>
    <%-- related ppkgs area --%>
    <div class="col-md-5">
                    <h4 style="color: white; text-align: center; margin-top: 0;">Recommended Packages</h4>
                    <div class="col-md-10" style="margin-right: auto; margin-left: auto; float: none; padding:0;"  id="recommended_packages">
                   
                     
                        </div></div>
</div></ContentTemplate></asp:UpdatePanel>
<%--<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
<script type="text/javascript">
    var data;
    var count=-1;
    bindMyScript = function (data)
    {
       console.log(data);
        $(this).attr("CommandArgument", data);
       // $(this).Click();
        __doPostBack('page', data);
        return true;
    }

    function LoadScript() {
       // alert("here i m start");
        data = jsondata;
        console.log(data)
        var x = $.grep(data, function (n, i) {
            return (n && i < 2);
        });
        $("#userMessageArea")[0].innerHTML = "";
        var myuserMessagesx = [{ "reply": "salam" }, { "reply": "hi" }];
        $("#userMessages_template").tmpl(myuserMessagesx).appendTo("#userMessageArea");
        $("#pkgTemplate").tmpl(x).appendTo("#recommended_packages");

          accesstoken = '<%=token%>';
           sessionID = '<%=sessionID%>';
        pythonServer = '<%=pythonServer%>';



        UserMsgClick = function (user_textData) {
            user_text = user_textData.toLowerCase();
           // alert(user_text)
            $("#userMessageArea")[0].innerHTML = "";
            var userMsg = "#data" + count;
            //  alert(userMsg);
            console.log(user_textData);
            if (count > 0 && user_text != "satisfied" && user_text != "not satisfied" && user_text != "ticket" && user_text != "no_ticket") {
                //  alert(userMsg);
                if ($(userMsg)[0] != undefined) {
                    $(userMsg)[0].innerHTML = user_textData;
                }
                
            }
            count = count + 1;
            accessPoint = "/chat/ChatServices.aspx/BotChatGet";//pythonServer + "sendmsg";
           if (!user_text) { window.alert("Enter Message"); return;}
           var user_textArr = user_text.split(/\n/);
           console.log(user_textArr);
           $.each(user_textArr, function(){
               $("#bot_msg_Area").append('<div class="col-md-12" style="margin-top:5px"><div class="col-md-7 clientsb"><h6>'+this+'</h6></div>');
               console.log("i m here");
               $('#bot_msg_Area')[0].lastChild.scrollIntoView(false);
           });
           jdata = {'userMessage': user_text,
               'SessionID': sessionID
           }; 
           jdataString = JSON.stringify(jdata);
           console.log(jdataString);
		$.ajax({
		    type: "POST",
		    url: accessPoint,
			data: jdataString,
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (data_output) {
			   // alert("here");
			    console.log(data_output);
			    getMessageFunction(data_output.d);
			},
			error: function (data_output) {
			    console.log(data_output.d);
			    getMessageFunction();
		}
		
		}); return false;
        };

        exp = "n";
       context_json = {};
       getMessageFunction = (function (myOutPut) {
           //jdata = {
           //    'token': accesstoken,
           //    'sessionID': sessionID
           //};
           //jdataString = JSON.stringify(jdata);
           //accessPoint = pythonServer + "getmsg";
           //$.ajax({
           //    type: "POST",
           //    crossOrigin: true,
           //    url: accessPoint,
           //    data: jdataString,
           //    dataType: "json",
           //    contentType: "application/json",
           //    success: function (data_output) {
           data_output = JSON.parse(myOutPut);
           console.log(data_output['msg'])
          // console.log(data_output.d['msg'])
           
                   
                       
           if (data_output['context'] != undefined) {
               context = data_output['context'];
               if (context != "") {
                   exp =""
                   contextArray1 = context.split(','); console.log(context);
                  contextArray = [];//contextArray1.map(Number);
                   //if (contextArray.length == 1) { exp = "n.id == " + contextArray[0]+" &&i<3"; }
                   //else {
                   jQuery.each(contextArray1, function () { contextArray.push(parseInt(this)); });
                   //}
               $("#recommended_packages").html("");
               var y = $.grep(data, function (n, i) {
                   return ($.inArray(n.id, contextArray) >= 0);
               });
               console.log("**************");
               console.log(contextArray); console.log(data);
               $("#pkgTemplate").tmpl(y).appendTo("#recommended_packages");
               }
           }
                      
               if (data_output['msg'] != undefined) {
                // alert("i m now here is");
                 msg = data_output['msg']
                   msgArray = msg.split(',')
                   jQuery.each(msgArray, function () {
                               $('#data').text(this)
                               $("#bot_msg_Area").append(' <div class="col-md-12"><div class="col-md-1" style="padding:5px; padding-top: 0;"><img src="/chat/contents/img/HajiSb.png" width="100%"></div><div class="col-md-7 hajisb" style="margin-top:5px"> <h6>' + this + '</h6> </div> </div>');
                       
                   });}
                          
               if (data_output['quickReplies'] != undefined) {
                   string = data_output['quickReplies']
                   console.log(string);
                   $("#userMessageArea")[0].innerHTML = "";
                   if(string!=""){
                   quickReplies = string.split(',')
                   console.log(quickReplies[0]);
                   var myuserMessagesx = []
                   quickReplies.forEach(function (reply) {

                       myuserMessagesx.push({ "reply": reply });
                       console.log(myuserMessagesx);
                   });
                   console.log(myuserMessagesx);

                  
                   $("#userMessages_template").tmpl(myuserMessagesx).appendTo("#userMessageArea");

               }
               }
          
                  
                   
                   //$('#bot_msg_Area').scrollTop($('#bot_msg_Area')[0].scrollHeight)

                   $('#bot_msg_Area')[0].lastChild.scrollIntoView(false);
           //    },
           //    error: function (data) { console.log('............................');console.log(data);}

           //});

       });

       
     //  var interval = 1000 * 60 * 0.1; // where X is your every X minutes

        // setInterval(getMessageFunction, interval);
      
}
	
</script>