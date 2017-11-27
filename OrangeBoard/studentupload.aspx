<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentupload.aspx.cs" Inherits="OrangeBoard.studentupload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:FileUpload ID="FileUpload1assignment" runat="server" />
<asp:Button ID="btnUploadassignment" runat="server" Text="Upload" OnClick="UploadFile" />
<hr />
<asp:GridView ID="GridView1assignment" runat="server" AutoGenerateColumns="false" EmptyDataText = "No files uploaded">
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownloadassignment" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID = "lnkDeleteassignment" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        <asp:Label ID="Label1assignment" runat="server"></asp:Label>


    </form>
</body>
</html>
