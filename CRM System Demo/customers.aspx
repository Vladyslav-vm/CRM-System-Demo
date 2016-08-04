<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="CRM_System_Demo.customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <title></title>
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
      <li class="active"><a href="customers.aspx">Customers</a></li>
       <li><a href="contracts.aspx">Contracts</a></li>
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
                <asp:BoundField DataField="company" HeaderText="Company" SortExpression="company" />
                <asp:BoundField DataField="edrpou" HeaderText="EDRPOU" SortExpression="edrpou" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" ControlStyle-CssClass="btn-primary" ItemStyle-Width="38px">
                
                </asp:CommandField>
            </Columns>
           
        </asp:GridView>
              
              <br />
        <br />

             

        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" CssClass="table-hover">
            
            <Fields>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="company" HeaderText="Company" SortExpression="company" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="phonenumber" HeaderText="Phone number" SortExpression="phonenumber" />
                <asp:BoundField DataField="edrpou" HeaderText="EDRPOU" SortExpression="edrpou" />
                <asp:BoundField DataField="inn" HeaderText="INN" SortExpression="inn" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" ControlStyle-CssClass="btn-group btn btn-primary">
               
                </asp:CommandField>
            </Fields>
            
        </asp:DetailsView>

              
              </center>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [company], [edrpou] FROM [_customer] ORDER BY [id]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_customer] WHERE [id] = @id" InsertCommand="INSERT INTO [_customer] ([company], [address], [phonenumber], [edrpou], [inn]) VALUES (@company, @address, @phonenumber, @edrpou, @inn)" SelectCommand="SELECT * FROM [_customer] WHERE ([id] = @id)" UpdateCommand="UPDATE [_customer] SET [company] = @company, [address] = @address, [phonenumber] = @phonenumber, [edrpou] = @edrpou, [inn] = @inn WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phonenumber" Type="Int32" />
                <asp:Parameter Name="edrpou" Type="Int32" />
                <asp:Parameter Name="inn" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phonenumber" Type="Int32" />
                <asp:Parameter Name="edrpou" Type="Int32" />
                <asp:Parameter Name="inn" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <br />
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
