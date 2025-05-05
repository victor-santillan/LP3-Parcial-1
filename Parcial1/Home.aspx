<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Parcial1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Gestión de usuarios:<br />
            <br />
            -
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Cliente_Alta.aspx">Alta de Clientes</asp:HyperLink>
            <br />
            -
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Cliente_Modificacion.aspx">Modificación de Clientes</asp:HyperLink>
            <br />
            -
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Cliente_Baja.aspx">Baja de Clientes</asp:HyperLink>
            <br />
            -
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Cliente_Consulta.aspx">Consulta de Clientes</asp:HyperLink>
            <br />
            <br />
            Gestión de actividades:<br />
            <br />
            -
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Actividad_Alta.aspx">Alta de Actividades</asp:HyperLink>
            <br />
            - <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Actividad_Consulta.aspx">Consulta de Actividades</asp:HyperLink>
            <br />
            <br />
            Gestión de planes:<br />
            <br />
            -
            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Plan_Alta.aspx">Alta de Planes</asp:HyperLink>
            <br />
            - <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Plan_Consulta.aspx">Consulta de Planes</asp:HyperLink>
        </div>
    </form>
</body>
</html>
