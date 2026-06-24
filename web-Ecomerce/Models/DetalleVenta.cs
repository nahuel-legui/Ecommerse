using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Models
{
    public class DetalleVenta
    {
        public Producto Producto { get; set; }
        public int idVenta { get; set; }
        public int cantidad { get; set; }
        public decimal precioUnitario { get; set; }

    }
}

