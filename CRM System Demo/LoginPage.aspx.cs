using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Security.Cryptography;

namespace CRM_System_Demo
{
    public partial class LoginPage : System.Web.UI.Page
    {
        //string nameAndSurname = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (TextBox1.Text != "" & TextBox2.Text != "")
            {
                if (ReadMyData() == true)
                {
                    DateTime date = DateTime.Now;
                    // date.ToLongTimeString();
                    string dt = date.ToLongTimeString();
                    int salt = dt.GetHashCode();

                    HttpCookie cookieName = new HttpCookie("name", nameAndSurname());
                    HttpCookie cookieSign = new HttpCookie("sign", Convert.ToString(salt));
                    HttpCookie cookieTime = new HttpCookie("time", dt);
                    //// Для того, что бы гарантировать, что данный cookie-набор был создан нашей странице, а не злоумышленником,
                    //// в ответ кроме имени мы отправляем cookie-набор подпись.
                    //// Для того, что бы усложнить подбор значения, которое мы поместили в подпись используется "соль" - слово или 
                    //// набор символов.
                    //// Каждый раз когда от пользователя будут приходить запросы, мы будем повторно генерировать подпись и проверять,
                    //// что бы она совпадала с полученой.
                    cookieSign.Expires = date.AddMinutes(2);
                    Response.Cookies.Add(cookieName);
                    Response.Cookies.Add(cookieSign);
                    Response.Cookies.Add(cookieTime);
                    //Auth auth = new Auth();
                    //auth.AuthenPush(nameAndSurname());


                    Response.BufferOutput = true;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Label3.Text = "Wrong login or password!";
                }
            }
            else
            {
                Label3.Text = "Enter login and password!";

            }
        }

        protected string nameAndSurname()
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            return dv.Table.Rows[0].ItemArray.GetValue(0).ToString();
        }
        protected bool ReadMyData()
        {
           
            bool b = false;
            
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int reorderedProducts = dv.Table.Rows.Count;
            
            if (reorderedProducts == 1)
                    {
                        
                        b = true;
                     
                    }

            return b;
        }


       //protected string GenSalt(string tm)
       // {
       //     //RNGCryptoServiceProvider p = new RNGCryptoServiceProvider();
       //     //var salt =  new byte[tm];
       //     tm.GetHashCode();
       //     return Convert.ToBase64String(salt);
            
       // }

    }
}