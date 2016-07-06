using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM_System_Demo
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow != null)
            {
                DetailsView1.Visible = true;
            }
            else
            {
                DetailsView1.Visible = false;
            }
        }

        protected void main_Click(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("index.aspx");
        }

        protected void user_Click(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("users.aspx");
        }

        protected void product_Click(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("products.aspx");
        }

        protected void customer_Click(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("customers.aspx");
        }

        protected void contract_Click(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("contracts.aspx");
        }
        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);

        }
    }
}