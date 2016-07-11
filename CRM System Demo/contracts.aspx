<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contracts.aspx.cs" Inherits="CRM_System_Demo.contracts" %>

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
        <asp:Button ID="report" runat="server" OnClick="report_Click" Text="Reports" />
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="contract_type" HeaderText="contract_type" SortExpression="contract_type" />
                <asp:BoundField DataField="date_conclusion" HeaderText="date_conclusion" SortExpression="date_conclusion" DataFormatString="{0:dd.MM.yyyy}"/>
                <asp:BoundField DataField="total_price" HeaderText="total_price" SortExpression="total_price" />
                <asp:BoundField DataField="contract_balance" HeaderText="contract_balance" SortExpression="contract_balance" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="125px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="date_conclusion" HeaderText="date_conclusion" SortExpression="date_conclusion" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="total_price" HeaderText="total_price" SortExpression="total_price" />
                <asp:BoundField DataField="contract_balance" HeaderText="contract_balance" SortExpression="contract_balance" />
                <asp:BoundField DataField="date_end" HeaderText="date_end" SortExpression="date_end" DataFormatString="{0:dd.MM.yyyy}"/>
                <asp:BoundField DataField="id_customer" HeaderText="id_customer" SortExpression="id_customer" />
                <asp:BoundField DataField="contract_type" HeaderText="contract_type" SortExpression="contract_type" />
                <asp:BoundField DataField="id_product" HeaderText="id_product" SortExpression="id_product" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" /> 
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
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
        </asp:SqlDataSource>
    </form>
</body>
</html>
