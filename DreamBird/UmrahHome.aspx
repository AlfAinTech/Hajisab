<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UmrahHome.aspx.cs" Inherits="UmrahHome" EnableEventValidation="false" ValidateRequest="false"  %>











<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	  <meta charset="utf-8" />
   
     <link rel="stylesheet" href='~/UmrahComponents/Contents/css/bootstrap.css' />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.0.0/animate.min.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/liquid-slider.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/style.css"/>
    
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
    <script src='<% = ResolveUrl("~/UmrahComponents/Contents/js/jquery.cycle.lite.js") %>' ></script>

    <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
    <script src='<%= ResolveUrl("~/UmrahComponents/Contents/js/bootstrap.js") %>'></script></asp:PlaceHolder>
    <script type="text/javascript">
       Initialize = function(){
            $('.right').cycle({
                fx:      'scrollRight',
                next:   '#chat_now',
                timeout:  0,
                easing:  'easeInOutBack'
            });
            $('#learn_more').click(function(e){
                e.preventDefault();
                window.location.href = "http://www.google.com";
            });
       }

       $(document).on('click', '.bot', function () {
           $('#chat_now').click();
       });

       function finallizeAmount() {
           alert("here");
       } function callModal(param) {
           debugger;
           $('#myModal').modal('show');
           currentCommand = $(param).attr('href'); console.log($(param));
           return false;
       }

       function executeCurrentCommand() {
           location.href = currentCommand;
       }
      

    </script>

    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,500,700,900" rel="stylesheet">
    
</head>
<body>
    <form id="form1" runat="server">
   

      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
       
        <div class="row">
          
            
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>
    
          
                        <div id="body_content" class="col-md-12" runat="server">
                           
                        </div>
    
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>

        </div> 
       
     
          

    </form>
</body>
</html>
