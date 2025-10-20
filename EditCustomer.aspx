<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="PgCrudWebForms.EditCustomer" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Customer</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Edit Customer</h2>
        <asp:Label ID="lblName" runat="server" Text="Name:" />
        <asp:TextBox ID="txtName" runat="server" /><br />
        <asp:Label ID="lblEmail" runat="server" Text="Email:" />
        <asp:TextBox ID="txtEmail" runat="server" /><br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>