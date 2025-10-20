using System;
using System.Web.UI.WebControls;

namespace PgCrudWebForms
{
    public partial class Orders : System.Web.UI.Page
    {
        private DataAccess da = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindOrders();
        }

        private void BindOrders()
        {
            gvOrders.DataSource = da.GetOrders();
            gvOrders.DataBind();
        }

        protected void btnAddOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddOrder.aspx");
        }

        protected void gvOrders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int orderId = Convert.ToInt32(gvOrders.DataKeys[e.NewEditIndex].Value);
            Response.Redirect("EditOrder.aspx?id=" + orderId);
        }

        protected void gvOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int orderId = Convert.ToInt32(gvOrders.DataKeys[e.RowIndex].Value);
            da.DeleteOrder(orderId);
            BindOrders();
            lblMessage.Text = "Order deleted successfully.";
        }
    }
}