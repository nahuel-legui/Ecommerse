using Ecomerce.Entidad;
using Ecomerce.Negocio;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecomerce
{
    public partial class abmlProducto : System.Web.UI.Page
    {
        public NegocioProducto negPr;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Configuracion inicial de la pantalla
            if (!IsPostBack)
            {
                cargarProductos();
                cargarCategorias();
            }

            

        }
        public void cargarCategorias()
        {
            negPr= new NegocioProducto();
            ddlCategoria.DataSource=negPr.obtenerTodasCategorias();
            ddlCategoria.DataValueField = "IdCategoria";
            ddlCategoria.DataTextField = "descripcion";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("-- Seleccione una Categoria --","0"));
        }
        public void cargarProductos()
        {
            negPr=new NegocioProducto();
            RepProductos.DataSource = negPr.obtenerTodosLosProductos();
            RepProductos.DataBind();

        }

        protected void btnEditarRow_Click(object sender, EventArgs e)
        {
            negPr= new NegocioProducto();
            string idProducto = ((LinkButton)sender).CommandArgument;
            Producto objProducto=new Producto();
            objProducto = negPr.obtenerProductoXId(int.Parse(idProducto));
            lblIdProducto.Text = idProducto;
            txtNombreProducto.Text = objProducto.nombreProducto;
            txtDescripcion.Text = objProducto.descripcion;
            txtImagenUrl.Text = objProducto.ImagenUrl;
            txtPrecioUnitario.Text = objProducto.precioUnitario.ToString(CultureInfo.InvariantCulture);
            txtStock.Text=objProducto.stock.ToString();
            btnGuardar.Text = "Modificar Producto";
            ddlCategoria.SelectedValue = objProducto.categoria.idCategoria.ToString();


        }
        private void limpiar()
        {
            lblIdProducto.Text = "";
            txtNombreProducto.Text = "";
            txtDescripcion.Text = "";
            txtImagenUrl.Text = "";
            txtPrecioUnitario.Text = "";
            txtStock.Text = "";
            

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
            lblMensaje.Text = "";
            btnGuardar.Text = "Agregar Producto";
            lblBorrar.Text = "";

        }
        private bool verificarVacio()
        {
            if (txtNombreProducto.Text.Length == 0 || txtDescripcion.Text.Length == 0
                || txtImagenUrl.Text.Length == 0 || txtPrecioUnitario.Text.Length == 0
                || txtStock.Text.Length ==0 || ddlCategoria.SelectedValue=="0")
            {
                return false;
            }
            return true;
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!verificarVacio())
            {
                lblMensaje.Text = "Necesitar llenar todos los campos";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            Producto objProducto= new Producto();
            negPr= new NegocioProducto();
            objProducto.nombreProducto = txtNombreProducto.Text;
            objProducto.descripcion = txtDescripcion.Text;
            objProducto.ImagenUrl = txtImagenUrl.Text;
            objProducto.stock = int.Parse((txtStock.Text));
            objProducto.precioUnitario = float.Parse((txtPrecioUnitario.Text));
            objProducto.categoria = new Categoria();
            objProducto.categoria.idCategoria = int.Parse(ddlCategoria.SelectedValue);
            if (lblIdProducto.Text.Length == 0)
            {
                //si no tiene id agregamos 
                if (negPr.agregarProducto(objProducto))
                {
                    lblMensaje.Text = "El producto se agregado correctamente";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMensaje.Text = "El producto no se pudo agregar";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                //si tiene id Modificamos 

                objProducto.idProducto = int.Parse(lblIdProducto.Text);
                
                if (negPr.modificarProducto(objProducto))
                {
                    lblMensaje.Text = "El producto se modifico correctamente";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMensaje.Text = "El producto no se puedo modificar";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }

            }
            cargarProductos();
            limpiar();
            cargarCategorias();
        }

        protected void btnBorrarRow_Click(object sender, EventArgs e)
        {
            negPr = new NegocioProducto();
            string idProducto = ((LinkButton)sender).CommandArgument;
            if (negPr.darBajaLogica(idProducto))
            {
                lblBorrar.Text = "Producto eliminado correctamente ";
                lblBorrar.ForeColor = System.Drawing.Color.Green;

            }
            else
            {
                lblBorrar.Text = "El producto no se pudo eliminar";
                lblBorrar.ForeColor = System.Drawing.Color.Red;
            }
            cargarProductos();
            limpiar();

        }
    }
}