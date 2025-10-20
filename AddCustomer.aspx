<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="PgCrudWebForms.AddCustomer" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Customer</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add Customer</h2>
        <asp:Label ID="lblName" runat="server" Text="Name:" />
        <asp:TextBox ID="txtName" runat="server" /><br />
        <asp:Label ID="lblEmail" runat="server" Text="Email:" />
        <asp:TextBox ID="txtEmail" runat="server" /><br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>