
using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Ecomerce
{
    public partial class perfil : System.Web.UI.Page
    {

        public int CantidadCarrito()
        {

            List<ItemCarrito> carrito = (List<ItemCarrito>)Session["Carrito"];

            if (carrito == null) return 0;
            int total = 0;

            foreach (ItemCarrito item in carrito)
            {
                total += item.Cantidad;
            }
            return total;
        }

        private void rellenarPerfil()
        {
            //comentarios
            if (Session["Usuario"] != null)
            {
                Cliente objCliente = new Cliente();
                objCliente = (Cliente)Session["Usuario"];
                txtNombre.Text = objCliente.nombre;
                txtApellido.Text = objCliente.apellido;
                txtCorreoElectronico.Text = objCliente.correoElectronico;
                txtDireccion.Text = objCliente.direccion;
                txtFechaNacimiento.Text = objCliente.fechaNacimiento.ToString();
                txtLocalidad.Text = objCliente.localidad;
                txtDni.Text = objCliente.dni;
                txtFotoPerfil.Text = objCliente.fotoPerfil;
                lblNombrePerfil.Text = objCliente.nombre + " " + objCliente.apellido;
                lblEmailPerfil.Text = objCliente.correoElectronico;
                imgFotoPerfil.ImageUrl = objCliente.fotoPerfil;

            }
        }
        private void actualizarSession()
        {
            if (Session["Usuario"] != null)
            {
                NegocioCliente negCl= new NegocioCliente();
                Cliente objCliente= new Cliente();

                objCliente = (Cliente)Session["Usuario"];
                string dni = objCliente.dni;
                objCliente = negCl.obtenerClienteXDni(dni);
                Session["Usuario"]=objCliente;

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                rellenarPerfil();
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Response.Redirect("login.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Cliente objCliente = new Cliente();

            if (txtDireccion.Text.Length == 0 || txtLocalidad.Text.Length == 0
                || txtFotoPerfil.Text.Length == 0)
            {
                lblMensaje.Text = "Para modificar debe llenar todos los campos";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            objCliente.direccion = txtDireccion.Text;
            objCliente.localidad = txtLocalidad.Text;
            objCliente.fotoPerfil = txtFotoPerfil.Text;
            objCliente.dni = txtDni.Text;

            NegocioCliente negCl = new NegocioCliente();

            bool modificar = negCl.modificarCliente(objCliente);
            if (modificar)
            {
                lblMensaje.Text = "Se modidifico correctamente";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMensaje.Text = "No se pudo modificar";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
            actualizarSession();
            rellenarPerfil();
        }
    }
}