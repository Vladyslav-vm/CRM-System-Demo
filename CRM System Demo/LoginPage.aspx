<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CRM_System_Demo.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <script src="jquery-3.0.0.min.js"></script>

<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <h1 class="auto-style2">CRM System</h1>
        <br />
        <asp:Label ID="Label1" runat="server" Text="User name"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
        <br />
    <asp:Label ID="Label3" runat="server" text="Sign in" style="text-align: center"></asp:Label>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseServer %>" SelectCommand="SELECT [id] FROM [_user] WHERE (([login] = @login) AND ([password] = @password))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="login" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
        


