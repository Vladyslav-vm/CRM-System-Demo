<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CRM_System_Demo.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <asp:Button ID="main" runat="server" Text="Main" OnClick="main_Click" />
        <asp:Button ID="user" runat="server" Text="Users" OnClick="user_Click" />
        <asp:Button ID="product" runat="server" Text="Products" OnClick="product_Click" />
        <asp:Button ID="customer" runat="server" Text="Customers" OnClick="customer_Click" />
        <asp:Button ID="contract" runat="server" Text="Contracts" OnClick="contract_Click" />
        </div>

        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="operation_date" HeaderText="operation_date" SortExpression="operation_date" />
                <asp:BoundField DataField="operation_type" HeaderText="operation_type" SortExpression="operation_type" />
                <asp:BoundField DataField="operation_price" HeaderText="operation_price" SortExpression="operation_price" />
                <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
                <asp:BoundField DataField="id_customer" HeaderText="id_customer" SortExpression="id_customer" />
                <asp:BoundField DataField="id_contract" HeaderText="id_contract" SortExpression="id_contract" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="operation_date" HeaderText="operation_date" SortExpression="operation_date" />
                <asp:BoundField DataField="operation_type" HeaderText="operation_type" SortExpression="operation_type" />
                <asp:BoundField DataField="operation_price" HeaderText="operation_price" SortExpression="operation_price" />
                <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
                <asp:BoundField DataField="id_customer" HeaderText="id_customer" SortExpression="id_customer" />
                <asp:BoundField DataField="id_contract" HeaderText="id_contract" SortExpression="id_contract" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [_operations_product] ORDER BY [operation_date]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [_operations_product] WHERE [id] = @original_id AND [operation_date] = @original_operation_date AND [operation_type] = @original_operation_type AND [operation_price] = @original_operation_price AND [id_user] = @original_id_user AND [id_customer] = @original_id_customer AND [id_contract] = @original_id_contract" InsertCommand="INSERT INTO [_operations_product] ([operation_date], [operation_type], [operation_price], [id_user], [id_customer], [id_contract]) VALUES (@operation_date, @operation_type, @operation_price, @id_user, @id_customer, @id_contract)" UpdateCommand="UPDATE [_operations_product] SET [operation_date] = @operation_date, [operation_type] = @operation_type, [operation_price] = @operation_price, [id_user] = @id_user, [id_customer] = @id_customer, [id_contract] = @id_contract WHERE [id] = @original_id AND [operation_date] = @original_operation_date AND [operation_type] = @original_operation_type AND [operation_price] = @original_operation_price AND [id_user] = @original_id_user AND [id_customer] = @original_id_customer AND [id_contract] = @original_id_contract">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_operation_date" />
                <asp:Parameter Name="original_operation_type" Type="String" />
                <asp:Parameter Name="original_operation_price" Type="Decimal" />
                <asp:Parameter Name="original_id_user" Type="Int32" />
                <asp:Parameter Name="original_id_customer" Type="Int32" />
                <asp:Parameter Name="original_id_contract" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="operation_date" />
                <asp:Parameter Name="operation_type" Type="String" />
                <asp:Parameter Name="operation_price" Type="Decimal" />
                <asp:Parameter Name="id_user" Type="Int32" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="id_contract" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="operation_date" />
                <asp:Parameter Name="operation_type" Type="String" />
                <asp:Parameter Name="operation_price" Type="Decimal" />
                <asp:Parameter Name="id_user" Type="Int32" />
                <asp:Parameter Name="id_customer" Type="Int32" />
                <asp:Parameter Name="id_contract" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_operation_date" />
                <asp:Parameter Name="original_operation_type" Type="String" />
                <asp:Parameter Name="original_operation_price" Type="Decimal" />
                <asp:Parameter Name="original_id_user" Type="Int32" />
                <asp:Parameter Name="original_id_customer" Type="Int32" />
                <asp:Parameter Name="original_id_contract" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </body>
</html>
