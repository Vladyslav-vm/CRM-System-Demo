<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CRM_System_Demo.WebForm1" %>

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
      <li class="active"><a href="#">
            
       
            <asp:Button ID="home" runat="server" class="btn btn-default btn-lg"  Text="Home" OnClick="main_Click" />
  
            </a></li>
      <li><a href="#">
          <asp:Button ID="user" runat="server" class="btn btn-default btn-lg" Text="Users" OnClick="user_Click" />
          </a></li>
      <li><a href="#">
          <asp:Button ID="product" runat="server" class="btn btn-default btn-lg" Text="Products" OnClick="product_Click" />
          </a></li> 
      <li><a href="#">
          <asp:Button ID="Button1" runat="server" class="btn btn-default btn-lg" Text="Customers" OnClick="customer_Click" />
          </a></li>

        <li><a href="#">
           <asp:Button ID="contract" runat="server" class="btn btn-default btn-lg" Text="Contracts" OnClick="contract_Click" />
            </a></li>

        <li><a href="#">
            <asp:Button ID="report" runat="server" class="btn btn-default btn-lg" Text="Reports" />
            </a></li>
      
         </ul>
       
      </nav>


 </div>
        <br />

        
          <center>
              
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" CellPadding="3"  Width="720px" CssClass="table-condensed">
                <AlternatingRowStyle/>
            <Columns>
                <asp:BoundField DataField="id" HeaderText="№" InsertVisible="False" ReadOnly="True" SortExpression="id" >
                <ControlStyle/>
                </asp:BoundField>
                <asp:BoundField DataField="operation_date" HeaderText="Date of creation" SortExpression="operation_date" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="operation_type" HeaderText="Operation type" SortExpression="operation_type" />
                <asp:BoundField DataField="operation_price" HeaderText="Operation price" SortExpression="operation_price" />
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle/>
                </asp:CommandField>
            </Columns>
       
        </asp:GridView>
           
              <br />
        <br />

             
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" Height="50px" Width="357px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="№" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="operation_date" HeaderText="Operation date" SortExpression="operation_date"  DataFormatString="{0:dd.MM.yyyy}"/>
                <asp:BoundField DataField="operation_type" HeaderText="Operation type" SortExpression="operation_type" />
                <asp:BoundField DataField="operation_price" HeaderText="Operation price" SortExpression="operation_price" />
                <asp:BoundField DataField="id_user" HeaderText="Id user" SortExpression="id_user" />
                <asp:BoundField DataField="id_customer" HeaderText="Id customer" SortExpression="id_customer" />
                <asp:BoundField DataField="id_contract" HeaderText="Id contract" SortExpression="id_contract" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle CssClass="btn btn-primary" />
                <ItemStyle BackColor="White" />
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:DetailsView>
                   


              </center>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_operations_product] WHERE [id] = @id" InsertCommand="INSERT INTO [_operations_product] ([operation_date], [operation_type], [operation_price], [id_user], [id_customer], [id_contract]) VALUES (@operation_date, @operation_type, @operation_price, @id_user, @id_customer, @id_contract)" SelectCommand="SELECT * FROM [_operations_product] WHERE ([id] = @id)" UpdateCommand="UPDATE [_operations_product] SET [operation_date] = @operation_date, [operation_type] = @operation_type, [operation_price] = @operation_price, [id_user] = @id_user, [id_customer] = @id_customer, [id_contract] = @id_contract WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="operation_date" />
                <asp:Parameter Name="operation_type" Type="String" />
                <asp:Parameter Name="operation_price" Type="Decimal" />
                <asp:Parameter Name="id_user" Type="Int32" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="id_contract" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="operation_date" />
                <asp:Parameter Name="operation_type" Type="String" />
                <asp:Parameter Name="operation_price" Type="Decimal" />
                <asp:Parameter Name="id_user" Type="Int32" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="id_contract" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [_operations_product] ORDER BY [operation_date]">
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
