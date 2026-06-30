using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace database
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
        public List<Producto> obtenerTodosLosProductosBaja()
        {
            List<Producto> lista = new List<Producto>();
            cn = new Conexion();
            try
            {
                string consulta = "select * from Productos where activo_Pd=0";
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
                    producto.activo = Convert.ToBoolean(lector[6]);
                    lista.Add(producto);

                }
                return lista;


            }
            catch (Exception)
            {

                throw;
            }

        }


        public bool modificarProducto(Producto producto)
        {
            // 1. Instanciamos la clase conexion
            Conexion cn = new Conexion();
            try
            {
                // 2. Definimos la consulta con los mismos nombres de tu base de datos
                string consulta = "UPDATE Productos SET nombreProducto_Pd = @nombre," +
                    "precioUnitario_Pd = @precio,stock_Pd = @stock," +
                    "descripcion_Pd = @descripcion,ImagenUrl_Pd = @imagen , idCategoria_Pd_Ct=@idCategoria " +
                    "WHERE idProducto_Pd = @id";

                cn.setearConsulta(consulta);

                // 3. Pasamos los datos usando el método exacto de tu clase
                cn.setearParametros("@nombre", producto.nombreProducto);
                cn.setearParametros("@precio", producto.precioUnitario);
                cn.setearParametros("@stock", producto.stock);

                // Controlamos si la descripción o imagen son nulas para que no falle SQL
                cn.setearParametros("@descripcion", producto.descripcion);
                cn.setearParametros("@imagen", producto.ImagenUrl);
                cn.setearParametros("@id", producto.idProducto);
                cn.setearParametros("@idCategoria", producto.categoria.idCategoria);


                // 4. Ejecutamos la acción (tu clase ya abre, ejecuta y cierra la conexión aquí)
                int filas=cn.ejecutarAccion();
                return filas > 0;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cn.cerrarConexion();
            }
        }

        public Producto obtenerProductoXId(int id)
        {
            
            cn = new Conexion();
            try
            {
                Producto producto = new Producto();
                string consulta = "select * from Productos where activo_Pd=1 and idProducto_Pd=@id";
                cn.setearConsulta(consulta);
                cn.setearParametros("@id",id);
                SqlDataReader lector = cn.ejecutarLectura();
                if (lector.Read())
                {
                    producto.idProducto = int.Parse(lector[0].ToString());
                    producto.nombreProducto = lector[1].ToString();
                    producto.precioUnitario = float.Parse(lector[2].ToString());
                    producto.stock = int.Parse(lector[3].ToString());
                    producto.descripcion = lector[4].ToString();
                    producto.ImagenUrl = lector[5].ToString();
                    producto.categoria = new Categoria();
                    producto.categoria.idCategoria = int.Parse(lector[6].ToString());
                    producto.activo = Convert.ToBoolean(lector[7]);


                }
                return producto;


            }
            catch (Exception)
            {

                throw;
            }

        }

        public Producto obtenerProductoXIdSinFiltroActivo(int id)
        {

            cn = new Conexion();
            try
            {
                Producto producto = new Producto();
                string consulta = "select * from Productos where idProducto_Pd=@id";
                cn.setearConsulta(consulta);
                cn.setearParametros("@id", id);
                SqlDataReader lector = cn.ejecutarLectura();
                if (lector.Read())
                {
                    producto.idProducto = int.Parse(lector[0].ToString());
                    producto.nombreProducto = lector[1].ToString();
                    producto.precioUnitario = float.Parse(lector[2].ToString());
                    producto.stock = int.Parse(lector[3].ToString());
                    producto.descripcion = lector[4].ToString();
                    producto.ImagenUrl = lector[5].ToString();
                    producto.categoria = new Categoria();
                    producto.categoria.idCategoria = int.Parse(lector[6].ToString());
                    producto.activo = Convert.ToBoolean(lector[7]);


                }
                return producto;


            }
            catch (Exception)
            {

                throw;
            }

        }

        public List<Producto> obtenerTodosLosProductosXCategoria(int idCategoria)
        {
            List<Producto> lista = new List<Producto>();
            cn = new Conexion();
            try
            {
                string consulta = "select * from Productos where activo_Pd=1 and idCategoria_Pd_Ct=@idCategoria";
                cn.setearConsulta(consulta);
                cn.setearParametros("@idCategoria", idCategoria);
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
                    producto.activo = Convert.ToBoolean(lector[6]);
                    lista.Add(producto);

                }
                return lista;


            }
            catch (Exception)
            {

                throw;
            }

        }


        public bool agregarProducto(Producto objProducto)
        {
            cn= new Conexion();
            try
            {
                string consulta = "insert into Productos (nombreProducto_Pd,precioUnitario_Pd,stock_Pd,idCategoria_Pd_Ct,ImagenUrl_Pd,descripcion_Pd)" +
                    " values (@nombre,@precio,@stock,@idCategoria,@imgUrl,@descripcion)";

                cn.setearConsulta(consulta);

                cn.setearParametros("@nombre", objProducto.nombreProducto);
                cn.setearParametros("@precio", objProducto.precioUnitario);
                cn.setearParametros("@stock", objProducto.stock);
                cn.setearParametros("idCategoria", objProducto.categoria.idCategoria);
                cn.setearParametros("imgUrl", objProducto.ImagenUrl);
                cn.setearParametros("descripcion", objProducto.descripcion);

                int fila = cn.ejecutarAccion();

                return fila>0;
            }
            catch (Exception ex )
            {

                throw ex ;
            }

            
        }
       

        public bool darBajaLogica(string idProducto)
        {
            cn = new Conexion();

            try
            {
                string consulta = "update Productos set activo_Pd=0 where idProducto_Pd=@id";

                cn.setearConsulta(consulta);
                cn.setearParametros("@id", idProducto);

                int filas = cn.ejecutarAccion();
                return filas > 0;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool darAltaLogica(string idProducto)
        {
            cn = new Conexion();

            try
            {
                string consulta = "update Productos set activo_Pd=1 where idProducto_Pd=@id";

                cn.setearConsulta(consulta);
                cn.setearParametros("@id", idProducto);

                int filas = cn.ejecutarAccion();
                return filas > 0;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool bajarStockProductosVenta(List<ItemCarrito> productos)
        {
            cn = new Conexion();
            try
            {
                foreach (ItemCarrito item in productos)
                {
                    string consulta = "update Productos set stock_Pd=stock_Pd-@cantidad where idProducto_Pd=@id";
                    cn.setearConsulta(consulta);
                    cn.setearParametros("@id", item.Producto.idProducto);
                    cn.setearParametros("@cantidad", item.Cantidad);
                    cn.ejecutarAccion();
                }
                return true;
            }catch
            {
                return false; 
            }
        }
}
}