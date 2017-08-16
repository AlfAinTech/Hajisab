<%@ Control Language="C#" AutoEventWireup="true" CodeFile="toolbar_control.ascx.cs" Inherits="Components_DragDropFramework_toolbar_control" %>
<!--<div class="row">-->
    <div class="col-md-12">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-fire" aria-hidden="true"></span></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="#" data-toggle="modal" data-target="#myModal">Add New Layout</a></li>
                    </ul>
                    <ul class="nav navbar-nav" style="margin-left:200px">
                        <li><a href="#" id="PageName" >Load Page</a> <input id="HiddenID" type="hidden" /></li>
                        <li><a  href="<%# Server.MapPath("~/") %>/DreamHome/GMAT/Page1">GMAT</a></li>
                        <li><a  href="<%# Server.MapPath("~/") %>/DreamHome/GAT/Page1">GAT</a></li>
                        <li><a  href="<%# Server.MapPath("~/")%>/Admin/ManageDreamLayout">Admin</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                Add Controls
                            </a>
                        </li>
                        <li>
                            <a href=" " id="SaveChanges" style="pointer-events:none;">Save Changes</a>
                        </li>
                        <li style="margin-top:5px;">
                            Edit Mode
                            <input type="checkbox" name="my-checkbox" />
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
<!--</div>-->
<div class="collapse" id="collapseExample">
    <div class="well">
        <div class="row">
            <div class="content">
                <div class="panel-group" id="accordion">

                </div>
            </div>
        </div>
    </div>
</div>