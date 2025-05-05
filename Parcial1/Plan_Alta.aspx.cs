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
    public partial class Plan_Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            string insertSql = "INSERT INTO planes (nombre_plan, descripcion, precio_mensual) VALUES ('" + 
                this.TextBox1.Text + "','" +
                this.TextBox2.Text + "','" +
                this.TextBox3.Text + "')";

            // Creamos el objeto comando
            SqlCommand comando = new SqlCommand(insertSql, conexion);

            // Ejecutamos el comando
            comando.ExecuteNonQuery();

            // Mostrar mensaje de éxito (Solo se llega aquí si no hubo errores)
            this.Label1.Text = "Se registró el plan correctamente.";

            // Limpiamos los campos del formulario
            this.TextBox1.Text = "";
            this.TextBox2.Text = "";
            this.TextBox3.Text = "";

            // Cerramos la conexión
            conexion.Close();
        }
    }
}