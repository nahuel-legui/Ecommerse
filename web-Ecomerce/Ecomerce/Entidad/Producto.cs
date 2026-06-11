using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;

namespace Ecomerce.Entidad
{
    public class Producto
    {
        public int idProducto { get; set; }
        public string nombreProducto { get; set; }
        public float precioUnitario { get; set; }
        public int stock { get; set; }
        public string descripcion { get; set; }
        public string ImagenUrl { get; set; }
        public bool activo { get; set; }




    }
}

