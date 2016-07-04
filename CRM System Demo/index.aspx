<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CRM_System_Demo.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseServer %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [_operations_product]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="operation_date" HeaderText="operation_date" SortExpression="operation_date" />
                <asp:BoundField DataField="operation_type" HeaderText="operation_type" SortExpression="operation_type" />
                <asp:BoundField DataField="operation_price" HeaderText="operation_price" SortExpression="operation_price" />
                <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
                <asp:BoundField DataField="id_customer" HeaderText="id_customer" SortExpression="id_customer" />
                <asp:BoundField DataField="id_contract" HeaderText="id_contract" SortExpression="id_contract" />
            </Columns>
        </asp:GridView>
    </form>
    </body>
</html>
