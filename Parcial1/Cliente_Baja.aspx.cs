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
    public partial class Cliente_Baja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Obtenemos DNI a eliminar
            string dniAEliminar = this.TextBox1.Text;

            // Validación básica: no procesar si el DNI está vacío
            if (string.IsNullOrWhiteSpace(dniAEliminar))
            {
                if (this.Label1 != null)
                {
                    this.Label1.Text = "Por favor, ingrese un DNI.";
                }
                return;
            }

            string s = ConfigurationManager.ConnectionStrings["LP3-Parcial-1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            // Abrimos conexión
            conexion.Open();

            // Armamos la consulta SQL
            string deleteSql = "DELETE FROM Clientes WHERE dni = " + dniAEliminar;

            // Creamos el comando
            SqlCommand comando = new SqlCommand(deleteSql, conexion);

            // Ejecutamos el comando DELETE
            int cantidadFilasAfectadas = comando.ExecuteNonQuery();

            // Verificamos si se eliminó alguna fila
            if (cantidadFilasAfectadas == 1)
            {
                if (this.Label1 != null)
                {
                    this.Label1.Text = "Cliente eliminado exitosamente.";
                }
            }
            else
            {
                if (this.Label1 != null)
                {
                    this.Label1.Text = "No se encontró un cliente con el DNI ingresado.";
                }
            }

            // Cerrar conexión
            if (conexion.State == System.Data.ConnectionState.Open)
            {
                conexion.Close();
            }
        }
    }
}