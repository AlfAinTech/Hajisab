<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowVideoTranscript.aspx.cs" Inherits="Components_Video_Transcript_ShowVideoTranscript" %>

<%@ Register Src="~/Components/Video_Transcript/VideoTranscript.ascx" TagPrefix="uc1" TagName="VideoTranscript" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:VideoTranscript runat="server" id="VideoTranscript" MediaItemID="49" />
    </div>
    </form>
</body>
</html>
