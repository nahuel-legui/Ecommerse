using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class abmlCliente : System.Web.UI.Page
    {
        public NegocioCliente negocioCl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarCliente();
                cargarClienteBaja();


            }
        }
        private void cargarCliente()
        {
            negocioCl = new NegocioCliente();
            RepClientes.DataSource = negocioCl.obtenerTodosClientes();
            RepClientes.DataBind();
        }
        private void cargarClienteBaja()
        {
            negocioCl=new NegocioCliente();
            RepClientesBaja.DataSource= negocioCl.obtenerTodosClientesBaja();
            RepClientesBaja.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            negocioCl=new NegocioCliente();
            string dniCliente = ((LinkButton)sender).CommandArgument;
            bool eliminado=negocioCl.bajaLogicaCliente(dniCliente);
            cargarCliente();
            cargarClienteBaja();
            if (eliminado) {
                lblMensaje.Text = "El cliente se ha eliminado correctamente";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

            }
            else
            {
                lblMensaje.Text = "No se pudo eliminar al cliente";
                lblMensaje.ForeColor= System.Drawing.Color.Red;
            }

        }

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            negocioCl = new NegocioCliente();
            string dniCliente = ((LinkButton)sender).CommandArgument;
            bool eliminado = negocioCl.altaLogicaCliente(dniCliente);
            cargarCliente();
            cargarClienteBaja();
            if (eliminado)
            {
                lblMensajeAlta.Text = "El cliente se ha dado de alta correctamente";
                lblMensajeAlta.ForeColor = System.Drawing.Color.Green;

            }
            else
            {
                lblMensajeAlta.Text = "No se pudo dar de alta al cliente";
                lblMensajeAlta.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}