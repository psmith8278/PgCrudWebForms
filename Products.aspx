<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="PgCrudWebForms.Products" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Products</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Products</h2>
        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" />
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" OnRowEditing="gvProducts_RowEditing" OnRowDeleting="gvProducts_RowDeleting">
            <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>