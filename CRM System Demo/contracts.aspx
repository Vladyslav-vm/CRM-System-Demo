<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contracts.aspx.cs" Inherits="CRM_System_Demo.contracts" %>

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

table, .table {
        
            width: 700px;
            margin: 20px auto;
            background-color: #FEFCFF;
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
      <a class="navbar-brand" href="index.aspx">CRM System</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="index.aspx">Home</a></></li>
      <li><a href="users.aspx">Users</a></></li>
      <li><a href="products.aspx">Products</a></li>
      <li><a href="customers.aspx">Customers</a></li>
       <li class="active"><a href="contracts.aspx">Contracts</a></li>
       <li><a href="reports.aspx">Reports</a></li>
         
    </ul>
    <ul class="nav navbar-nav navbar-right">
      
          
      <li><a href="LoginPage.aspx"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>





 
        <br />

        
          <center>

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table-hover" >
            
            
            <Columns>
                
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="contract_type" HeaderText="Contract type" SortExpression="contract_type" />
                <asp:BoundField DataField="date_conclusion" HeaderText="Date conclusion" SortExpression="date_conclusion" DataFormatString="{0:dd.MM.yyyy}"/>
                <asp:BoundField DataField="total_price" HeaderText="Total price" SortExpression="total_price" />
                <asp:BoundField DataField="contract_balance" HeaderText="Contract balance" SortExpression="contract_balance" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" ControlStyle-CssClass="btn-primary" ItemStyle-Width="38px">
                
                </asp:CommandField>
            </Columns>
           
        </asp:GridView>

               <br />
        <br />

             

        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" BackColor="White" CssClass="table-hover">
            
            
            
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date_conclusion" HeaderText="Date conclusion" SortExpression="date_conclusion" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="total_price" HeaderText="Total price" SortExpression="total_price" />
                <asp:BoundField DataField="contract_balance" HeaderText="Contract balance" SortExpression="contract_balance" />
                <asp:BoundField DataField="date_end" HeaderText="Date end" SortExpression="date_end" DataFormatString="{0:dd.MM.yyyy}"/>
                <asp:BoundField DataField="id_customer" HeaderText="Id customer" SortExpression="id_customer" />
                <asp:BoundField DataField="contract_type" HeaderText="Contract type" SortExpression="contract_type" />
                <asp:BoundField DataField="id_product" HeaderText="Id product" SortExpression="id_product" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" ControlStyle-CssClass="btn-group btn btn-primary">
                
                </asp:CommandField>
            </Fields>
                
             
        </asp:DetailsView>
        
                 </center>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [date_conclusion], [total_price], [contract_balance], [contract_type] FROM [_contract] ORDER BY [id]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_contract] WHERE [id] = @id" InsertCommand="INSERT INTO [_contract] ([date_conclusion], [total_price], [contract_balance], [date_end], [id_customer], [contract_type], [id_product]) VALUES (@date_conclusion, @total_price, @contract_balance, @date_end, @id_customer, @contract_type, @id_product)" SelectCommand="SELECT * FROM [_contract] WHERE ([id] = @id)" UpdateCommand="UPDATE [_contract] SET [date_conclusion] = @date_conclusion, [total_price] = @total_price, [contract_balance] = @contract_balance, [date_end] = @date_end, [id_customer] = @id_customer, [contract_type] = @contract_type, [id_product] = @id_product WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="date_conclusion" />
                <asp:Parameter Name="total_price" Type="Decimal" />
                <asp:Parameter Name="contract_balance" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="date_end" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="contract_type" Type="String" />
                <asp:Parameter Name="id_product" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="date_conclusion" />
                <asp:Parameter Name="total_price" Type="Decimal" />
                <asp:Parameter Name="contract_balance" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="date_end" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="contract_type" Type="String" />
                <asp:Parameter Name="id_product" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource><br />
        <br />
    </form>

     
        <br />
        <br />
    <footer>
	
            <img src="LogoMakr.png" alt="deleted" title="company logo" align="right" width="250"/>
	
</footer>

    </div>
</body>
</html>
