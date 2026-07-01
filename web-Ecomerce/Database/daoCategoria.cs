using database;
using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database
{
    public class daoCategoria
    {
        public bool agregarCategoria(string nombreCategoria)
        {
            Conexion cn=new Conexion();
            try
            {
                string consulta = "insert into Categoria (descripcion_Ct) values(@nombre)";
                cn.setearConsulta(consulta);
                cn.setearParametros("@nombre", nombreCategoria);

                int filas = cn.ejecutarAccion();
                return filas > 0;
            }
            catch (Exception ex)
            {

                throw ex ;
            }
        }
        public List<Categoria> obtenerTodasCategorias()
        {
             Conexion cn = new Conexion();
            try
            {
                string consulta = "select * from Categoria";
                cn.setearConsulta(consulta);
                SqlDataReader lector = cn.ejecutarLectura();

                List<Categoria> lista = new List<Categoria>();
                while (lector.Read())
                {
                    Categoria objCat = new Categoria();
                    objCat.idCategoria = int.Parse(lector[0].ToString());
                    objCat.descripcion = lector[1].ToString();
                    lista.Add(objCat);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
