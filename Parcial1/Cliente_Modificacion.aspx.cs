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
    public partial class Cliente_Modificacion : System.Web.UI.Page
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
            string s = ConfigurationManager.ConnectionStrings["LP3-Parcial-1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            SqlDataReader registro = null;

            // Abrimos la conexión
            conexion.Open();

            // Creamos la consulta SQL
            string selectSql = "SELECT nombre, apellido, telefono, direccion, id_plan FROM Clientes WHERE dni = " + this.TextBox1.Text;

            SqlCommand comando = new SqlCommand(selectSql, conexion);
            registro = comando.ExecuteReader();

            if (registro.Read())
            {
                // Poblamos los controles del panel de edición
                this.TextBox2.Text = registro["nombre"].ToString();
                this.TextBox3.Text = registro["apellido"].ToString();
                this.TextBox4.Text = registro["telefono"].ToString();
                this.TextBox5.Text = registro["direccion"].ToString();

                // Seleccionamos el plan correcto en el DropDownList
                string idPlan = registro["id_plan"] != DBNull.Value ? registro["id_plan"].ToString() : "";
                if (!string.IsNullOrEmpty(idPlan) && this.ddlPlanesCliente.Items.FindByValue(idPlan) != null)
                {
                    this.ddlPlanesCliente.SelectedValue = idPlan;
                }
                else
                {
                    // Opcional: si el cliente no tiene plan o el plan no existe en DDL
                    this.ddlPlanesCliente.SelectedIndex = 0; // O -1
                }

                // Hacer visible el panel de edición
                this.ddlPlanesCliente.Visible = true;
            }

            // Si no encontró al cliente mostramos un mensaje
            else
            {
                this.Label1.Text = "No existe un cliente con dicho DNI";
            }

            // Cerramos DataReader y Conexión
            if (registro != null) registro.Close();
            if (conexion.State == System.Data.ConnectionState.Open) conexion.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["LP3-Parcial-1ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);

            // Abrimos conexión
            conexion.Open();

            // Creamos la consulta SQL
            string updateSql = "UPDATE Clientes SET " +
                               "nombre = '" + this.TextBox2.Text + "', " +
                               "apellido = '" + this.TextBox3.Text + "', " +
                               "telefono = '" + this.TextBox4.Text + "', " +
                               "direccion = '" + this.TextBox5.Text + "', " +
                               "id_plan = " + this.ddlPlanesCliente.SelectedValue +
                               " WHERE dni = " + this.TextBox1.Text;

            // Creamos el comando
            SqlCommand comando = new SqlCommand(updateSql, conexion);

            // Ejecutamos el comando UPDATE
            int cantidad = comando.ExecuteNonQuery();

            // Verificamos si se actualizó alguna fila
            if (cantidad == 1)
            {
                if (this.Label1 != null) this.Label1.Text = "Datos Modificados";
            }
            else
            {
                if (this.Label1 != null) this.Label1.Text = "No existe el usuario";
            }

            // Cerramos conexión
            if (conexion.State == System.Data.ConnectionState.Open)
            {
                conexion.Close();
            }
        }
    }
}