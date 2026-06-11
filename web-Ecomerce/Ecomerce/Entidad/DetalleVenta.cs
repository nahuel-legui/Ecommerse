using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ecomerce.Entidad
{
    public class DetalleVenta
    {
        public Producto producto { get; set; }
        public Venta venta { get; set; }
        public int cantidad { get; set; }
        public decimal precioUnitario { get; set; }

    }
}

