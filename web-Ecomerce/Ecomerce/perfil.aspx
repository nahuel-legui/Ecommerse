<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="Ecomerce.perfil" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mi Perfil - NL Shop</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        /* Coherencia de marca e identidad visual */
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* --- HEADER / NAVBAR --- */
        .navbar-custom {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 0.8rem 1rem;
        }

        .navbar-brand-custom {
            font-weight: 700;
            color: var(--color-principal) !important;
            font-size: 1.4rem;
        }

        .iconoAdmin {
            font-size: 1.2rem;
            color: black !important;
        }

        .nav-link-custom {
            color: #4A5568 !important;
            font-weight: 500;
            margin-right: 1rem;
            transition: color 0.2s ease;
        }

            .nav-link-custom:hover {
                color: var(--color-principal) !important;
            }

        .nav-icon {
            font-size: 1.3rem;
            color: #4A5568 !important;
            position: relative;
            transition: color 0.2s ease;
        }

            .nav-icon:hover {
                color: var(--color-principal) !important;
            }

        .cart-badge {
            position: absolute;
            top: -5px;
            right: -8px;
            background-color: #E53E3E;
            color: white;
            font-size: 0.7rem;
            padding: 2px 5px;
            border-radius: 50%;
        }

        /* --- PANEL DE PERFIL --- */
        .profile-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            padding: 2rem;
        }

        /* Avatar de Usuario */
        .avatar-container {
            position: relative;
            width: 130px;
            height: 130px;
            margin: 0 auto 1.5rem auto;
        }

        .profile-avatar {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #E2E8F0;
        }

        .profile-name {
            font-weight: 700;
            font-size: 1.4rem;
            color: var(--color-texto);
            margin-bottom: 0.25rem;
            text-align: center;
        }

        .profile-email-sub {
            font-size: 0.9rem;
            color: #718096;
            text-align: center;
            margin-bottom: 1.5rem;
            display: block;
        }

        /* Estilos de los inputs informativos */
        .form-label-custom {
            font-size: 0.85rem;
            font-weight: 600;
            color: #4A5568;
            margin-bottom: 0.4rem;
            display: block;
        }

        .input-group-custom {
            position: relative;
            margin-bottom: 1.25rem;
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
            background-color: #F8FAFC; /* Un tono sutilmente gris para denotar lectura */
            color: var(--color-texto);
            transition: all 0.2s ease;
        }

            .form-control-custom:focus {
                outline: none;
                border-color: var(--color-principal);
                background-color: #FFF;
                box-shadow: 0 0 0 3px rgba(43, 108, 176, 0.15);
            }

        .section-header-profile {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--color-principal);
            font-weight: 800;
            margin-top: 0.5rem;
            margin-bottom: 1rem;
            border-bottom: 1px solid #EDF2F7;
            padding-bottom: 0.25rem;
        }

        /* Botones del Perfil */
        .btn-principal {
            background-color: var(--color-principal);
            color: #ffffff;
            font-weight: 600;
            padding: 0.7rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: background-color 0.2s ease;
        }

            .btn-principal:hover {
                background-color: var(--color-principal-hover);
                cursor: pointer;
            }

        .btn-logout {
            background-color: transparent;
            color: #E53E3E;
            border: 1px solid #E53E3E;
            font-weight: 600;
            padding: 0.6rem;
            border-radius: 8px;
            width: 100%;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }

            .btn-logout:hover {
                background-color: #E53E3E;
                color: #ffffff;
                cursor: pointer;
            }
        /* Botón de navegación: Ver mis compras */
        .btn-mis-compras-custom {
            background-color: rgba(43, 108, 176, 0.1); /* Fondo azul traslúcido muy suave */
            color: var(--color-principal); /* Azul corporativo #2B6CB0 */
            border: 1px solid rgba(43, 108, 176, 0.2);
            padding: 0.5rem 1.2rem;
            border-radius: 8px; /* Mismo radio de curvatura de la marca */
            font-size: 0.9rem;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem; /* Espaciado perfecto entre el icono de la bolsa y el texto */
            transition: all 0.2s ease;
            margin-bottom: 3rem;
        }

            /* Efecto al pasar el mouse (Hover) */
            .btn-mis-compras-custom:hover {
                background-color: var(--color-principal); /* Cambia a azul pleno */
                color: #ffffff !important; /* Texto blanco */
                border-color: var(--color-principal);
                cursor: pointer;
                box-shadow: 0 4px 12px rgba(43, 108, 176, 0.15); /* Sombra suave de enfoque */
            }

        /* --- FOOTER --- */
        footer {
            background-color: #1A202C;
            color: #A0AEC0;
            margin-top: auto;
        }

            footer h5 {
                color: #ffffff;
                font-weight: 600;
            }

            footer a {
                color: #A0AEC0;
                text-decoration: none;
                transition: color 0.2s ease;
            }

                footer a:hover {
                    color: #ffffff;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- ================= NAVBAR / HEADER ================= -->
        <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
            <div class="container">
                <asp:HyperLink ID="lnkLogo" runat="server" NavigateUrl="~/home.aspx" CssClass="navbar-brand navbar-brand-custom">
                    <i class="bi bi-bag-heart-fill me-2"></i>NL Shop
                </asp:HyperLink>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/home.aspx" CssClass="nav-link nav-link-custom">Home</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkProductos" runat="server" NavigateUrl="~/productos.aspx" CssClass="nav-link nav-link-custom">Productos</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="nav-link nav-link-custom">Sobre Nosotros</asp:HyperLink>
                        </li>
                    </ul>

                    <div class="d-flex align-items-center gap-4">
                        
                        <asp:Label ID="lblNombreAdmin" runat="server" Text="" CssClass="text-white-50 small d-none d-sm-inline iconoAdmin ">
                        </asp:Label>
                        <asp:HyperLink ID="lnkPerfil" runat="server" NavigateUrl="~/perfil.aspx" CssClass="nav-icon fw-bold text-primary" ToolTip="Mi Perfil">
                            <i class="bi bi-person-circle"></i>
                        </asp:HyperLink>

                        <asp:HyperLink ID="lnkCarrito" runat="server" NavigateUrl="~/carrito.aspx" CssClass="nav-icon" ToolTip="Carrito de compras">
                            <i class="bi bi-cart3"></i>
                            <span class="cart-badge"><%= CantidadCarrito() %></span>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <!-- ================= CONTENIDO PRINCIPAL ================= -->
        <div class="container my-5">
            <div class="row g-4">

                <!-- COLUMNA IZQUIERDA: RESUMEN DE PERFIL -->
                <div class="col-12 col-lg-4">
                    <div class="profile-card text-center">
                        <div class="avatar-container">
                            <!-- Se utiliza un placeholder de imagen de prueba usando Picsum -->
                            <asp:Image ID="imgFotoPerfil" runat="server" ImageUrl="https://picsum.photos/150/150?random=45" CssClass="profile-avatar" AlternativeText="Foto de perfil" />
                        </div>

                        <!-- Nombre del usuario de muestra -->
                        <asp:Label ID="lblNombrePerfil" runat="server" Text="" CssClass="profile-name"></asp:Label>
                        <asp:Label ID="lblEmailPerfil" runat="server" Text="" CssClass="profile-email-sub" DisplayMode="Paragraph"></asp:Label>

                        <hr class="my-4 border-light-subtle" />
                        <asp:HyperLink ID="lnkMisCompras" runat="server" NavigateUrl="~/misCompras.aspx" CssClass="btn-mis-compras-custom">
                         <i class="bi bi-bag-check-fill"></i> Ver mis compras
                        </asp:HyperLink>
                        <!-- Botón de Cerrar Sesión -->
                        <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="btn-logout" OnClick="btnCerrarSesion_Click" />
                    </div>
                </div>

                <!-- COLUMNA DERECHA: DETALLE DE LOS DATOS -->
                <div class="col-12 col-lg-8">
                    <div class="profile-card">

                        <div class="row">
                            <div class="col-12 section-header-profile">Información de Cuenta y Personal</div>

                            <!-- Campo Nombre -->
                            <div class="col-md-6">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-person"></i>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control-custom" placeholder="Tu nombre" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Campo Apellido -->
                            <div class="col-md-6">
                                <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-person"></i>
                                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control-custom" placeholder="Tu apellido" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Campo DNI -->
                            <div class="col-md-6">
                                <asp:Label ID="lblDni" runat="server" Text="DNI" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-card-text"></i>
                                    <asp:TextBox ID="txtDni" runat="server" CssClass="form-control-custom" placeholder="Número de documento" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Campo Fecha de Nacimiento -->
                            <div class="col-md-6">
                                <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-calendar-event"></i>
                                    <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="SingleLine" CssClass="form-control-custom" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Campo Correo Electrónico -->
                            <div class="col-12">
                                <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-envelope"></i>
                                    <asp:TextBox ID="txtCorreoElectronico" runat="server" TextMode="Email" CssClass="form-control-custom" placeholder="tu@email.com" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-12 section-header-profile mt-3">Información de Envío y Ubicación</div>

                            <!-- Campo Dirección -->
                            <div class="col-md-6">
                                <asp:Label ID="lblDireccion" runat="server" Text="Dirección" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-geo-alt"></i>
                                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control-custom" placeholder="Calle, número, piso o departamento"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Campo Localidad -->
                            <div class="col-md-6">
                                <asp:Label ID="lblLocalidad" runat="server" Text="Localidad" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-map"></i>
                                    <asp:TextBox ID="txtLocalidad" runat="server" CssClass="form-control-custom" placeholder="Ciudad / Provincia"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Campo Foto URL por si requiere actualizarla -->
                            <div class="col-12">
                                <asp:Label ID="lblFotoPerfil" runat="server" Text="Enlace URL de Foto de Perfil" CssClass="form-label-custom"></asp:Label>
                                <div class="input-group-custom">
                                    <i class="bi bi-link-45deg"></i>
                                    <asp:TextBox ID="txtFotoPerfil" runat="server" CssClass="form-control-custom" placeholder="https://ruta-de-la-imagen.com/foto.jpg"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Botón para guardar o actualizar la información -->
                        <div class="mt-3 text-end">
                            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Mis Datos" CssClass="btn-principal" OnClick="btnActualizar_Click" />
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <!-- ================= FOOTER ================= -->
        <footer class="py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-md-4">
                        <h5>NL Shop</h5>
                        <p class="small mt-3">Tu e-commerce de confianza. Traemos los mejores productos del mercado internacional directamente a tu puerta con la seguridad que buscas.</p>
                    </div>
                    <div class="col-6 col-md-4 ps-md-5">
                        <h5>Enlaces Útiles</h5>
                        <ul class="list-unstyled mt-3 small">
                            <li class="mb-2">
                                <asp:HyperLink ID="lnkFootHome" runat="server" NavigateUrl="~/home.aspx">Inicio</asp:HyperLink></li>
                            <li class="mb-2">
                                <asp:HyperLink ID="lnkFootProd" runat="server" NavigateUrl="~/productos.aspx">Catálogo de Productos</asp:HyperLink></li>
                            <li class="mb-2">
                                <asp:HyperLink ID="lnkFootAbout" runat="server" NavigateUrl="~/about.aspx">Quiénes Somos</asp:HyperLink></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-4">
                        <h5>Contacto y Soporte</h5>
                        <ul class="list-unstyled mt-3 small text-white-50">
                            <li class="mb-2"><i class="bi bi-geo-alt-fill me-2 text-white"></i>Av. de la Tienda 1234, CABA</li>
                            <li class="mb-2"><i class="bi bi-telephone-fill me-2 text-white"></i>+54 11 4444-5555</li>
                            <li class="mb-2"><i class="bi bi-envelope-fill me-2 text-white"></i>soporte@nlshop.com</li>
                        </ul>
                    </div>
                </div>
                <hr class="border-secondary my-4" />
                <div class="row small">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-0">&copy; 2026 NL Shop. Todos los derechos reservados.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end mt-2 mt-md-0">
                        <a href="#" class="me-3"><i class="bi bi-facebook fs-5"></i></a>
                        <a href="#" class="me-3"><i class="bi bi-instagram fs-5"></i></a>
                        <a href="#"><i class="bi bi-twitter-x fs-5"></i></a>
                    </div>
                </div>
            </div>
        </footer>

    </form>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
