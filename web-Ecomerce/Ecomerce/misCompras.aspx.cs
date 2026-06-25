using Ecomerce.Negocio;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class misCompras : System.Web.UI.Page
    {
        public List<Venta> ventaList { get; set; }
        public string VentasJson { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("home.aspx");
                }
                cargarVentas();
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
                        idProducto = d.Producto.idProducto,
                        nombreProducto = d.Producto.nombreProducto,
                        cantidad = d.cantidad,
                        precioUnitario = d.precioUnitario
                    }).ToList()
                }).ToList();

                VentasJson = new JavaScriptSerializer().Serialize(datosModal);
            }

        }

        public void cargarVentas()
        {
            Cliente objCliente = new Cliente();
            objCliente = (Cliente)Session["Usuario"];
            NegocioVenta venta = new NegocioVenta();

            RepCompras.DataSource = venta.ObtenerVentasXCliente(objCliente.dni);
            RepCompras.DataBind();

        }

        protected string ObtenerClasesEstado(object enCaminoObj, object entregadoObj)
        {
            // Convertimos los objetos del Eval de forma segura a booleanos
            bool enCamino = enCaminoObj != DBNull.Value && Convert.ToBoolean(enCaminoObj);
            bool entregado = entregadoObj != DBNull.Value && Convert.ToBoolean(entregadoObj);

            // 1. Si está entregado
            if (entregado)
            {
                return "badge bg-success-subtle text-success border border-success-subtle px-2 py-1 w-100 text-start";
            }
            // 2. Si no está entregado, pero está en camino
            else if (enCamino)
            {
                return "badge bg-warning-subtle text-warning-emphasis border border-warning-subtle px-2 py-1 w-100 text-start";
            }
            // 3. Si ambos son falsos (0), está pendiente
            else
            {
                return "badge bg-secondary-subtle text-secondary border border-secondary-subtle px-2 py-1 w-100 text-start";
            }
        }

        protected string ObtenerTextoEIconoEstado(object enCaminoObj, object entregadoObj)
        {
            bool enCamino = enCaminoObj != DBNull.Value && Convert.ToBoolean(enCaminoObj);
            bool entregado = entregadoObj != DBNull.Value && Convert.ToBoolean(entregadoObj);

            if (entregado)
            {
                return "<i class='bi bi-check-circle-fill me-1'></i> Entregado";
            }
            else if (enCamino)
            {
                return "<i class='bi bi-truck me-1'></i> En Camino";
            }
            else
            {
                return "<i class='bi bi-clock me-1'></i> Pendiente";
            }
        }
    }
}