using System;

namespace PgCrudWebForms
{
    public partial class EditProduct : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();
        private int ProductId => int.TryParse(Request.QueryString["id"], out int id) ? id : 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && ProductId > 0)
            {
                var product = da.GetProductById(ProductId);
                if (product != null)
                {
                    txtName.Text = product.Name;
                    txtPrice.Text = product.Price.ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            if (decimal.TryParse(txtPrice.Text, out decimal price) && ProductId > 0)
            {
                da.UpdateProduct(ProductId, name, price);
                lblMessage.Text = "Product updated successfully.";
            }
            else
            {
                lblMessage.Text = "Invalid input.";
            }
        }
    }
}