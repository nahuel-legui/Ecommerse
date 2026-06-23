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
    }
}
