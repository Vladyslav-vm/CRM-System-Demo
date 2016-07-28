using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM_System_Demo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie name = Request.Cookies["name"];
            HttpCookie sign = Request.Cookies["sign"];
            HttpCookie time = Request.Cookies["time"];
            // Auth auth = new Auth();
            if (name != null && sign != null && time !=null)
            {
                //string temp = time.Value;
                string tempSign = Convert.ToString(time.Value.GetHashCode());

                // Если полученная подпись правильная прекращаем дальнейшую обработку события Load
                // и переходим к следующим этапам жизненного цикла страницы.
                if (sign.Value == tempSign)
                {
                    time.Value = DateTime.Now.ToLongTimeString();
                    time.Expires = DateTime.Now.AddMinutes(5);
                    string tmp = Convert.ToString(time.Value.GetHashCode());

                    sign.Value = Convert.ToString(tmp);
                    sign.Expires = DateTime.Now.AddMinutes(5);
                    Response.Cookies.Add(time);
                    Response.Cookies.Add(sign);
                    Label1.Text = "You logged in as " + name.Value;
                    return;
                }
                else
                {
                    Response.Redirect("LoginPage.aspx");
                }
            }

            Response.Redirect("LoginPage.aspx");




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
        protected void report_Click(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("reports.aspx");
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

        protected void logOut_Click(object sender, EventArgs e)
        {
            HttpCookie name = Request.Cookies["name"];
            HttpCookie sign = Request.Cookies["sign"];
            HttpCookie time = Request.Cookies["time"];

            name.Expires = DateTime.Now.AddDays(-1);
            time.Expires = DateTime.Now.AddDays(-1);
            sign.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(name);
            Response.Cookies.Add(time);
            Response.Cookies.Add(sign);

            Response.Redirect("LoginPage.aspx");
        }
        //protected string GenSalt(int length)
        //{
        //    RNGCryptoServiceProvider p = new RNGCryptoServiceProvider();
        //    var salt = new byte[length];
        //    p.GetBytes(salt);
        //    return Convert.ToBase64String(salt);
        //}
    }
}