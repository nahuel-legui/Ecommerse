using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Models
{
    public class seguimiento
    {
        public int idSegumiento { get; set; }
        public Venta venta { get; set; }
        public bool enCamino { get; set; }
        public bool entregado { get; set; }


    }
}