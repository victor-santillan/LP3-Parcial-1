<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Actividad_Consulta.aspx.cs" Inherits="Parcial1.Actividad_Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Consulta de Actividades<br />
            <br />

            <asp:SqlDataSource
                ID="SqlDataSourcePlanesFiltro"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:LP3-Parcial-1ConnectionString %>"
                ProviderName="System.Data.SqlClient"
                SelectCommand="SELECT a.id_actividad, a.nombre_actividad, a.descripcion, a.dias, FORMAT(a.horario, N'hh\:mm') AS horario_formateado, p.nombre_plan FROM Actividades a LEFT JOIN Planes p ON a.id_plan = p.id_plan ORDER BY a.nombre_actividad">
            </asp:SqlDataSource>

            <asp:GridView 
                ID="gvActividades" 
                runat="server"
                DataSourceID="SqlDataSourcePlanesFiltro"
                AutoGenerateColumns="False"
                DataKeyNames="id_actividad"
                CssClass="table table-striped table-bordered"
                AllowPaging="True"
                AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="nombre_actividad" HeaderText="Actividad" SortExpression="nombre_actividad" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="dias" HeaderText="Días" SortExpression="dias"/>
                    <asp:BoundField DataField="horario_formateado" HeaderText="Horario" />
                    <asp:BoundField DataField="nombre_plan" HeaderText="Plan Asociado" SortExpression="nombre_plan"/>
                </Columns>
                <EmptyDataTemplate>
                    No hay actividades registradas para mostrar (o que coincidan con el filtro).
                </EmptyDataTemplate>
            </asp:GridView>

            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
