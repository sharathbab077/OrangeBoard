<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentdownload.aspx.cs" Inherits="OrangeBoard.studentdownload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">



<asp:GridView ID="GridView1student" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownloadstudent" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
       
    </Columns>
</asp:GridView>

        <asp:Label ID="Label1student" runat="server"></asp:Label>













    </form>
</body>
</html>
