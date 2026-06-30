using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class homeAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) {

                if (Session["UsuarioAdmin"]==null)
                {

                    Response.Redirect("home.aspx");
                    
                }
                admin obj = (admin)Session["UsuarioAdmin"];
                lblNombreAdmin.Text = obj.nombre + " " + obj.apellido;
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Remove("UsuarioAdmin");
            Response.Redirect("home.aspx");
        }
    }
}