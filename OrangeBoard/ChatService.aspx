<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChatService.aspx.cs" Inherits="OrangeBoard.ChatService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <script type="text/javascript">
            (function () {
                var scriptElement = document.createElement('script');
                scriptElement.type = 'text/javascript';
                scriptElement.async = true;
                scriptElement.src = 'http://localhost:49847/ChatService.aspx?Get=Script';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(scriptElement);
            })();
        </script>
    </form>
</body>
</html>
