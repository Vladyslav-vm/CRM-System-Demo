<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CRM_System_Demo.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <script src="jquery-3.0.0.min.js"></script>

<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        form {
       
            width: 300px;
            margin: 100px auto;
            border: 1px solid grey;
            padding: 20px;
            
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="form-group">
    
        <h2 align="center">CRM System</h2>
         </div>
         <div class="form-group">
            <asp:Label for="TextBox1" runat="server">Username</asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" input type="username" class="form-control" placeholder="Enter username"></asp:TextBox>
            </div>
        <div class="form-group">
        <asp:Label for="TextBox2" runat="server">Password</asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server" input type="password" class="form-control" placeholder="Enter password"></asp:TextBox>
            </div>
         <div class="form-group">
         <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-default" Text="Sign in" OnClick="Button1_Click"/>
         <asp:Label for="Button1" runat="server" ID="Label3"></asp:Label>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" SelectCommand="SELECT [id] FROM [_user] WHERE (([login] = @login) AND ([password] = @password))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="login" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>


</html>
        


