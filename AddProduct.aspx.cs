using System;

namespace PgCrudWebForms
{
    public partial class AddProduct : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            if (decimal.TryParse(txtPrice.Text, out decimal price))
            {
                da.InsertProduct(name, price);
                lblMessage.Text = "Product added successfully.";
                txtName.Text = "";
                txtPrice.Text = "";
            }
            else
            {
                lblMessage.Text = "Invalid price.";
            }
        }
    }
}