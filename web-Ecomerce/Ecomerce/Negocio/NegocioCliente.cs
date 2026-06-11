using Ecomerce.Datos;
using Ecomerce.Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ecomerce.Negocio
{
    public class NegocioCliente
    {
        public daoClientes daoCl;

        public List<Cliente> obtenerTodosClientes()
        {
            daoCl = new daoClientes();
            return daoCl.obtenerTodosClientes();
        }

        public bool bajaLogicaCliente(string dni)
        {
            daoCl=new daoClientes();
            return daoCl.bajaLogicaCliente(dni);

        }

        public List<Cliente> obtenerTodosClientesBaja()
        {
            daoCl = new daoClientes();
            return daoCl.obtenerTodosClientesBaja();
        }

        public bool altaLogicaCliente(string dni)
        {  
            daoCl=new daoClientes();
            return daoCl.altaLogicaCliente(dni);
        
        }
    }
}