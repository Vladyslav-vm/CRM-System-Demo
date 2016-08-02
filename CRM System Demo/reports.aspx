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
    background-color: #E5E4E2;
}

  	.container {			
		height: 110px;
		padding: 10px 0;
        }



         .navbar-inverse {
    border-color: #2C3539;
         
}
.navbar-default .navbar-brand {
    color: #FFFFFF;
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
                    <strong>   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> </strong>
                         </p>
            

        <br />

        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CRM System</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="index.aspx">Home</a></li>
      <li><a href="users.aspx">Users</a></li>
      <li><a href="products.aspx">Products</a></li>
      <li><a href="customers.aspx">Customers</a></li>
       <li><a href="contracts.aspx">Contracts</a></li>
       <li class="active"><a href="reports.aspx">Reports</a></li>
         
    </ul>
    <ul class="nav navbar-nav navbar-right">
      
          
      <li><a href="LoginPage.aspx"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>



<br /><br />

 
        <br />


            <asp:TextBox ID="fromDate" runat="server"></asp:TextBox>
            <asp:Button ID="calend1" runat="server" OnClick="calend1_Click" CssClass="btn-primary" Text="Submit" Width="70px" />
        <asp:TextBox ID="toDate" runat="server"></asp:TextBox>
        <asp:Button ID="calen2" runat="server" OnClick="calen2_Click" CssClass="btn-primary" Text="Submit" Width="70px"/>
        
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

        <footer>
	
            <img src="LogoMakr.png" alt="deleted" title="company logo" align="right" width="250"/>
	
</footer>
        </div>

</body>
</html>
