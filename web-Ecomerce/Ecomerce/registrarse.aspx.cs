using Ecomerce.Entidad;
using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool verificarVacio()
        {
            if(string.IsNullOrWhiteSpace(txtApellido.Text)||
                string.IsNullOrWhiteSpace(txtNombre.Text)||
                string.IsNullOrWhiteSpace(txtDni.Text)||
                string.IsNullOrWhiteSpace(txtContrasenia.Text)||
                string.IsNullOrWhiteSpace(txtContraseniaConfirm.Text)||
                string.IsNullOrWhiteSpace(txtCorreoElectronico.Text)||
                string.IsNullOrWhiteSpace(txtDireccion.Text)||
                string.IsNullOrWhiteSpace(txtLocalidad.Text)||
                string.IsNullOrWhiteSpace(txtFechaNacimiento.Text)||
                string.IsNullOrWhiteSpace(txtFotoPerfil.Text))
            {
                return false;
            }
            return true;
        }
        public Cliente cargarDatos()
        {
            Cliente objCliente = new Cliente();
            objCliente.dni = txtDni.Text;
            objCliente.nombre = txtNombre.Text;
            objCliente.apellido = txtApellido.Text;
            objCliente.direccion = txtDireccion.Text;
            objCliente.localidad = txtLocalidad.Text;
            objCliente.fotoPerfil = txtFotoPerfil.Text;
            objCliente.correoElectronico = txtCorreoElectronico.Text;
            objCliente.contrasenia = txtContrasenia.Text;
            DateTime fecha;
            bool ok= DateTime.TryParseExact(txtFechaNacimiento.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out fecha );
            if (ok)
            {
                objCliente.fechaNacimiento = fecha;
            }
            return objCliente;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text="";
            if (!verificarVacio())
            {
                lblMensaje.Text = "Deberia llenar todos los campos";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (txtContrasenia.Text!=txtContraseniaConfirm.Text)
            {
                lblMensaje.Text = "La contrasenia deberian ser iguales";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            
            Cliente objCliente = new Cliente();
            objCliente = cargarDatos();
            NegocioCliente negC = new NegocioCliente();
            if (negC.cargarCliente(objCliente))
            {
                lblMensaje.Text = "El cliente se ha cargado correctamente";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("login.aspx");
            }
            else
            {
                lblMensaje.Text = "El cliente no se puedo cargar ";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void btnAbrirModal_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtFotoPerfil.Text))
            {
                imgFoto.ImageUrl = txtFotoPerfil.Text.Trim();
            }
        }

        protected void txtFotoPerfil_TextChanged(object sender, EventArgs e)
        {
            imgFoto.ImageUrl = txtFotoPerfil.Text.Trim();
        }
    }
}