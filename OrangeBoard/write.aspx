<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="write.aspx.cs" Inherits="OrangeBoard.write" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
    <div>
        Title:<asp:TextBox ID="txbxTitle" runat="server"></asp:TextBox>
    </div>
    <div>
        Name:<asp:TextBox ID="txbxAuthor" runat="server"></asp:TextBox>
    </div>
    <div>
        Enter your comment<br />
        <asp:TextBox ID="txbxContent" runat="server" TextMode="MultiLine"></asp:TextBox>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
</div>
</asp:Content>
