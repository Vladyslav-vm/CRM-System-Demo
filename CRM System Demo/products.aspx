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
                    <asp:Button ID="Button1" runat="server" BackColor="white" class="btn btn-default" Text="Log Out" OnClick="logOut_Click"  BorderColor="Black" BorderStyle="Solid" />
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
               <asp:Button ID="Button2" runat="server" class="btn btn-default btn-lg" Text="Home" OnClick="main_Click" />

               </a></li>
        <li><a href="#">
             <asp:Button ID="Button4" runat="server" class="btn btn-default btn-lg" Text="Users" OnClick="user_Click" />
             </a></li>

      <li class="active"><a href="#">
        <asp:Button ID="product" runat="server" class="btn btn-success btn-lg" Text="Products" OnClick="product_Click" />
          </a></li>
        
        <li><a href="#">
            <asp:Button ID="customer" runat="server" class="btn btn-default btn-lg" Text="Customers" OnClick="customer_Click" />
              </a></li>

        <li><a href="#">
            <asp:Button ID="contract" runat="server" class="btn btn-default btn-lg" Text="Contracts" OnClick="contract_Click" />
            </a></li>

        <li><a href="#">
            <asp:Button ID="report" runat="server" class="btn btn-default btn-lg" OnClick="report_Click" Text="Reports" />
         </a></li>

                < </ul>
       
      </nav>


 </div>
        <br />

        
     <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="2px" Width="429px" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="date_add" HeaderText="Date add" SortExpression="date_add" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
           <br />
        <br />

             
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" Height="50px" Width="316px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="price_buy" HeaderText="Price buy" SortExpression="price_buy" />
                <asp:BoundField DataField="price_sell" HeaderText="Price sell" SortExpression="price_sell" />
                <asp:BoundField DataField="date_add" HeaderText="Date add" SortExpression="date_add" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="id_user" HeaderText="Id user" SortExpression="id_user" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
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
