<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="CRM_System_Demo.products" %>

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
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="price_buy" HeaderText="price_buy" SortExpression="price_buy" />
                <asp:BoundField DataField="price_sell" HeaderText="price_sell" SortExpression="price_sell" />
                <asp:BoundField DataField="date_add" HeaderText="date_add" SortExpression="date_add" />
                <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
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
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="price_buy" HeaderText="price_buy" SortExpression="price_buy" />
                <asp:BoundField DataField="price_sell" HeaderText="price_sell" SortExpression="price_sell" />
                <asp:BoundField DataField="date_add" HeaderText="date_add" SortExpression="date_add" />
                <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_product] WHERE [id] = @original_id AND [name] = @original_name AND [price_buy] = @original_price_buy AND [price_sell] = @original_price_sell AND [date_add] = @original_date_add AND [id_user] = @original_id_user" InsertCommand="INSERT INTO [_product] ([name], [price_buy], [price_sell], [date_add], [id_user]) VALUES (@name, @price_buy, @price_sell, @date_add, @id_user)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [_product] ORDER BY [id]" UpdateCommand="UPDATE [_product] SET [name] = @name, [price_buy] = @price_buy, [price_sell] = @price_sell, [date_add] = @date_add, [id_user] = @id_user WHERE [id] = @original_id AND [name] = @original_name AND [price_buy] = @original_price_buy AND [price_sell] = @original_price_sell AND [date_add] = @original_date_add AND [id_user] = @original_id_user">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_price_buy" Type="Decimal" />
                <asp:Parameter Name="original_price_sell" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="original_date_add" />
                <asp:Parameter Name="original_id_user" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price_buy" Type="Decimal" />
                <asp:Parameter Name="price_sell" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="date_add" />
                <asp:Parameter Name="id_user" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="price_buy" Type="Decimal" />
                <asp:Parameter Name="price_sell" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="date_add" />
                <asp:Parameter Name="id_user" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_price_buy" Type="Decimal" />
                <asp:Parameter Name="original_price_sell" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="original_date_add" />
                <asp:Parameter Name="original_id_user" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
