<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="CRM_System_Demo.WebForm2" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
    <style>

body {
    background-color: #D1D0CE;
}

  	.container {			
		height: 110px;
		padding: 10px 0;
        }



         .navbar-default {
    background-color: #E5E4E2;
    border-color: #2C3539;
         border-radius: 10px;
}
.navbar-default .navbar-brand {
    color: #000000;
}

footer {
    height: 100px;
    margin-top: -100px;
}

    </style>

<body>

    <div class="container-fluid">


    <form id="form1" runat="server">
                   
        <br />
                     
                     <p align="right">  
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="logOut" runat="server" BackColor="white" class="btn btn-default" Text="Log Out" OnClick="logOut_Click"  BorderColor="Black" BorderStyle="Solid" />
                         </p>
            

        <br />

<nav class="navbar navbar-default">
  
    <div class="navbar-header">
      <a class="navbar-brand">
          <h3>CRM System</h3>

      </a>
    </div>
    <ul class="nav navbar-nav">



        <li><a href="#">
            <asp:Button ID="main" runat="server" class="btn btn-default btn-lg" Text="Home" OnClick="main_Click" />
            </a></li>

        <li><a href="#">
            <asp:Button ID="user" runat="server" class="btn btn-default btn-lg" Text="Users" OnClick="user_Click" />
            </a></li>
        <li><a href="#">
            <asp:Button ID="product" runat="server" class="btn btn-default btn-lg" Text="Products" OnClick="product_Click" />
            </a></li>
         <li><a href="#">
            <asp:Button ID="customer" runat="server" class="btn btn-default btn-lg" Text="Customers" OnClick="customer_Click" />
            </a></li>

        <li><a href="#">
            <asp:Button ID="contract" runat="server" class="btn btn-default btn-lg" Text="Contracts" OnClick="contract_Click" />
            </a></li>

        <li class="active"><a href="#">
            <asp:Button ID="report" runat="server" class="btn btn-success btn-lg" OnClick="report_Click" Text="Reports" />
            </a></li> 


    </ul>
       
      </nav>


 </div>
        <br />


            <asp:TextBox ID="fromDate" runat="server"></asp:TextBox>
            <asp:Button ID="calend1" runat="server" Width="27px" OnClick="calend1_Click" />
        <asp:TextBox ID="toDate" runat="server"></asp:TextBox>
        <asp:Button ID="calen2" runat="server" Width="28px" OnClick="calen2_Click" />
        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Confirm" OnClick="Button1_Click" />
        <div>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px" BorderWidth="1px">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar2_SelectionChanged" BorderWidth="1px">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
            </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" SizeToReportContent="True" OnDrillthrough="ReportViewer1_Drillthrough">
            <LocalReport ReportPath="Report1.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="CRM_System_Demo.CRMBaseDataSetTableAdapters._operations_productTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="operation_date" Type="DateTime" />
                <asp:Parameter Name="operation_type" Type="String" />
                <asp:Parameter Name="operation_price" Type="Decimal" />
                <asp:Parameter Name="id_user" Type="Int32" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="id_contract" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="operation_date" Type="DateTime" />
                <asp:Parameter Name="operation_type" Type="String" />
                <asp:Parameter Name="operation_price" Type="Decimal" />
                <asp:Parameter Name="id_user" Type="Int32" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="id_contract" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
