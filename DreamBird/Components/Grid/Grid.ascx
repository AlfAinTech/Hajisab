<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Grid.ascx.cs" Inherits="Components_Grid_Grid" %>

<link rel="stylesheet" type="text/css" href="<%# Server.MapPath("~/") %>/Components/Grid/Content/css/jsgrid.css" />
<link rel="stylesheet" type="text/css" href="<%# Server.MapPath("~/") %>/Components/Grid/Content/css/theme.css" />

<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/db.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/jsgrid.core.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/jsgrid.load-indicator.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/jsgrid.load-strategies.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/jsgrid.sort-strategies.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/jsgrid.field.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/fields/jsgrid.field.text.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/fields/jsgrid.field.number.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/fields/jsgrid.field.select.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/fields/jsgrid.field.checkbox.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Grid/Content/js/fields/jsgrid.field.control.js"></script>
<body>
    <div id="jsGrid"></div>
</body>
<script>
    $(function () {

        $("#jsGrid").jsGrid({
            height: "300%",
            width: "100%",
            filtering: true,
            editing: true,
            inserting: true,
            sorting: true,
            paging: true,
            //autoload: true,
            pageSize: 10,
            pageButtonCount: 5,
            deleteConfirm: "Do you really want to delete the transcript?",
            controller: db,
            fields: [
                { name: "TranscriptText", type: "text", width: 150 },
                { name: "TimeStamp", type: "number", width: 50 },
                { type: "control" }
            ]
        });

    });
    </script>


