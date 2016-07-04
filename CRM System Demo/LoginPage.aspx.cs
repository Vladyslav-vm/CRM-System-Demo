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
            string log = null;         
            HttpCookie l = new HttpCookie(log);
            l.Value = TextBox1.Text.ToString();

            string pas = null;
            HttpCookie p = new HttpCookie(pas);
            p.Value = TextBox2.Text.ToString();

            
        }
    }
}