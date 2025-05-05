using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial1
{
    public partial class Cliente_Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlPlanesCliente.DataBind();
                // Añadimos un item inicial opcional
                ddlPlanesCliente.Items.Insert(0, new ListItem("Seleccione Plan", ""));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Obtener la cadena de conexión desde Web.config
            string s = ConfigurationManager.ConnectionStrings["LP3-Parcial-1ConnectionString"].ConnectionString;

            // Creamso la conexión
            SqlConnection conexion = new SqlConnection(s);

            // Iniciamos la conexión
            conexion.Open();

            // Armamos la consulta SQL
            string insertSql = "INSERT INTO Clientes (dni, nombre, apellido, telefono, direccion, id_plan) VALUES ('" +
                               this.TextBox1.Text + "','" +
                               this.TextBox2.Text + "','" +
                               this.TextBox3.Text + "','" +
                               this.TextBox4.Text + "','" +
                               this.TextBox5.Text + "'," +
                               this.ddlPlanesCliente.SelectedValue + ")";

            // Creamos el objeto comando
            SqlCommand comando = new SqlCommand(insertSql, conexion);

            // Ejecutamos el comando
            comando.ExecuteNonQuery();

            // Mostrar mensaje de éxito (Solo se llega aquí si no hubo errores)
            this.Label1.Text = "Se registró el cliente correctamente.";

            // Limpiamos los campos del formulario
            this.TextBox1.Text = "";
            this.TextBox2.Text = "";
            this.TextBox3.Text = "";
            this.TextBox4.Text = "";
            this.TextBox5.Text = "";
            if (this.ddlPlanesCliente.Items.Count > 0)
                this.ddlPlanesCliente.SelectedIndex = 0;

            // Cerramos la conexión
            conexion.Close();
        }
    }
}