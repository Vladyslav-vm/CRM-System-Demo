<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="CRM_System_Demo.users" %>

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
            <asp:Button ID="logOut" runat="server" Height="31px" OnClick="logOut_Click" Text="Log out" Width="61px" />
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
              <asp:Button ID="home" runat="server" class="btn btn-default btn-lg" Text="Home" OnClick="main_Click" />
              </a></li>

          <li class="active"><a href="#">
              <asp:Button ID="Button1" runat="server" class="btn btn-success btn-lg" OnClick="user_Click" Text="Users" />
              </a></li>

        <li><a href="#">
          <asp:Button ID="product" runat="server" class="btn btn-default btn-lg" Text="Products" OnClick="product_Click" />
          </a></li> 
      <li><a href="#">
          <asp:Button ID="Button2" runat="server" class="btn btn-default btn-lg" Text="Customers" OnClick="customer_Click" />
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

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="2px" Height="209px" Width="481px" RowStyle-CssClass="Row" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name_and_surname" HeaderText="Name and surname" SortExpression="name_and_surname" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" CssClass="Header"/>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

               <br />
        <br />

        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" Height="50px" Width="378px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name_and_surname" HeaderText="Name and surname" SortExpression="name_and_surname" />
                <asp:BoundField DataField="login" HeaderText="Login" SortExpression="login" />
                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" InsertText="Insert" NewText="Create" SelectText="Select" UpdateText="Update" >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:DetailsView>
               </center>

    

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name_and_surname] FROM [_user] ORDER BY [id]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_user] WHERE [id] = @id" InsertCommand="INSERT INTO [_user] ([name_and_surname], [login], [password]) VALUES (@name_and_surname, @login, @password)" SelectCommand="SELECT * FROM [_user] WHERE ([id] = @id)" UpdateCommand="UPDATE [_user] SET [name_and_surname] = @name_and_surname, [login] = @login, [password] = @password WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name_and_surname" Type="String" />
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name_and_surname" Type="String" />
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <br />
        <br />
    </form>


     <br />
        <br />
    <br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br /><br />
        <br />
    <footer>
	
            <img src="LogoMakr.png" alt="deleted" title="company logo" align="right" width="250"/>
	
</footer>

</body>
</html>
