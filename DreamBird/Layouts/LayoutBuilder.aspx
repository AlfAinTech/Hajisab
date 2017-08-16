<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LayoutBuilder.aspx.cs" Inherits="Layouts_LayoutBuilder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script   src="https://code.jquery.com/jquery-2.2.4.js"   integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="   crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('#<%= TextBox2.ClientID %>').change(function () {
                var value = $(this).val();
                $('#content-data').html("");
                $('#finalize').prop("disabled", false);
                $('#edit').prop("disabled", false);
                var i = 0;
                for(i = 1; i <= $(this).val(); i++)
                {
                    $('#content-data').append("Please Enter Content Ratio for Row "+i+"<br><input type='text' class='form-control content-text'>");
                }
            });
            $('#finalize').click(function () {
                $('#<%= Label1.ClientID %>').text("");
                var contentratio = "";
                $('.content-text').each(function () {
                    if (contentratio == "")
                    {
                        contentratio = $(this).val();
                    }
                    else
                    {
                        contentratio = contentratio + '/' + $(this).val();
                    }
                    $(this).prop('disabled', true);
                });
                $('#<%= Label1.ClientID %>').text(contentratio);
            });
            $('#edit').click(function () {
                $('.content-text').each(function () {
                    $(this).prop('disabled', false);
                });
            });
            $('#<%= Button1.ClientID %>').click(function (e) {

                var Name = $('#<%= TextBox1.ClientID %>').val();
                var ContentRatio = $('#<%= Label1.ClientID %>').text();
                var incheader = $('#<%= CheckBox1.ClientID %>').val();
                var incfooter = $('#<%= CheckBox2.ClientID %>').val();
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "LayoutBuilder.aspx/SaveLayout",
                    data: "{LayoutName:" + JSON.stringify(Name) + ", ContentRatio:" + JSON.stringify(ContentRatio) + ", incheader:" + JSON.stringify(incheader) + ", incfooter:" + JSON.stringify(incfooter) + "}",
                    dataType: "json",
                    success: function (response) {
                        alert("Layout has been Saved! Please Refresh the Page to View in the Table Below " + response.d);
                        // window.location.href = "ClubCreation.aspx";
                    },
                    Error: function () {
                        alert('error');
                    }
                });
            });
            
        });

        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <br /><br /><br /><br />
   
        <div class="col-md-6" style="padding:20px; background-color:aqua;">
        <div class="row">
            <div class="col-md-6">Name</div>
            <div class="col-md-6">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
        </div>
        <div class="row">
            <div class="col-md-6">Inclue Header</div>
            <div class="col-md-6">
                <asp:CheckBox ID="CheckBox1" runat="server" /></div>
        </div>
        <div class="row">
            <div class="col-md-6">Inclue Footer</div>
            <div class="col-md-6">
                <asp:CheckBox ID="CheckBox2" runat="server" /></div>
        </div>
            <div class="row">
            <div class="col-md-6">No. of Rows In Content Area</div>
            <div class="col-md-6">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox></div>
        </div>
        <div class="row">
            <div class="col-md-6">Content Ratio<br /> Equivellent to 12 e.g. (3:4:5)</div>
            <div class="col-md-6">
        <div id="content-data" >

        </div>
                <asp:Label ID="Label1" runat="server" ></asp:Label>
                <input type="button" value="Edit Ratios" id="edit" class="btn btn-primary" disabled="disabled" />
                <input type="button" value="Finalize" id="finalize" class="btn btn-primary" disabled="disabled" />
            </div>
            </div>
        <div class="row">
            <asp:Button ID="Button1" runat="server" Text="Add Layout" CssClass="btn btn-primary" />
        </div>
        </div>
        </div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="293px" AllowPaging="True" AutoGenerateRows="False" DataSourceID="EntityDataSource1" DataKeyNames="id">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:CheckBoxField DataField="Header" HeaderText="Header" SortExpression="Header" />
                <asp:CheckBoxField DataField="Footer" HeaderText="Footer" SortExpression="Footer" />
                <asp:BoundField DataField="ContentRatio" HeaderText="ContentRatio" SortExpression="ContentRatio" />
            </Fields>
        </asp:DetailsView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=DreamBirdEntities" DefaultContainerName="DreamBirdEntities" EnableFlattening="False" EntitySetName="DynamicLayouts">
        </asp:EntityDataSource>
    </form>
</body>
</html>
