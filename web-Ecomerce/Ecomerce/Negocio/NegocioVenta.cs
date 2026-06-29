using database;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecomerce.Negocio
{
    public class NegocioVenta
    {
        public daoVentas daoV;

        public List<Venta> obtenerTodasLasVentas()
        {
            daoV = new daoVentas();
            return (List<Venta>)daoV.ObtenerVentas();
        }
        public bool enCamino(int idVenta)
        {
            daoV=new daoVentas();
            return daoV.enCamino(idVenta);
        }
        public bool entregado(int idVenta)
        {
            daoV = new daoVentas();
            return daoV.entregado(idVenta);
        }
        public List<Venta> ObtenerVentasXCliente(string dni)
        {
            daoV= new daoVentas();
            return daoV.ObtenerVentasXCliente(dni);
        }

        public bool GenerarVenta(int dni, List<ItemCarrito> productos)
        {
            daoV = new daoVentas();
            return daoV.GenerarVenta(dni, productos);
        }

    }
}
