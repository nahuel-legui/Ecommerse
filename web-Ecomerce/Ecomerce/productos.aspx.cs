using Ecomerce.Entidad;
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
            //Configuracion inicial de la pantalla
            if (!IsPostBack)
            {
                cargarProductos();
                cargarCategorias();
                if (Session["Carrito"] == null) Session["Carrito"] = new List<Producto>();
                
                
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                    
                
            }


        }
        public void cargarCategorias()
        {
            negPr = new NegocioProducto();
            ddlCategorias.DataSource = negPr.obtenerTodasCategorias();
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
            Button btn = (Button)sender;
            int idProducto = int.Parse(btn.CommandArgument);

            List<Producto> carrito = (List<Producto>)Session["Carrito"];
            List<Producto> lista = (List<Producto>)Session["ListaProductos"];


            Producto producto = lista.Find(x =>
                    x.idProducto == idProducto);
            if (producto != null) carrito.Add(producto);

            Session["Carrito"] = carrito;
        }

        public int CantidadCarrito()
        {
            if (Session["Carrito"] == null) return 0;
            return ((List<Producto>)Session["Carrito"]).Count;
        }
    }
 }