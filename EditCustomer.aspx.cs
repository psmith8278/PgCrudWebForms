using System;

namespace PgCrudWebForms
{
    public partial class EditCustomer : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();
        private int CustomerId => int.TryParse(Request.QueryString["id"], out int id) ? id : 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && CustomerId > 0)
            {
                var customer = da.GetCustomerById(CustomerId);
                if (customer != null)
                {
                    txtName.Text = customer.Name;
                    txtEmail.Text = customer.Email;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            if (CustomerId > 0)
            {
                da.UpdateCustomer(CustomerId, name, email);
                lblMessage.Text = "Customer updated successfully.";
            }
            else
            {
                lblMessage.Text = "Invalid input.";
            }
        }
    }
}