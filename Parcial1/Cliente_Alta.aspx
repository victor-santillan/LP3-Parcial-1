<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente_Alta.aspx.cs" Inherits="Parcial1.Cliente_Alta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Creación de Cliente<br />
            <br />
            DNI:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Nombre:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Apellido:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Teléfono:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Dirección: <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            Plan contratado:
            <asp:DropDownList ID="ddlPlanesCliente" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre_plan" DataValueField="id_plan">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LP3-Parcial-1ConnectionString %>" SelectCommand="SELECT * FROM [planes]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Crear" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
