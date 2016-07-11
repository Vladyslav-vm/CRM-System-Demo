using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM_System_Demo
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.Visible = false;
            Calendar2.Visible = false;
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

        protected void report_Click(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("reports.aspx");
        }


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            fromDate.Text = Calendar1.SelectedDate.ToString("dd.MM.yyyy");
            Calendar1.Visible = false;
        }

        protected void calend1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void calen2_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            toDate.Text = Calendar2.SelectedDate.ToString("dd.MM.yyyy");
            Calendar2.Visible = false;
        }
    }
}