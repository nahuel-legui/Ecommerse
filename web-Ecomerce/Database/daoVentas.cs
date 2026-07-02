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
                cn.setearConsulta("SELECT V.idVenta_Vn as idVenta ,V.dni_Cl_Vn as dniCliente ,V.total_Vn as total ,V.fechaVenta_Vn as fechaVenta,S.enCamino_Sg,S.entregado_Sg FROM Ventas V LEFT JOIN seguimiento S ON V.idVenta_Vn = S.idVenta_Vn_Sg;");
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
                string consulta = "update seguimiento set enCamino_Sg=1 where idVenta_Vn_Sg=@id";
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
                string consulta = "update seguimiento set entregado_Sg=1 where idVenta_Vn_Sg=@id";
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
                cn.setearConsulta("SELECT V.idVenta_Vn as idVenta ,V.dni_Cl_Vn as dniCliente ,V.total_Vn as total ,V.fechaVenta_Vn as fechaVenta,S.enCamino_Sg,S.entregado_Sg FROM Ventas V LEFT JOIN seguimiento S ON V.idVenta_Vn = S.idVenta_Vn_Sg;");
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

            public bool GenerarVenta(int dni, List<ItemCarrito> productos)
        {
            Conexion cn = new Conexion();
            daoDetalleVentas cnDet = new daoDetalleVentas();

            try {
                decimal total = (decimal)productos.Sum(p => p.Producto.precioUnitario * p.Cantidad);
                string consulta = "INSERT INTO Ventas (dni_Cl_Vn, total_Vn, fechaVenta_Vn) VALUES (@dni, @total, @fechaVenta_Vn) SELECT SCOPE_IDENTITY();";
                cn.setearConsulta(consulta);
                cn.setearParametros("@dni", dni);
                cn.setearParametros("@total", total);
                cn.setearParametros("@fechaVenta_Vn", DateTime.Now);
                int idVenta = cn.ejecutarScalar();
                
                bool detalle = cnDet.GenerarDetalleVenta(idVenta, productos);
                if(!detalle) throw new Exception("Error al generar el detalle de la venta");

                // crear Seguimiento
                consulta = "INSERT INTO seguimiento (idVenta_Vn_Sg, enCamino_Sg, entregado_Sg) VALUES (@idVenta,0,0);";
                cn.setearConsulta(consulta);
                cn.setearParametros("@idVenta", idVenta);
                cn.ejecutarAccion();



                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
