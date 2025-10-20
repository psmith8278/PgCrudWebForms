using System;

namespace PgCrudWebForms
{
    public partial class AddOrder : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCustomer.DataSource = da.GetCustomers();
                ddlCustomer.DataTextField = "Name";
                ddlCustomer.DataValueField = "CustomerId";
                ddlCustomer.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int customerId = int.Parse(ddlCustomer.SelectedValue);
            DateTime orderDate = DateTime.Parse(txtOrderDate.Text);
            da.InsertOrder(customerId, orderDate);
            lblMessage.Text = "Order added successfully.";
            txtOrderDate.Text = "";
        }
    }
}