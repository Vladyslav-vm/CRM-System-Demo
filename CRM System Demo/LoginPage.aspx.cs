using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
                if (ReadMyData() == true)
                {
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

        protected bool ReadMyData()
        {
            //string myConnectionString = "Database=CRMBase; Server=MSSQLFULL; Integrated Security=True"; //"Data Source = MSSQLFULL; Initial Catalog = CRMBase;";
            //string mySelectQuery = "SELECT login, password FROM _user WHERE login ='" + TextBox1.Text + "' AND password = '" + TextBox2.Text + "'";
            //SqlConnection myConnection = new SqlConnection(myConnectionString);
            //SqlCommand myCommand = new SqlCommand(mySelectQuery, myConnection);
            ////problems with connection
            //myConnection.Open();
            //SqlDataReader myReader = myCommand.ExecuteReader();
            bool b = false;
            //string str = myReader[0].ToString();
            //string str1 = myReader[1].ToString();
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            int reorderedProducts = (int)dv.Table.Rows.Count;
            if (reorderedProducts == 1)
                    {
                        
                        b = true;
                     
                    }

              
            return b;
        }
    }
}