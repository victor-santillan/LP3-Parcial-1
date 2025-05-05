<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Plan_Consulta.aspx.cs" Inherits="Parcial1.Plan_Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Consulta de Planes<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_plan" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id_plan" HeaderText="id_plan" InsertVisible="False" ReadOnly="True" SortExpression="id_plan" />
                    <asp:BoundField DataField="nombre_plan" HeaderText="nombre_plan" SortExpression="nombre_plan" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="precio_mensual" HeaderText="precio_mensual" SortExpression="precio_mensual" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LP3-Parcial-1ConnectionString %>" SelectCommand="SELECT * FROM [planes]"></asp:SqlDataSource>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
