<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="PgCrudWebForms.Orders" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Orders</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Orders</h2>
        <asp:Button ID="btnAddOrder" runat="server" Text="Add Order" OnClick="btnAddOrder_Click" />
        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId" OnRowEditing="gvOrders_RowEditing" OnRowDeleting="gvOrders_RowDeleting">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>