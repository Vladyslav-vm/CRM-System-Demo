<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="CRM_System_Demo.customers" %>

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
                <asp:BoundField DataField="company" HeaderText="company" SortExpression="company" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="phonenumber" HeaderText="phonenumber" SortExpression="phonenumber" />
                <asp:BoundField DataField="edrpou" HeaderText="edrpou" SortExpression="edrpou" />
                <asp:BoundField DataField="inn" HeaderText="inn" SortExpression="inn" />
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
                <asp:BoundField DataField="company" HeaderText="company" SortExpression="company" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="phonenumber" HeaderText="phonenumber" SortExpression="phonenumber" />
                <asp:BoundField DataField="edrpou" HeaderText="edrpou" SortExpression="edrpou" />
                <asp:BoundField DataField="inn" HeaderText="inn" SortExpression="inn" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_customer] WHERE [id] = @original_id AND [company] = @original_company AND [address] = @original_address AND [phonenumber] = @original_phonenumber AND [edrpou] = @original_edrpou AND [inn] = @original_inn" InsertCommand="INSERT INTO [_customer] ([company], [address], [phonenumber], [edrpou], [inn]) VALUES (@company, @address, @phonenumber, @edrpou, @inn)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [_customer] ORDER BY [id]" UpdateCommand="UPDATE [_customer] SET [company] = @company, [address] = @address, [phonenumber] = @phonenumber, [edrpou] = @edrpou, [inn] = @inn WHERE [id] = @original_id AND [company] = @original_company AND [address] = @original_address AND [phonenumber] = @original_phonenumber AND [edrpou] = @original_edrpou AND [inn] = @original_inn">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_company" Type="String" />
                <asp:Parameter Name="original_address" Type="String" />
                <asp:Parameter Name="original_phonenumber" Type="Int32" />
                <asp:Parameter Name="original_edrpou" Type="Int32" />
                <asp:Parameter Name="original_inn" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phonenumber" Type="Int32" />
                <asp:Parameter Name="edrpou" Type="Int32" />
                <asp:Parameter Name="inn" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phonenumber" Type="Int32" />
                <asp:Parameter Name="edrpou" Type="Int32" />
                <asp:Parameter Name="inn" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_company" Type="String" />
                <asp:Parameter Name="original_address" Type="String" />
                <asp:Parameter Name="original_phonenumber" Type="Int32" />
                <asp:Parameter Name="original_edrpou" Type="Int32" />
                <asp:Parameter Name="original_inn" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
