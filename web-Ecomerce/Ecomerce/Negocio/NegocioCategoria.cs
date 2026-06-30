using Database;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ecomerce.Negocio
{
    public class NegocioCategoria
    {

        public bool agregarCategoria(string nombreCategoria)
        {
            daoCategoria daoC=new daoCategoria();
            return daoC.agregarCategoria(nombreCategoria);
        }
        public List<Categoria> obtenerTodasCategorias()
        {
            daoCategoria daoC= new daoCategoria();
            return daoC.obtenerTodasCategorias();

        }

    }
}