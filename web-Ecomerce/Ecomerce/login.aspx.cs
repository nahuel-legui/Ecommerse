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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInciar_Click(object sender, EventArgs e)
        {
            if(txtContrasenia.Text.Length==0 || txtEmail.Text.Length == 0)
            {
                lblMensaje.Text = "Es necesario que llene todos los campos";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }
            
            Cliente objCliente =new Cliente();

            objCliente.correoElectronico = txtEmail.Text;
            objCliente.contrasenia = txtContrasenia.Text;

            NegocioCliente negC=new NegocioCliente();
            string dni = negC.login(objCliente);

            if (dni == "-1")
            {
                lblMensaje.Text = "Correo o contrasenia incorrectas";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                txtContrasenia.Text = "";
                txtEmail.Text = "";
                return;
            }
            bool isAdmin = negC.isAdmin(dni);

            if (isAdmin)
            {
                admin objAdmin = new admin();
                objAdmin = negC.obtenerAdminXDni(dni);
                Session["UsuarioAdmin"]= objAdmin;
                Response.Redirect("homeAdmin.aspx");
            }
            else
            {
                objCliente = negC.obtenerClienteXDni(dni);
                Session["Usuario"]=objCliente;
                Response.Redirect("home.aspx");
            }

        }
    }
}