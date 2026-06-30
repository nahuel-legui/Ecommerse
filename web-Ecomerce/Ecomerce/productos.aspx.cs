using Models;
using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class cliente : System.Web.UI.Page
    {
        public NegocioProducto negPr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                cargarProductos(); 
                cargarCategorias(); 
                if (Session["Carrito"] == null) Session["Carrito"] = new List<ItemCarrito>();

                if (Session["Usuario"] != null)
                {
                    Cliente objCliente = new Cliente();
                    objCliente = (Cliente)Session["Usuario"];
                    lblNombreAdmin.Text = objCliente.nombre + " " + objCliente.apellido;
                }
            }


        }
        public void cargarCategorias()
        {
            NegocioCategoria  negCat = new NegocioCategoria();
            ddlCategorias.DataSource = negCat.obtenerTodasCategorias();
            ddlCategorias.DataValueField = "IdCategoria";
            ddlCategorias.DataTextField = "descripcion";
            ddlCategorias.DataBind();
            ddlCategorias.Items.Insert(0, new ListItem("-- Seleccione una Categoria --", "0"));
        }
        public void cargarProductos()
        {
            negPr = new NegocioProducto();
            List<Producto> lista = negPr.obtenerTodosLosProductos();
            Session["ListaProductos"] = lista;
            RepProductos.DataSource = lista;
            RepProductos.DataBind();

        }

        protected void txtBuscarNombre_TextChanged(object sender, EventArgs e)
        {
            List<Producto> lista = (List<Producto>)Session["ListaProductos"];

            string texto = txtBuscarNombre.Text.Trim().ToLower();

            if (!string.IsNullOrEmpty(texto))
            {
                lista = lista.Where(x =>
                    x.nombreProducto.ToLower().Contains(texto)
                ).ToList();
            }

            RepProductos.DataSource = lista;
            RepProductos.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            NegocioProducto negocio = new NegocioProducto();

            int idCategoria = int.Parse(ddlCategorias.SelectedValue);

            if (idCategoria == 0)  cargarProductos();
            else
            {
            RepProductos.DataSource = negocio.obtenerProductosXCategoria(idCategoria);
            RepProductos.DataBind();
            }
        }

        protected void btnAgregarItem(object sender, EventArgs e)
        {
            if (Session["Usuario"]==null) {
                return;
            }
            Button btn = (Button)sender;
            int idProducto = int.Parse(btn.CommandArgument);

            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];
            List<Producto> lista = (List<Producto>)Session["ListaProductos"];

            Producto producto = lista.Find(x => x.idProducto == idProducto);

            if (producto != null)
            {
                ItemCarrito item = carrito.Find(x => x.Producto.idProducto == idProducto);

                if (item != null)
                {
                    item.Cantidad++;
                }
                else
                {
                    carrito.Add(new ItemCarrito
                    {
                        Producto = producto,
                        Cantidad = 1
                    });
                }
            }
        }

        public int CantidadCarrito()
        {
            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];

            int total = 0;

            foreach (ItemCarrito item in carrito)
            {
                total +=  item.Cantidad;
            }
            return total;
        }
    }
 }