using System;

namespace PgCrudWebForms
{
    public partial class EditOrder : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();
        private int OrderId => int.TryParse(Request.QueryString["id"], out int id) ? id : 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCustomer.DataSource = da.GetCustomers();
                ddlCustomer.DataTextField = "Name";
                ddlCustomer.DataValueField = "CustomerId";
                ddlCustomer.DataBind();

                if (OrderId > 0)
                {
                    var order = da.GetOrderById(OrderId);
                    if (order != null)
                    {
                        ddlCustomer.SelectedValue = order.CustomerId.ToString();
                        txtOrderDate.Text = order.OrderDate.ToString("yyyy-MM-dd");
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int customerId = int.Parse(ddlCustomer.SelectedValue);
            DateTime orderDate = DateTime.Parse(txtOrderDate.Text);
            if (OrderId > 0)
            {
                da.UpdateOrder(OrderId, customerId, orderDate);
                lblMessage.Text = "Order updated successfully.";
            }
            else
            {
                lblMessage.Text = "Invalid input.";
            }
        }
    }
}