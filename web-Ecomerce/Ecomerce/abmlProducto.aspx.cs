using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class abmlProducto : System.Web.UI.Page
    {
        public NegocioProducto negPr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarProductos();
            }

        }
        public void cargarProductos()
        {
            negPr=new NegocioProducto();
            RepProductos.DataSource = negPr.obtenerTodosLosProductos();
            RepProductos.DataBind();

        }
    }
}