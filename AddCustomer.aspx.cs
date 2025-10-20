using System;

namespace PgCrudWebForms
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            da.InsertCustomer(name, email);
            lblMessage.Text = "Customer added successfully.";
            txtName.Text = "";
            txtEmail.Text = "";
        }
    }
}