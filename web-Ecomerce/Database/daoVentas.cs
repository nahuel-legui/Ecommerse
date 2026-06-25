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
                cn.setearConsulta("SELECT idVenta_Vn as idVenta ,dni_Cl_Vn as dniCliente ,total_Vn as total ,fechaVenta_Vn as fechaVenta,enCamino_Sg,entregado_Sg FROM Ventas");
                SqlDataReader lector = cn.ejecutarLectura();
                while (lector.Read())
                {
                    Venta aux = new Venta();
                    aux.idVenta = (int)lector["idVenta"];
                    aux.dniCliente = (string)lector["dniCliente"];
                    aux.total = (decimal)lector["total"];
                    aux.fechaVenta = (DateTime)lector["fechaVenta"];
                    aux.enCamino = (bool)lector["enCamino_Sg"];
                    aux.entregado = (bool)lector["entregado_Sg"];

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

        public bool enCamino(int idVenta)
        { 
            Conexion cn=new Conexion();

            try
            {
                string consulta = "update Ventas set enCamino_Sg=1 where idVenta_Vn=@id";
                cn.setearConsulta(consulta);
                cn.setearParametros("@id", idVenta);
                int filas=cn.ejecutarAccion();
                return filas > 0;
            }
            catch (Exception ex )
            {

                throw ex;
            }
        }
        public bool entregado(int idVenta)
        {
            Conexion cn = new Conexion();

            try
            {
                string consulta = "update Ventas set entregado_Sg=1 where idVenta_Vn=@id";
                cn.setearConsulta(consulta);
                cn.setearParametros("@id", idVenta);
                int filas = cn.ejecutarAccion();
                return filas > 0;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Venta> ObtenerVentasXCliente(string dni)
        {

            List<Venta> lista = new List<Venta>();
            Conexion cn = new Conexion();
            daoDetalleVentas cnDet = new daoDetalleVentas();
            try
            {
                cn.setearConsulta("SELECT idVenta_Vn as idVenta ,dni_Cl_Vn as dniCliente ,total_Vn as total ,fechaVenta_Vn as fechaVenta,enCamino_Sg,entregado_Sg FROM Ventas where dni_Cl_Vn=@dni");
                cn.setearParametros("@dni", dni);
                SqlDataReader lector = cn.ejecutarLectura();
                while (lector.Read())
                {
                    Venta aux = new Venta();
                    aux.idVenta = (int)lector["idVenta"];
                    aux.dniCliente = (string)lector["dniCliente"];
                    aux.total = (decimal)lector["total"];
                    aux.fechaVenta = (DateTime)lector["fechaVenta"];
                    aux.enCamino = (bool)lector["enCamino_Sg"];
                    aux.entregado = (bool)lector["entregado_Sg"];

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
