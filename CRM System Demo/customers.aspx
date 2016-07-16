<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="CRM_System_Demo.customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <div class="col-md-2">
            <asp:Button ID="main" runat="server" class="btn btn-default btn-lg btn-block" Text="Main" OnClick="main_Click" />
        </div>

        <div class="col-md-2">
            <asp:Button ID="user" runat="server" class="btn btn-default btn-lg btn-block" Text="Users" OnClick="user_Click" />
         </div>

        <div class="col-md-2">
            <asp:Button ID="product" runat="server" class="btn btn-default btn-lg btn-block" Text="Products" OnClick="product_Click" />
         </div>

        <div class="col-md-2">
            <asp:Button ID="customer" runat="server" class="btn btn-default btn-lg btn-block" Text="Customers" OnClick="customer_Click" />
         </div>

        <div class="col-md-2">
            <asp:Button ID="contract" runat="server" class="btn btn-default btn-lg btn-block" Text="Contracts" OnClick="contract_Click" />
         </div>

        <div class="col-md-2">
            <asp:Button ID="report" runat="server" class="btn btn-default btn-lg btn-block" OnClick="report_Click" Text="Reports" />
            <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="logOut" runat="server" Height="31px" OnClick="logOut_Click" Text="Log out" Width="61px" />
         </div>
     </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="company" HeaderText="company" SortExpression="company" />
                <asp:BoundField DataField="edrpou" HeaderText="edrpou" SortExpression="edrpou" />
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
                <asp:BoundField DataField="company" HeaderText="company" SortExpression="company" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="phonenumber" HeaderText="phonenumber" SortExpression="phonenumber" />
                <asp:BoundField DataField="edrpou" HeaderText="edrpou" SortExpression="edrpou" />
                <asp:BoundField DataField="inn" HeaderText="inn" SortExpression="inn" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [company], [edrpou] FROM [_customer] ORDER BY [id]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CRMBaseConnectionString %>" DeleteCommand="DELETE FROM [_customer] WHERE [id] = @id" InsertCommand="INSERT INTO [_customer] ([company], [address], [phonenumber], [edrpou], [inn]) VALUES (@company, @address, @phonenumber, @edrpou, @inn)" SelectCommand="SELECT * FROM [_customer] WHERE ([id] = @id)" UpdateCommand="UPDATE [_customer] SET [company] = @company, [address] = @address, [phonenumber] = @phonenumber, [edrpou] = @edrpou, [inn] = @inn WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phonenumber" Type="Int32" />
                <asp:Parameter Name="edrpou" Type="Int32" />
                <asp:Parameter Name="inn" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phonenumber" Type="Int32" />
                <asp:Parameter Name="edrpou" Type="Int32" />
                <asp:Parameter Name="inn" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
