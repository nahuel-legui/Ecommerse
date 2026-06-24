using database;
using Models;
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
        public string login(Cliente obj)
        {
            daoCl = new daoClientes();
            return daoCl.login(obj);

        }


         public bool isAdmin(string dni)
        {
            daoCl=new daoClientes();
            return daoCl.isAdmin(dni);
        }

        public Cliente obtenerClienteXDni(string dni)
        {
            daoCl = new daoClientes();
            return daoCl.obtenerClienteXDni(dni);
        }

        public admin obtenerAdminXDni(string dni)
        {
            daoCl=new daoClientes();
            return daoCl.obtenerAdminXDni(dni);
        }
        public bool modificarCliente(Cliente obj)
        {
            daoCl=new daoClientes();
            return daoCl.modificarCliente(obj);
        }
        public bool cargarCliente(Cliente obj)
        {
            daoCl= new daoClientes();
            return daoCl.cargarCliente(obj);
        }
    }
}