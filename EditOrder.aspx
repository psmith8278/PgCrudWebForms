<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="PgCrudWebForms.EditOrder" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Order</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Edit Order</h2>
        <asp:Label ID="lblCustomer" runat="server" Text="Customer:" />
        <asp:DropDownList ID="ddlCustomer" runat="server" /><br />
        <asp:Label ID="lblOrderDate" runat="server" Text="Order Date:" />
        <asp:TextBox ID="txtOrderDate" runat="server" /><br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>