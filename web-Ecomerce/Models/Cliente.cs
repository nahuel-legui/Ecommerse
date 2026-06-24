using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Models
{
    public class Cliente
    {
        public string dni{ get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string direccion { get; set; }
        public string fotoPerfil { get; set; }
        public string localidad { get; set; }
        public string correoElectronico { get; set; }
        public string contrasenia { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public bool activo { get; set; }




    }
}

