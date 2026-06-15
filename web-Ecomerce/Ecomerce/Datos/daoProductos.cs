using Ecomerce.Entidad;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Ecomerce.Datos
{
    public class daoProductos
    {
        public Conexion cn;

        public List<Producto> obtenerTodosLosProductos()
        {
            List<Producto> lista = new List<Producto>();
            cn = new Conexion();
            try
            {
                string consulta = "select * from Productos where activo_Pd=1";
                cn.setearConsulta(consulta);
                SqlDataReader lector = cn.ejecutarLectura();
                while (lector.Read())
                {
                    Producto producto = new Producto();
                    producto.idProducto = int.Parse(lector[0].ToString());
                    producto.nombreProducto = lector[1].ToString();
                    producto.precioUnitario = float.Parse(lector[2].ToString());
                    producto.stock = int.Parse(lector[3].ToString());
                    producto.descripcion = lector[4].ToString();
                    producto.ImagenUrl = lector[5].ToString();
                    producto.activo = Convert.ToBoolean (lector[6]);
                    lista.Add(producto);

                }
                return lista;


            }
            catch (Exception)
            {

                throw ;
            }

        }
        public Producto obtenerProductoPorId(int idProducto)
        {
            
            cn = new Conexion();
            try
            {
                Producto producto = new Producto();
                string consulta = "select * from Productos where idProducto_Pd = @idProducto and activo_Pd = 1";
                cn.setearConsulta(consulta);
                cn.setearParametros("@idProducto", idProducto);
                SqlDataReader lector = cn.ejecutarLectura();
                while (lector.Read())
                {
                    producto.idProducto = int.Parse(lector[0].ToString());
                    producto.nombreProducto = lector[1].ToString();
                    producto.precioUnitario = float.Parse(lector[2].ToString());
                    producto.stock = int.Parse(lector[3].ToString());
                    producto.descripcion = lector[4].ToString();
                    producto.ImagenUrl = lector[5].ToString();
                    producto.activo = Convert.ToBoolean(lector[6]);
                    

                }
                return producto;


            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}