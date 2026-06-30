using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace database
{
    public class daoDetalleVentas
    {
        public List<DetalleVenta> ObtenerDetallesVenta(int idVenta)
        {
            List<DetalleVenta> lista = new List<DetalleVenta>();
            Conexion cn = new Conexion();
            daoProductos pr = new daoProductos();

            try
            {
                cn.setearConsulta("SELECT idProducto_Pd_Dv, cantidad_Dv, precioUnitario_Dv FROM DetalleVenta WHERE idVentas_Vn_Dv = @idVenta");

                cn.setearParametros("@idVenta", idVenta);

                SqlDataReader lector = cn.ejecutarLectura();

                while (lector.Read())
                {
                    DetalleVenta aux = new DetalleVenta();

                    int idProducto = (int)lector["idProducto_Pd_Dv"];

                    aux.Producto = pr.obtenerProductoXIdSinFiltroActivo(idProducto);

                    aux.idVenta = idVenta;
                    aux.cantidad = (int)lector["cantidad_Dv"];
                    aux.precioUnitario = (decimal)lector["precioUnitario_Dv"];

                    lista.Add(aux);
                }

                lector.Close();
                cn.cerrarConexion();

                return lista;
            }
            catch
            {
                cn.cerrarConexion();
                throw;
            }
        }

        public bool GenerarDetalleVenta(int idVenta, List<ItemCarrito> productos)
        {
            Conexion cn = new Conexion();
            try
            {
                foreach (ItemCarrito item in productos)
                {
                    cn.setearConsulta("INSERT INTO DetalleVenta (idVentas_Vn_Dv, idProducto_Pd_Dv, cantidad_Dv, precioUnitario_Dv) VALUES (@idVenta, @idProducto, @cantidad, @precioUnitario)");
                    cn.setearParametros("@idVenta", idVenta);
                    cn.setearParametros("@idProducto", item.Producto.idProducto);
                    cn.setearParametros("@cantidad", item.Cantidad);
                    cn.setearParametros("@precioUnitario", item.Producto.precioUnitario);
                    cn.ejecutarAccion();
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
