using Ecomerce.Entidad;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecomerce.Datos
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
    }
}
