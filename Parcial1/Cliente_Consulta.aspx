<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente_Consulta.aspx.cs" Inherits="Parcial1.Cliente_Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta de Clientes</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Consulta de Clientes<br />
            <br />

            <asp:SqlDataSource
                ID="SqlDataSourceConsultaClientes"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:LP3-Parcial-1ConnectionString %>"
                ProviderName="System.Data.SqlClient"
                SelectCommand="SELECT a.id_actividad, a.nombre_actividad, a.descripcion, a.dias, FORMAT(a.horario, N'hh\:mm') AS horario_formateado, p.nombre_plan FROM Actividades a LEFT JOIN Planes p ON a.id_plan = p.id_plan ORDER BY a.nombre_actividad">
            </asp:SqlDataSource>

            <asp:GridView 
                ID="GridView1" 
                runat="server"
                DataSourceID="SqlDataSourceConsultaClientes"
                AutoGenerateColumns="False"
                DataKeyNames="dni"
                CssClass="table table-striped table-bordered"
                AllowPaging="True" 
                PageSize="10"
                AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="dni" HeaderText="DNI" ReadOnly="True" SortExpression="dni" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="telefono" HeaderText="Teléfono" SortExpression="telefono" />
                    <asp:BoundField DataField="direccion" HeaderText="Dirección" SortExpression="direccion" />
                    <asp:BoundField DataField="nombre_plan" HeaderText="Plan" SortExpression="nombre_plan" />
                </Columns>
                <EmptyDataTemplate>
                    No hay clientes registrados para mostrar.
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
        </div>
    </form>
</body>
</html>