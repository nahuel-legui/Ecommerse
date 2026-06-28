using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("home.aspx");
            }

            if (!Page.IsPostBack)
            {
                CargarCarrito();
            }
        }

        private void CargarCarrito()
        {
            RepProductos.DataSource = Session["Carrito"] as List<ItemCarrito>;
            RepProductos.DataBind();
        }


        protected void btnMas_Click(object sender, EventArgs e)
        {
            int idProducto = int.Parse(((System.Web.UI.WebControls.Button)sender).CommandArgument);

            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];

            ItemCarrito item = carrito.Find(x => x.Producto.idProducto == idProducto);

            if (item != null)
            {
                if(item.Cantidad < item.StockTotal)
                {
                    item.Cantidad++;
                } else
                {
                    litError.Text = $"<strong>Error:</strong> no se puede agregar al carrito, no hay mas stock disponible.";
                    ScriptManager.RegisterStartupScript(this, GetType(), "MostrarToast",
                    @"window.addEventListener('load', function () {
                    const toastElement = document.getElementById('toastError');
                    const toast = bootstrap.Toast.getOrCreateInstance(toastElement);
                    toast.show();
                    });", true);
                }
            }

            RepProductos.DataSource = carrito;
            RepProductos.DataBind();
        }

        protected void btnMenos_Click(object sender, EventArgs e)
        {
            int idProducto = int.Parse(((System.Web.UI.WebControls.Button)sender).CommandArgument);

            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];

            ItemCarrito item = carrito.Find(x => x.Producto.idProducto == idProducto);

            if (item != null)
            {
                item.Cantidad--;

                if (item.Cantidad <= 0)
                    carrito.Remove(item);
            }

            RepProductos.DataSource = carrito;
            RepProductos.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int idProducto = int.Parse(((System.Web.UI.WebControls.Button)sender).CommandArgument);

            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];

            ItemCarrito item = carrito.Find(x => x.Producto.idProducto == idProducto);

            if (item != null)
                carrito.Remove(item);

            RepProductos.DataSource = carrito;
            RepProductos.DataBind();
        }

        public decimal TotalCarrito()
        {
            if (Session["Carrito"] == null) return 0;
            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];

            decimal total = 0;

            foreach(ItemCarrito item in carrito)
            {
                total += (decimal)item.Producto.precioUnitario * item.Cantidad;
            }
            return total;
        }

        public int CantidadCarrito()
        {

        List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];

            if(carrito == null) return 0;
            int total = 0;

            foreach (ItemCarrito item in carrito)
            {
                total += item.Cantidad;
            }
            return total;
        }
    }
}