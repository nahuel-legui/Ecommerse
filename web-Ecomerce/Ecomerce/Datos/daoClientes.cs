using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Ecomerce.Entidad;

namespace Ecomerce.Datos
{
    public class daoClientes
    {
        Conexion cn;
        public List<Cliente> obtenerTodosClientes()
        {
            List<Cliente> lista = new List<Cliente>();
            cn = new Conexion();
            try
            {
                string consulta = "select * from Clientes where activo_Cl=1";
                cn.setearConsulta(consulta);
                SqlDataReader lector = cn.ejecutarLectura();
                while (lector.Read())
                {
                    Cliente objCliente = new Cliente();
                    objCliente.dni = lector[0].ToString();
                    objCliente.nombre = lector[1].ToString();
                    objCliente.apellido = lector[2].ToString();
                    objCliente.direccion = lector[3].ToString();
                    objCliente.fotoPerfil = lector[4].ToString();
                    objCliente.localidad = lector[5].ToString();
                    objCliente.fechaNacimiento = (DateTime)lector[6];
                    objCliente.correoElectronico = lector[7].ToString();
                    objCliente.contrasenia = lector[8].ToString();
                    objCliente.activo = (bool)lector[9];
                    lista.Add(objCliente);
                }
                return lista;

            }
            catch (Exception ex )
            {

                throw ex;
            }

        }

        public bool bajaLogicaCliente(string dni)
        {
            cn=new Conexion();
            try
            {
                string consulta = "update Clientes set activo_Cl=0 where dni_Cl=@dni";
                cn.setearConsulta(consulta);
                cn.setearParametros("@dni", dni);
                int fila = cn.ejecutarAccion();
                return fila > 0;
            }
            catch (Exception ex )
            {

                throw ex ;
            }
        }

        public List<Cliente> obtenerTodosClientesBaja()
        {
            List<Cliente> lista = new List<Cliente>();
            cn = new Conexion();
            try
            {
                string consulta = "select * from Clientes where activo_Cl=0";
                cn.setearConsulta(consulta);
                SqlDataReader lector = cn.ejecutarLectura();
                while (lector.Read())
                {
                    Cliente objCliente = new Cliente();
                    objCliente.dni = lector[0].ToString();
                    objCliente.nombre = lector[1].ToString();
                    objCliente.apellido = lector[2].ToString();
                    objCliente.direccion = lector[3].ToString();
                    objCliente.fotoPerfil = lector[4].ToString();
                    objCliente.localidad = lector[5].ToString();
                    objCliente.fechaNacimiento = (DateTime)lector[6];
                    objCliente.correoElectronico = lector[7].ToString();
                    objCliente.contrasenia = lector[8].ToString();
                    objCliente.activo = (bool)lector[9];
                    lista.Add(objCliente);
                }
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public bool altaLogicaCliente(string dni)
        {
            cn = new Conexion();
            try
            {
                string consulta = "update Clientes set activo_Cl=1 where dni_Cl=@dni";
                cn.setearConsulta(consulta);
                cn.setearParametros("@dni", dni);
                int fila = cn.ejecutarAccion();
                return fila > 0;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}