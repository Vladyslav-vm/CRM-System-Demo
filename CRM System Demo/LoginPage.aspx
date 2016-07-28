<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CRM_System_Demo.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <script src="jquery-3.0.0.min.js"></script>

<head runat="server">
    <title></title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style>



        .page-header {

        background-color: #f4511e;
    color: #fff;
    padding: 50px 25px;
        
         border-radius: 10px
        }

        form {
       
            width: 300px;
            margin: 100px auto;
            border: 2px black;
            padding: 20px;
        background-color: #f4511e;
             color: #fff;
        border-radius: 10px
        }

       

        footer {
    
  	background: #f4511e;
  	color: #fff;
  	font-size: 11px;
       padding: 25px 0;
        height: 100px;
         border-radius: 10px;

position: [I]justfily[/I];
bottom: 1em;
right: 1em;
text-align: right;
        }

  	.container {			
		height: 110px;
		padding: 25px 0;
        background-color: #fff
	}
}


    </style>
</head>
<body background="background2.png">

    <div class="container-fluid">

    
    <header class="page-header">
        
        <h1 align="center">CRM System Inc</h1>
        <h3 align="center">Thank You for using our Software</h3>
    </header>
  
        <form id="form1" runat="server">
            <div class="form-group rounded">
    
        <h5 align="left">If you have already registered at CRM System then sign in here</h5>
         </div>
         <div class="form-group" align="left">
            <asp:Label for="TextBox1" runat="server">Username</asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" input type="username" class="form-control" placeholder="Enter username"></asp:TextBox>
            </div>
        <div class="form-group" align="left">
        <asp:Label for="TextBox2" runat="server">Password</asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server" input type="password" class="form-control" placeholder="Enter password"></asp:TextBox>
            </div>
         <div class="form-group">
         <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-default" Text="Sign in" OnClick="Button1_Click"/>
         <asp:Label for="Button1" runat="server" ID="Label3"></asp:Label>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" SelectCommand="SELECT [name_and_surname] FROM [_user] WHERE (([login] = @login) AND ([password] = @password))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="login" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </form>

   



         <br />
         <br />
        <br />
         <br />
        <br />
         <br />
        <br />
         <br />
    

    <footer>
	
		
            <h3>Information about our software</h3>
	<p>
We are dynamically developing software company. Our mission is to make dreams come true with the help of our software. 
	</p>
		
</footer>

    </div>

</html>
        


