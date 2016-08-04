<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="CRM_System_Demo.products" %>

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
      <li class="active"><a href="products.aspx">Products</a></li>
      <li><a href="customers.aspx">Customers</a></li>
       <li><a href="contracts.aspx">Contracts</a></li>
       <li><a href="reports.aspx">Reports</a></li>
         
    </ul>
    <ul class="nav navbar-nav navbar-right">
      
          
      <li><a href="LoginPage.aspx"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    </ul>
  </div>
</nav>


 </div>
        <br />

        
     <center>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table-hover" >
            
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="date_add" HeaderText="Date add" SortExpression="date_add" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" ControlStyle-CssClass="btn-primary" ItemStyle-Width="38px">
               
                </asp:CommandField>
            </Columns>
            
        </asp:GridView>
           <br />
        <br />

             
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource2" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" CssClass="table-hover">
            
            
            <Fields>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="price_buy" HeaderText="Price buy" SortExpression="price_buy" />
                <asp:BoundField DataField="price_sell" HeaderText="Price sell" SortExpression="price_sell" />
                <asp:BoundField DataField="date_add" HeaderText="Date add" SortExpression="date_add" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="id_user" HeaderText="Id user" SortExpression="id_user" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" ControlStyle-CssClass="btn-group btn btn-primary">
                
                </asp:CommandField>
            </Fields>
           
        </asp:DetailsView>

     </center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [date_add] FROM [_product] ORDER BY [id]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_product] WHERE [id] = @id" InsertCommand="INSERT INTO [_product] ([name], [price_buy], [price_sell], [date_add], [id_user]) VALUES (@name, @price_buy, @price_sell, @date_add, @id_user)" SelectCommand="SELECT * FROM [_product] WHERE ([id] = @id)" UpdateCommand="UPDATE [_product] SET [name] = @name, [price_buy] = @price_buy, [price_sell] = @price_sell, [date_add] = @date_add, [id_user] = @id_user WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price_buy" Type="Decimal" />
                <asp:Parameter Name="price_sell" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="date_add" />
                <asp:Parameter Name="id_user" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price_buy" Type="Decimal" />
                <asp:Parameter Name="price_sell" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="date_add" />
                <asp:Parameter Name="id_user" Type="Int32" />
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
</body>
</html>
