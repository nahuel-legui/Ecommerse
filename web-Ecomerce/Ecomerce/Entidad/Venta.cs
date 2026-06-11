using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ecomerce.Entidad
{
    public class Venta
    {
        public int idVenta { get; set; }
        public string dniCliente { get; set; }
        public decimal total { get; set; }
        public DateTime fechaVenta { get; set; }

        public List<DetalleVenta> detalles { get; set; }


    }
}

