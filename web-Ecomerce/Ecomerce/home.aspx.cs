using Models;
using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class home : System.Web.UI.Page
    {
        public List<Producto> productosList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            // comentar
            if (!IsPostBack)
            { 
            NegocioProducto negPr = new NegocioProducto();
            productosList = negPr.obtenerTodosLosProductos();
                
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                    
            }
        }
    }
}