<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="PgCrudWebForms.AddProduct" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Product</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add Product</h2>
        <asp:Label ID="lblName" runat="server" Text="Name:" />
        <asp:TextBox ID="txtName" runat="server" /><br />
        <asp:Label ID="lblPrice" runat="server" Text="Price:" />
        <asp:TextBox ID="txtPrice" runat="server" /><br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>