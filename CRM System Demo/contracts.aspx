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
              <li class="active"><a href="#">
                <asp:Button ID="contract" runat="server" class="btn btn-success btn-lg" Text="Contracts" OnClick="contract_Click" />
                </a></li>
            
              <li><a href="#">
                <asp:Button ID="report" runat="server" class="btn btn-default btn-lg" OnClick="report_Click" Text="Reports" />
                </a></li>
                
                 </ul> 
      </nav>


 </div>
        <br />

        
          <center>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AllowSorting="True" Width="590px" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="2px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            
            <Columns>
                
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" FooterStyle-HorizontalAlign="Center" FooterStyle-VerticalAlign="Middle" />
                <asp:BoundField DataField="contract_type" HeaderText="Contract type" SortExpression="contract_type" />
                <asp:BoundField DataField="date_conclusion" HeaderText="Date conclusion" SortExpression="date_conclusion" DataFormatString="{0:dd.MM.yyyy}"/>
                <asp:BoundField DataField="total_price" HeaderText="Total price" SortExpression="total_price" />
                <asp:BoundField DataField="contract_balance" HeaderText="Contract balance" SortExpression="contract_balance" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle CssClass="btn btn-primary" />
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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

             

        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" Height="50px" Width="382px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="2px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            
            
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date_conclusion" HeaderText="Date conclusion" SortExpression="date_conclusion" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="total_price" HeaderText="Total price" SortExpression="total_price" />
                <asp:BoundField DataField="contract_balance" HeaderText="Contract balance" SortExpression="contract_balance" />
                <asp:BoundField DataField="date_end" HeaderText="Date end" SortExpression="date_end" DataFormatString="{0:dd.MM.yyyy}"/>
                <asp:BoundField DataField="id_customer" HeaderText="Id customer" SortExpression="id_customer" />
                <asp:BoundField DataField="contract_type" HeaderText="Contract type" SortExpression="contract_type" />
                <asp:BoundField DataField="id_product" HeaderText="Id product" SortExpression="id_product" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
            </Fields>
                
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" /> 
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


</body>
</html>
