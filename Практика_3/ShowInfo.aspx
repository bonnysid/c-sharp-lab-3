<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowInfo.aspx.cs" Inherits="Практика_3.ShowInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                <asp:BoundField DataField="YearOfBirth" HeaderText="Год рождения" SortExpression="YearOfBirth" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        <asp:Panel ID="Panel2" runat="server">
            Имя заказчика<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            Фамилия заказчика
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            Год рождения
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </asp:Panel>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Title" HeaderText="Название товара" SortExpression="Title" />
                <asp:BoundField DataField="idCust" HeaderText="Номер заказчика" ReadOnly="True" SortExpression="idCust" />
                <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                <asp:BoundField DataField="Quant" HeaderText="Количество" SortExpression="Quant" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" DeleteCommand="Delete from Orders where Id = @Id" InsertCommand="Insert into Orders (Title, idCust, Price, Quant) values (@Title, @idCust, @Price, @Quant)" SelectCommand="SELECT * FROM [Orders] WHERE ([idCust] = @idCust)" UpdateCommand="Update Orders set Title = @Title, idCust = @idCust, Price = @Price, Quant = @Quant where Id = @Id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                <asp:ControlParameter ControlID="GridView1" Name="idCust" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox3" Name="Quant" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="idCust" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GridView2" Name="Title" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" Name="idCust" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView2" Name="Price" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView2" Name="Quant" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Добавить заказ" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Редактировать заказы" />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Удалить заказ" />
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            Название товара:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            Цена:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            Количество:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Добавить" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Отменить" />
        </asp:Panel>
    </form>
</body>
</html>
