<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DetailSearch.ascx.cs" Inherits="UmrahComponents_PackageComponent_DetailSearch" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackageListView.ascx" TagPrefix="uc1" TagName="PackageListView" %>

<script>
   
    function setPrice(current) {
        var duration= $(current).val();
        console.log(duration);
        $('input[id$="price_txt"] ')[0].value="";
        $('input[id$="price_txt"] ')[0].value = duration;
        __doPostBack("price_txt", "TextChanged");
        return;
    }
    function setHaramDistance(current) {
        var duration = $(current).val();
        console.log(duration);
        $('input[id$="haram_distance"] ')[0].value = "";
        $('input[id$="haram_distance"] ')[0].value = duration;
        __doPostBack("haram_distance", "TextChanged");
        return;
    }
    function filterMonth(current)
    {
        var value = $(current).val();
        
        $('input[id$="package_month"] ')[0].value = "";
        $('input[id$="package_month"] ')[0].value = value;
        __doPostBack("package_month", "TextChanged");
        return;
    }
    function setMadinaDistance(current) {
        var duration = $(current).val();
        console.log(duration);
        $('input[id$="madina_distance"] ')[0].value = "";
        $('input[id$="madina_distance"] ')[0].value = duration;
        __doPostBack("madina_distance", "TextChanged");
        return;
    }
    function setDuration(current) {
        var duration = $(current).val();
        console.log(duration);
        $('input[id$="duration_lbl"] ')[0].value = "";
        $('input[id$="duration_lbl"] ')[0].value = duration;
        __doPostBack("duration_lbl", "TextChanged");
        return;
    }
</script>


        <div class="panel panel-success">
          <div class="panel-heading">
            <h3 class="panel-title">Filter Criteria</h3>
        </div>
        <div class="panel-body">
            <asp:Panel ID="panel1" runat="server" Visible="false">
            <div class="col-md-1">
                
                <asp:LinkButton ID="btn1" runat="server" CommandArgument="1" OnClick="delete_filter"><span class="glyphicon glyphicon-remove" aria-hidden="true"/></asp:LinkButton>
            </div>
            
            <div class="col-md-10">Package Price:  <asp:Label ID="price_filter" runat="server" ></asp:Label></div>

            </asp:Panel>
            <asp:Panel ID="panel2" runat="server" Visible="false">
            <div class="col-md-1">
                <asp:LinkButton ID="btn2" runat="server" CommandArgument="2" OnClick="delete_filter"><span class="glyphicon glyphicon-remove" aria-hidden="true"/></asp:LinkButton>
            </div>
            
            <div class="col-md-10">Package Month:  <asp:Label ID="month_filter" runat="server" ></asp:Label></div>

            </asp:Panel>
            <asp:Panel ID="panel3" runat="server" Visible="false">
            <div class="col-md-1">
                <asp:LinkButton runat="server" ID="btn3" CommandArgument="3" OnClick="delete_filter"><span class="glyphicon glyphicon-remove" aria-hidden="true"/></asp:LinkButton>
            </div>
            
            <div class="col-md-10">Package Duration: <asp:Label ID="duration_filter" runat="server" ></asp:Label></div>

            </asp:Panel>
            <asp:Panel ID="panel4" runat="server" Visible="false">
            <div class="col-md-1">
                <asp:LinkButton runat="server" ID="btn4" CommandArgument="4" OnClick="delete_filter"><span class="glyphicon glyphicon-remove" aria-hidden="true"/></asp:LinkButton>
            </div>
            
            <div class="col-md-10">Package Flight: <asp:Label ID="flight_filter" runat="server" ></asp:Label></div>

            </asp:Panel>
            <asp:Panel ID="panel5" runat="server" Visible="false">
            <div class="col-md-1">
                <asp:LinkButton runat="server" ID="btn5" CommandArgument="5" OnClick="delete_filter"><span class="glyphicon glyphicon-remove" aria-hidden="true"/></asp:LinkButton>
            </div>
            
            <div class="col-md-10">Distance From Haram: <asp:Label ID="hd_filter" runat="server" ></asp:Label></div>

            </asp:Panel>
            <asp:Panel ID="panel6" runat="server" Visible="false">
            <div class="col-md-1">
                <asp:LinkButton runat="server" ID="btn6" CommandArgument="6" OnClick="delete_filter"><span class="glyphicon glyphicon-remove" aria-hidden="true"/></asp:LinkButton>
            </div>
            
            <div class="col-md-10">Distance From Masjid Nabvi: <asp:Label ID="md_filter" runat="server" Text="Label"></asp:Label></div>

            </asp:Panel>
            
        </div>
        <div class="panel-footer">
          <asp:Button class="btn btn-danger" style="padding:3px 10px;" Text="Clear" runat="server" ID="clear" OnClick="clear_Click"></asp:Button>
      </div>
  </div>
  <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">Budget</h3>
    </div>
    <div class="panel-body">
        <h3 style="color:black"><asp:Label ID="price_lbl" runat="server"  ></asp:Label></h3>
        <div class="col-md-12">
            <asp:TextBox type="range" runat="server" ID="price_range" class="form-control" name="price_range" onchange="setPrice(this)" AutoPostBack="True" ></asp:TextBox>
            <asp:TextBox ID="price_txt" runat="server"  style="display:none" OnTextChanged="price_range_TextChanged"  ></asp:TextBox>
        </div>
    </div>
</div>
<div class="panel panel-primary">
  <div class="panel-heading">
  <h3 class="panel-title">Package Month</h3>
</div>
<div class="panel-body">
    
     <input type="month"  runat="server" ID="monthInput" class="form-control" onchange="filterMonth(this)"  AutoPostBack="true"/>
    <asp:TextBox ID="package_month" runat="server" OnTextChanged="package_month_TextChanged" style="display:none" Text="0"></asp:TextBox>
</div>
</div>
<div class="panel panel-primary">
    
  <div class="panel-heading">
    <h3 class="panel-title">Duration of Stay</h3>
</div>
<div class="panel-body">
    <h3 style="color:black"> <asp:Label ID="dur_lbl" runat="server" ></asp:Label></h3>
        <div class="col-md-12">
            <asp:TextBox runat="server" ID="duration_txt" type="range" class="form-control" name="" onchange="setDuration(this)" AutoPostBack="True" />
        <asp:TextBox ID="duration_lbl" runat="server" OnTextChanged="duration_txt_TextChanged" style="display:none" Text="50"></asp:TextBox>
        </div>
</div>
</div>

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Select Flight</h3>
</div>
<div class="panel-body" id="airLine">
    <asp:DropDownList ID="airLine_list" runat="server" CssClass="form-control" OnSelectedIndexChanged="airLine_list_SelectedIndexChanged" DataTextField="Name" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
</div>
</div>
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Distance From Haram</h3>
</div>
<div class="panel-body" id="makkahDistance">
    <h3 style="color:black"> <asp:Label ID="hd_lbl" runat="server"  ></asp:Label></h3>
        <div class="col-md-12">
            <asp:TextBox runat="server" ID="distanceHaram_txt" type="range" class="form-control" onchange="setHaramDistance(this)" AutoPostBack="True"  />
            <asp:TextBox ID="haram_distance" runat="server" OnTextChanged="distanceHaram_txt_TextChanged" style="display:none" Text="50"></asp:TextBox>
        </div>
</div>
</div>
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Distance From Masjid Nabvi</h3>
</div>
<div class="panel-body" id="accommodation">
    <h3 style="color:black"> <asp:Label ID="md_lbl" runat="server"  ></asp:Label></h3>
        <div class="col-md-12">
             <asp:TextBox runat="server" ID="distanceMadina_txt" type="range" class="form-control" name="" onchange="setMadinaDistance(this)" AutoPostBack="True" />
            <asp:TextBox ID="madina_distance" runat="server" OnTextChanged="distanceMadina_txt_TextChanged" style="display:none" Text="50"></asp:TextBox>
        </div>
</div>
</div>

   
     
    