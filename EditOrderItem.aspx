<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditOrderItem.aspx.cs" Inherits="PgCrudWebForms.EditOrderItem" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Order Item</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Edit Order Item</h2>
        <asp:Label ID="lblOrder" runat="server" Text="Order:" />
        <asp:DropDownList ID="ddlOrder" runat="server" /><br />
        <asp:Label ID="lblProduct" runat="server" Text="Product:" />
        <asp:DropDownList ID="ddlProduct" runat="server" /><br />
        <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" />
        <asp:TextBox ID="txtQuantity" runat="server" /><br />
        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price:" />
        <asp:TextBox ID="txtUnitPrice" runat="server" /><br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>