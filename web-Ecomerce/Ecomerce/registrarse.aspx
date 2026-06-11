<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="Ecomerce.registrarse" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Crear Cuenta - E-commerce</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        
        :root {
            --color-principal: #2B6CB0;
            --color-principal-hover: #1E4E80;
            --color-fondo: #F7FAFC;
            --color-texto: #2D3748;
            --fuente-principal: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        body {
            font-family: var(--fuente-principal);
            background-color: var(--color-fondo);
            color: var(--color-texto);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 0; 
            margin: 0;
        }

        .register-container {
            width: 100%;
            max-width: 800px; 
            padding: 15px;
        }

        .register-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            padding: 2.5rem 2rem;
        }

        .register-title {
            font-weight: 700;
            color: var(--color-texto);
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
            text-align: center;
        }

        .register-subtitle {
            text-align: center;
            color: #718096;
            margin-bottom: 2rem;
            font-size: 0.95rem;
        }

        .form-label-custom {
            font-size: 0.85rem;
            font-weight: 600;
            color: #4A5568;
            margin-bottom: 0.4rem;
            display: block;
        }

        .input-group-custom {
            position: relative;
            margin-bottom: 1rem;
        }

        .input-group-custom i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #A0AEC0;
            font-size: 1rem;
            z-index: 10;
        }

        .form-control-custom {
            width: 100%;
            padding: 0.6rem 0.75rem 0.6rem 2.3rem;
            font-size: 0.9rem;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            background-color: #FFF;
            transition: all 0.2s ease;
        }

        .form-control-custom:focus {
            outline: none;
            border-color: var(--color-principal);
            box-shadow: 0 0 0 3px rgba(43, 108, 176, 0.15);
        }

        .btn-principal {
            background-color: var(--color-principal);
            color: #ffffff;
            font-weight: 600;
            padding: 0.8rem;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 1rem;
            transition: background-color 0.2s ease;
            margin-top: 1rem;
            margin-bottom: 1rem;
        }

        .btn-principal:hover {
            background-color: var(--color-principal-hover);
            color: #ffffff;
            cursor: pointer;
        }

        .register-footer {
            text-align: center;
            font-size: 0.9rem;
            margin-top: 1rem;
        }

        .link-custom {
            color: var(--color-principal);
            text-decoration: none;
            font-weight: 500;
        }

        .link-custom:hover {
            text-decoration: underline;
        }

        
        .section-header {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--color-principal);
            font-weight: 800;
            margin-top: 1rem;
            margin-bottom: 0.75rem;
            border-bottom: 1px solid #EDF2F7;
            padding-bottom: 0.25rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="register-container">
        <div class="register-card">
            
            <h1 class="register-title">Crear una cuenta</h1>
            <p class="register-subtitle">Completa tus datos para unirte a nuestra tienda</p>
            
            <div class="row">
                <div class="col-12 section-header">Datos Personales</div>

                <div class="col-md-4">
                    <asp:Label ID="lblDni" runat="server" Text="DNI" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-card-text"></i>
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control-custom" placeholder="DNI sin puntos"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-4">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-person"></i>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control-custom" placeholder="Tu nombre"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-4">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-person"></i>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control-custom" placeholder="Tu apellido"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="lblFechaNac" runat="server" Text="Fecha de Nacimiento" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-calendar-event"></i>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" CssClass="form-control-custom"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="lblFoto" runat="server" Text="URL Foto de Perfil" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-image"></i>
                        <asp:TextBox ID="txtFotoPerfil" runat="server" CssClass="form-control-custom" placeholder="http://ruta-de-tu-foto.jpg"></asp:TextBox>
                    </div>
                </div>

                <div class="col-12 section-header">Ubicación</div>

                <div class="col-md-6">
                    <asp:Label ID="lblDireccion" runat="server" Text="Dirección" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-geo-alt"></i>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control-custom" placeholder="Calle y número"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-map"></i>
                        <asp:TextBox ID="txtLocalidad" runat="server" CssClass="form-control-custom" placeholder="Ej: Buenos Aires"></asp:TextBox>
                    </div>
                </div>

                <div class="col-12 section-header">Seguridad de la Cuenta</div>

                <div class="col-12">
                    <asp:Label ID="lblEmail" runat="server" Text="Correo Electrónico" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-envelope"></i>
                        <asp:TextBox ID="txtCorreoElectronico" runat="server" TextMode="Email" CssClass="form-control-custom" placeholder="email@ejemplo.com"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="lblPass" runat="server" Text="Contraseña" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-lock"></i>
                        <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" CssClass="form-control-custom" placeholder="••••••••"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="lblPassConfirm" runat="server" Text="Repetir Contraseña" CssClass="form-label-custom"></asp:Label>
                    <div class="input-group-custom">
                        <i class="bi bi-lock-fill"></i>
                        <asp:TextBox ID="txtContraseniaConfirm" runat="server" TextMode="Password" CssClass="form-control-custom" placeholder="••••••••"></asp:TextBox>
                    </div>
                </div>
            </div>

            <asp:Button ID="btnRegistrar" runat="server" Text="Crear Cuenta Ahora" CssClass="btn-principal" />

            <div class="register-footer">
                <span class="text-muted">¿Ya tienes cuenta?</span> 
                <asp:HyperLink ID="hypLinkLogin" runat="server" NavigateUrl="~/login.aspx" CssClass="link-custom">Inicia sesión aquí</asp:HyperLink>
            </div>

        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>