using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["Usuario"] != null)
                {
                    Cliente objCliente = new Cliente();
                    objCliente = (Cliente)Session["Usuario"];
                    lblNombreAdmin.Text = objCliente.nombre + " " + objCliente.apellido;
                }

            }
        }
    }
}