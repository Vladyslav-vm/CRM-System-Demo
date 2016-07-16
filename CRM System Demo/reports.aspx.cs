using Microsoft.Reporting.WebForms;
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
    public partial class WebForm2 : System.Web.UI.Page
    {
        HttpCookie name = Request.Cookies["name"];
        HttpCookie sign = Request.Cookies["sign"];
        HttpCookie time = Request.Cookies["time"];
        string date1 = null;
        string date2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (name != null && sign != null && time != null)
            {
                //string temp = time.Value;
                string tempSign = Convert.ToString(time.Value.GetHashCode());

                // Если полученная подпись правильная прекращаем дальнейшую обработку события Load
                // и переходим к следующим этапам жизненного цикла страницы.
                if (sign.Value == tempSign)
                {
                    time.Value = DateTime.Now.ToLongTimeString();
                    time.Expires = DateTime.Now.AddMinutes(5);
                    string tmp = time.Value.GetHashCode();

                    sign.Value = Convert.ToString(tmp);
                    sign.Expires = DateTime.Now.AddMinutes(5);
                    Response.Cookies.Add(time);
                    Response.Cookies.Add(sign);

                    Calendar1.Visible = false;
                    Calendar2.Visible = false;
                    //ReportViewer1.Visible = false;
                    return;
                }
                else
                {
                    Response.Redirect("LoginPage.aspx");
                }
            }

            Response.Redirect("LoginPage.aspx");
            
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

        //report with filter
        private DataTable GetByDate(string date1, string date2)
        {
            try
            {
                //Create the instance for the typed dataset, DataSet2 which will 
                //hold the [PurchaseOrderDetail] table details.
                //The dataset was created as part of the tutorial in Step 4.
                CRMBaseDataSet ds = new CRMBaseDataSet();

                //Create a SQL Connection to the AdventureWorks2008 database using Windows Authentication.
                using (SqlConnection sqlconn = new SqlConnection("Data Source=.;Initial Catalog=CRMBase;Integrated Security=True"))
                {
                    //Building the dynamic query with the parameter ProductID.
                    SqlDataAdapter adap = new SqlDataAdapter("SELECT id, operation_date, operation_price FROM _operations_product where operation_date BETWEEN '" + date1 + "' AND '" + date2 + "'", sqlconn);
                    //Executing the QUERY and fill the dataset with the PurchaseOrderDetail table data.
                    adap.Fill(ds, "_operations_product");
                }

                //Return the PurchaseOrderDetail table for the Report Data Source.
                return ds._operations_product;
            }
            catch
            {
                throw;
            }
        }

        protected void ReportViewer1_Drillthrough(object sender, Microsoft.Reporting.WebForms.DrillthroughEventArgs e)
        {
            //ReportViewer1.Visible = true;
            try
            {
                //Variable to store the parameter value passed from the MainReport.
                //int productid = 0;

                //Get the instance of the Target report, in our case the JumpReport.rdlc.
                LocalReport report = (LocalReport)e.Report;

                //Get all the parameters passed from the main report to the target report.
                //OriginalParametersToDrillthrough actually returns a Generic list of 
                //type ReportParameter.
                IList<ReportParameter> list = report.OriginalParametersToDrillthrough;

                //Parse through each parameters to fetch the values passed along with them.
                //foreach (ReportParameter param in list)
                //{
                //    //Since we know the report has only one parameter and it is not a multivalued, 
                //    //we can directly fetch the first value from the Values array.
                //    productid = Convert.ToInt32(param.Values[0].ToString());
                //}

                //Binding the DataTable to the Child report dataset.
                //The name DataSet1 which can be located from, 
                //Go to Design view of Child.rdlc, Click View menu -> Report Data
                //You'll see this name under DataSet2.
                report.DataSources.Add(new ReportDataSource("Report1", GetByDate(date1, date2)));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            date1 = fromDate.Text;
            date2 = toDate.Text;
            //problem with connection to SQL 
            //GetByDate(date1, date2);
        }
    }
}