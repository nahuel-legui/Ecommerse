using Models;
using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace Ecomerce
{
    public partial class abmlVenta : System.Web.UI.Page
    {
        public List<Venta> ventaList { get; set; }
        public string VentasJson { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["UsuarioAdmin"] == null)
                {
                    Response.Redirect("login.aspx");

                }
            }
            NegocioVenta ventas = new NegocioVenta();
            ventaList = ventas.obtenerTodasLasVentas();

            var datosModal = ventaList.Select(v => new
            {
                idVenta = v.idVenta,
                dniCliente = v.dniCliente,
                total = v.total,
                fechaVenta = v.fechaVenta.ToString("dd/MM/yyyy"),
                detalles = (v.detalles ?? new List<DetalleVenta>()).Select(d => new
                {
                    idProducto =  d.Producto.idProducto,
                    nombreProducto = d.Producto.nombreProducto,
                    cantidad = d.cantidad,
                    precioUnitario = d.precioUnitario
                }).ToList()
            }).ToList();

            VentasJson = new JavaScriptSerializer().Serialize(datosModal);
        }
    }
}