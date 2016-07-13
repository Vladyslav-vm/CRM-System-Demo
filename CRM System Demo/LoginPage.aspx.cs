using System;
using System.Collections.Generic;
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

            if (TextBox1.Text != "" & TextBox2.Text != "" /*& ReadMyData() == true*/)
            {
                Response.BufferOutput = true;
                Response.Redirect("index.aspx");
            }
            else
            {
                Label3.Text = "Something gone wrong!";
                
            }
        }

        public bool ReadMyData()
        {

            
            string myConnectionString = "Server = MSSQLFULL; Database = CRMBase"; //"Database=CRMBase;Server=MSSQLFULL";
            string mySelectQuery = "SELECT login, password FROM _user WHERE login ='" + TextBox1.Text + "' AND password = '" + TextBox2.Text + "'";



            SqlConnection myConnection = new SqlConnection(myConnectionString);
            SqlCommand myCommand = new SqlCommand(mySelectQuery, myConnection);

            //problems with connection
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            bool b = false;
            string str = myReader[0].ToString();
            string str1 = myReader[1].ToString();
                    if ((TextBox1.Text == str) & (TextBox2.Text == str1))
                    {
                        
                        b = true;
                     
                    }

              
            return b;
        }
    }
}