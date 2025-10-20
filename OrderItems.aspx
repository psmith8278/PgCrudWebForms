<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderItems.aspx.cs" Inherits="PgCrudWebForms.OrderItems" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Order Items</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Order Items</h2>
        <asp:Button ID="btnAddOrderItem" runat="server" Text="Add Order Item" OnClick="btnAddOrderItem_Click" />
        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderItemId" OnRowEditing="gvOrderItems_RowEditing" OnRowDeleting="gvOrderItems_RowDeleting">
            <Columns>
                <asp:BoundField DataField="OrderItemId" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="OrderId" HeaderText="Order" />
                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" DataFormatString="{0:C}" />
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>