<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrderItem.aspx.cs" Inherits="PgCrudWebForms.AddOrderItem" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Order Item</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add Order Item</h2>
        <asp:Label ID="lblOrder" runat="server" Text="Order:" />
        <asp:DropDownList ID="ddlOrder" runat="server" /><br />
        <asp:Label ID="lblProduct" runat="server" Text="Product:" />
        <asp:DropDownList ID="ddlProduct" runat="server" /><br />
        <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" />
        <asp:TextBox ID="txtQuantity" runat="server" /><br />
        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price:" />
        <asp:TextBox ID="txtUnitPrice" runat="server" /><br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>