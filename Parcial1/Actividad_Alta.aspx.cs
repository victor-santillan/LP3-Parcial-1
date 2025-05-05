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
    public partial class Actividad_Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccione Plan", ""));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["LP3-Parcial-1ConnectionString"].ConnectionString;

            // Creamos la conexión
            SqlConnection conexion = new SqlConnection(s);

            // Iniciamos la conexión
            conexion.Open(); // Si falla, crashea

            // Armamos la consulta SQL
            string insertSql = "INSERT INTO Actividades (nombre_actividad, descripcion, dias, horario, id_plan) VALUES ('" +
                               this.TextBox1.Text + "','" +
                               this.TextBox2.Text + "','" +
                               this.TextBox3.Text + "','" +
                               this.TextBox4.Text + "'," +
                               this.DropDownList1.SelectedValue + ")";

            // Creamos el objeto comando
            SqlCommand comando = new SqlCommand(insertSql, conexion);

            // Ejecutamos el comando
            comando.ExecuteNonQuery(); // Si falla, crashea

            // Mostrar mensaje de éxito
            if (this.Label1 != null) this.Label1.Text = "Se registró la actividad correctamente.";

            // Limpiamos los campos del formulario
            this.TextBox1.Text = "";
            this.TextBox2.Text = "";
            this.TextBox3.Text = "";
            this.TextBox4.Text = "";
            if (this.DropDownList1.Items.Count > 0)
                this.DropDownList1.SelectedIndex = 0;

            // Cerramos la conexión
            if (conexion.State == System.Data.ConnectionState.Open)
            {
                conexion.Close();
            }
        }
    }
}