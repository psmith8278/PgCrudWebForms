<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="PgCrudWebForms.EditProduct" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Product</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Edit Product</h2>
        <asp:Label ID="lblName" runat="server" Text="Name:" />
        <asp:TextBox ID="txtName" runat="server" /><br />
        <asp:Label ID="lblPrice" runat="server" Text="Price:" />
        <asp:TextBox ID="txtPrice" runat="server" /><br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>