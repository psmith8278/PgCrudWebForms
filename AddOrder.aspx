<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="PgCrudWebForms.AddOrder" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Order</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add Order</h2>
        <asp:Label ID="lblCustomer" runat="server" Text="Customer:" />
        <asp:DropDownList ID="ddlCustomer" runat="server" /><br />
        <asp:Label ID="lblOrderDate" runat="server" Text="Order Date:" />
        <asp:TextBox ID="txtOrderDate" runat="server" /><br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>