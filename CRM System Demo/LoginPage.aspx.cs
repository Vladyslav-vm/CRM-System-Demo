using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CRM_System_Demo
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (TextBox1.Text != "" & TextBox2.Text != "")
            {
                Response.BufferOutput = true;
                Response.Redirect("index.aspx");
            }
            else
            {
                Label3.Text = "Something gone wrong!";
                
            }
        }
    }
}