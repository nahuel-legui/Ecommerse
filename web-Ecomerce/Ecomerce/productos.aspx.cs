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
                if(PuedeAgregarAlCarrito(producto, carrito))
                {
                ItemCarrito item = carrito.Find(x => x.Producto.idProducto == idProducto);

                if (item != null)
                {
                    item.Cantidad++;
                }
                else
                {
                    item = new ItemCarrito
                    {
                        Producto = producto,
                        Cantidad = 1,
                        StockTotal = producto.stock
                    };
                    carrito.Add(item);
                }
                    int stockRestante = item.StockTotal - item.Cantidad;
                    litMensaje.Text = $"<strong>{producto.nombreProducto}</strong> agregado al carrito correctamente, {(stockRestante == 0 ? "Te llevas la ultima unidad del producto" :  $"Solo quedan {stockRestante} unidades")}.";
                ScriptManager.RegisterStartupScript(this, GetType(), "MostrarToast", 
                    @"window.addEventListener('load', function () {
                    const toastElement = document.getElementById('toastCarrito');
                    const toast = bootstrap.Toast.getOrCreateInstance(toastElement);
                    toast.show();
                    });", true);
                } else
                {
                    litError.Text = $"<strong>Error: {producto.nombreProducto}</strong> no se puede agregar al carrito, no hay stock disponible.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "MostrarToast",
                    @"window.addEventListener('load', function () {
                    const toastElement = document.getElementById('toastError');
                    const toast = bootstrap.Toast.getOrCreateInstance(toastElement);
                    toast.show();
                    });", true);
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

        private bool PuedeAgregarAlCarrito(Producto producto, List<ItemCarrito> carrito)
        {
            ItemCarrito item = carrito.Find(x => x.Producto.idProducto == producto.idProducto);

            if (item == null)
                return producto.stock > 0;

            return item.Cantidad < item.StockTotal;
        }
    }
 }