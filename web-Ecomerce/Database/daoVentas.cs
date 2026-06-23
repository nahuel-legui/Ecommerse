using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace database
{
    public class daoVentas
    {
        public List<Venta> ObtenerVentas()
        {
            
            List<Venta> lista = new List<Venta>();
            Conexion cn = new Conexion();
            daoDetalleVentas cnDet = new daoDetalleVentas();
            try
            {
                cn.setearConsulta("SELECT idVenta_Vn as idVenta ,dni_Cl_Vn as dniCliente ,total_Vn as total ,fechaVenta_Vn as fechaVenta FROM Ventas");
                SqlDataReader lector = cn.ejecutarLectura();
                while (lector.Read())
                {
                    Venta aux = new Venta();
                    aux.idVenta = (int)lector["idVenta"];
                    aux.dniCliente = (string)lector["dniCliente"];
                    aux.total = (decimal)lector["total"];
                    aux.fechaVenta = (DateTime)lector["fechaVenta"];

                    aux.detalles = cnDet.ObtenerDetallesVenta(aux.idVenta);

                    lista.Add(aux);
                }
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
