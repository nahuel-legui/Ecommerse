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
                    objCliente.activo = (bool)lector[10];
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
                    objCliente.activo = (bool)lector[10];
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

        public string login (Cliente obj)
        {
            cn=new Conexion();

            try
            {
                string consulta = "select  dni_Cl from Clientes where activo_Cl=1 " +
                    "and correoElectronicp_Cl=@correo and contrasenia_Cl=@contrasenia";

                cn.setearConsulta(consulta);
                cn.setearParametros("@correo", obj.correoElectronico);
                cn.setearParametros("@contrasenia", obj.contrasenia);

                SqlDataReader lector= cn.ejecutarLectura();
                string dni = "-1";

                if(lector.Read()) {

                    dni = lector[0].ToString();


                }
                return dni;

            }
            catch (Exception)
            {

                throw;
            }

        }

        public bool isAdmin(string dni)
        {
            cn= new Conexion();

            try
            {
                string consulta = "select admin_Cl from Clientes " +
                    "where activo_Cl=1 and dni_Cl=@dni";

                cn.setearConsulta(consulta);
                cn.setearParametros("@dni", dni);

                bool admin = false;
                SqlDataReader lector =cn.ejecutarLectura();

                if (lector.Read())
                {
                    admin = (bool)lector[0];
                }
                return admin;


            }
            catch (Exception)
            {

                throw;
            }
        }

        public Cliente obtenerClienteXDni(string dni)
        {
            
            cn = new Conexion();
            try
            {
                string consulta = "select * from Clientes where activo_Cl=1 and dni_Cl=@dni";
                cn.setearConsulta(consulta);
                cn.setearParametros("@dni", dni);
                SqlDataReader lector = cn.ejecutarLectura();
                Cliente objCliente = new Cliente();
                if (lector.Read())
                {
                    objCliente.dni = lector[0].ToString();
                    objCliente.nombre = lector[1].ToString();
                    objCliente.apellido = lector[2].ToString();
                    objCliente.direccion = lector[3].ToString();
                    objCliente.fotoPerfil = lector[4].ToString();
                    objCliente.localidad = lector[5].ToString();
                    objCliente.fechaNacimiento = (DateTime)lector[6];
                    objCliente.correoElectronico = lector[7].ToString();
                    objCliente.contrasenia = lector[8].ToString();
                    objCliente.activo = (bool)lector[10];
                    
                }
                return objCliente;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public admin obtenerAdminXDni(string dni)
        {

            cn = new Conexion();
            try
            {
                string consulta = "select * from Clientes where activo_Cl=1 and dni_Cl=@dni";
                cn.setearConsulta(consulta);
                cn.setearParametros("@dni", dni);
                SqlDataReader lector = cn.ejecutarLectura();
                admin objCliente = new admin();
                if (lector.Read())
                {
                    objCliente.dni = lector[0].ToString();
                    objCliente.nombre = lector[1].ToString();
                    objCliente.apellido = lector[2].ToString();
                    objCliente.direccion = lector[3].ToString();
                    objCliente.fotoPerfil = lector[4].ToString();
                    objCliente.localidad = lector[5].ToString();
                    objCliente.fechaNacimiento = (DateTime)lector[6];
                    objCliente.correoElectronico = lector[7].ToString();
                    objCliente.contrasenia = lector[8].ToString();
                    objCliente.IsAdmin = (bool)lector[9];
                    objCliente.activo = (bool)lector[10];

                }
                return objCliente;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool modificarCliente (Cliente obj)
        {
            cn = new Conexion();

            try
            {
                string consulta = "update Clientes set direccion_Cl=@direccion, " +
                    "localidad_Cl=@localidad, fotoPerfil_Cl=@fotoPerfil" +
                    " where dni_Cl=@dni";

                cn.setearConsulta(consulta);
                cn.setearParametros("@direccion", obj.direccion);
                cn.setearParametros("@localidad", obj.localidad);
                cn.setearParametros("@fotoPerfil", obj.fotoPerfil);
                cn.setearParametros("@dni", obj.dni);

                int fila =cn.ejecutarAccion();

                return fila > 0;

            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool cargarCliente(Cliente obj)
        {
            cn= new Conexion();
            try
            {
                string consulta = "insert into Clientes (dni_Cl, nombre_Cl, apellido_Cl, " +
                    "direccion_Cl, fotoPerfil_Cl, localidad_Cl, fechaNacimiento_Cl, " +
                    "correoElectronicp_Cl, contrasenia_Cl ) values(@dni,@nombre,@apellido," +
                    "@direccion,@foto,@localidad,@fecha,@correo,@contrasenia)";
                cn.setearConsulta(consulta);
                cn.setearParametros("@dni", obj.dni);
                cn.setearParametros("@nombre", obj.nombre);
                cn.setearParametros("@apellido", obj.apellido);
                cn.setearParametros("@direccion", obj.direccion);
                cn.setearParametros("@foto", obj.fotoPerfil);
                cn.setearParametros("@localidad", obj.localidad);
                cn.setearParametros("@fecha", obj.fechaNacimiento);
                cn.setearParametros("@correo", obj.correoElectronico);
                cn.setearParametros("@contrasenia", obj.contrasenia);

                int filas= cn.ejecutarAccion();

                return filas > 0;

            }
            catch (Exception ex )
            {

                throw ex ;
            }


        }

    }
}