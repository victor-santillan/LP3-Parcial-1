<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Actividad_Alta.aspx.cs" Inherits="Parcial1.Actividad_Alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Creación de Actividad<br />
            <br />
            Nombre de la actividad:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Descripción:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Días de la semana:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Horario (usar formato HH:MM):
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Plan asociado:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ddlPlanesCliente" DataTextField="nombre_plan" DataValueField="id_plan">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ddlPlanesCliente" runat="server" ConnectionString="<%$ ConnectionStrings:LP3-Parcial-1ConnectionString %>" SelectCommand="SELECT * FROM [planes]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Crear" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
        </div>
    </form>
</body>
</html>
