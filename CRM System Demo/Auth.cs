using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace CRM_System_Demo
{
    public class Auth: Page
    {
        DateTime date = DateTime.Now;

        public void AuthenPush(string nameAndSurname)
        {
            string dt = date.ToLongTimeString();
            int salt = dt.GetHashCode();

            HttpCookie cookieName = new HttpCookie("name", nameAndSurname);
            HttpCookie cookieSign = new HttpCookie("sign", Convert.ToString(salt));
            HttpCookie cookieTime = new HttpCookie("time", dt);

            Response.Cookies.Add(cookieName);
            Response.Cookies.Add(cookieSign);
            Response.Cookies.Add(cookieTime);
        }
        public string AuthenCatch()
        {
            HttpCookie time = Request.Cookies["time"];
            string tempSign = Convert.ToString(time.Value.GetHashCode());
            return tempSign;
        }
        
    }
}