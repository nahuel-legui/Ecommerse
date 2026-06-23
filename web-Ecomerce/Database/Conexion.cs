using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace database
{
    public class Conexion
    {
        private SqlConnection conexion;
        private SqlCommand comando;

        public Conexion()
        {
            string rutaConexion = "Server = .\\; database = Ecomerce_db; integrated security = true";
            conexion = new SqlConnection(rutaConexion);
            comando = new SqlCommand();
            comando.Connection = conexion;

        }

        public void abrirConexion()
        {
            try
            {
                if (conexion.State != System.Data.ConnectionState.Open)
                {

                    conexion.Open();

                }

            }
            catch (Exception ex)
            {

                throw new Exception("Error al abrir la conexion: " + ex.Message);

            }
        }

        public void cerrarConexion()
        {

            try
            {
                if (conexion.State == System.Data.ConnectionState.Open)
                {

                    conexion.Close();

                }

            }
            catch (Exception ex)
            {

                throw new Exception("Error al cerrar la conexion: " + ex.Message);

            }

        }

        public void setearConsulta(string consulta)
        {
            comando.CommandType = CommandType.Text;
            comando.CommandText = consulta;

        }

        public void setearParametros(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public SqlDataReader ejecutarLectura()
        {
            try
            {
                abrirConexion();
                SqlDataReader lector = comando.ExecuteReader();
                return lector;

            }
            catch (Exception ex)
            {

                throw new Exception("Error al ejecutar la lectura: " + ex.Message);
            }
        }

        public int ejecutarAccion()
        {
            try
            {
                abrirConexion();
                return comando.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

                throw new Exception("Error al ejecutar la accion: " + ex.Message);
            }
            finally
            {
                cerrarConexion();
            }

        }
    }
}