<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TagControll.ascx.cs" Inherits="Components_Core_TagControll" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

<script src="../../Components/Core/Content/src/jquery.tokeninput.js"></script>
<link href="../../Components/Core/Content/styles/token-input.css" rel="stylesheet" />

 <div>
        <input type="text" id="demo-input" name="blah" />
        <input type="button" value="Submit" />
        <script type="text/javascript">
        $(document).ready(function() {
            $("#demo-input").tokenInput("../../Components/Core/TagServices.aspx/GetTags");
        });
        </script>

       <%--  <script type="text/javascript">
        $(document).ready(function() {
            $("#demo-input").tokenInput([
                {id: 7, name: "Ruby"},
                {id: 11, name: "Python"},
                {id: 13, name: "JavaScript"},
                {id: 17, name: "ActionScript"},
                {id: 19, name: "Scheme"},
                {id: 23, name: "Lisp"},
                {id: 29, name: "C#"},
                {id: 31, name: "Fortran"},
                {id: 37, name: "Visual Basic"},
                {id: 41, name: "C"},
                {id: 43, name: "C++"},
                {id: 47, name: "Java"}
            ]);
        });
        </script>--%>
    </div>