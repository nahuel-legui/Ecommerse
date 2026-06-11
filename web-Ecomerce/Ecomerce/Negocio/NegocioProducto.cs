using Ecomerce.Datos;
using Ecomerce.Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ecomerce.Negocio
{
    public class NegocioProducto
    {
        public daoProductos daoP;

        public List<Producto> obtenerTodosLosProductos()
        {
            daoP = new daoProductos();
            return daoP.obtenerTodosLosProductos();
        }

    }
}