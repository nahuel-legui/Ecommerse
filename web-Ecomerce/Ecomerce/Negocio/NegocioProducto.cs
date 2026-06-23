using database;
using Models;
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
        public Producto obtenerProductoXId(int id)
        {
            daoP=new daoProductos();
            return daoP.obtenerProductoXId(id);

        }
        public bool modificarProducto(Producto producto)
        {
            daoP = new daoProductos();
            return daoP.modificarProducto(producto);

        }
        public List<Categoria> obtenerTodasCategorias()
        {
            daoP= new daoProductos();
            return daoP.obtenerTodasCategorias();
        }

        public List<Producto> obtenerProductosXCategoria(int idCategoria)
        {
            daoP = new daoProductos();
            return daoP.obtenerTodosLosProductosXCategoria(idCategoria);
        }

        public bool agregarProducto(Producto objProducto)
        {
            daoP = new daoProductos();
            return daoP.agregarProducto(objProducto);
        }

        public bool darBajaLogica(string idProducto)
        {
            daoP = new daoProductos();
            return daoP.darBajaLogica(idProducto);
        }
    }
}