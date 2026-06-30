<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Ecomerce.about" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sobre Nosotros - NL Shop</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        /* Consistencia de marca */
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

        /* --- SECCIÓN ABOUT --- */
        .about-header {
            background: linear-gradient(135deg, var(--color-principal) 0%, #1E4E80 100%);
            color: #ffffff;
            padding: 4rem 0;
            text-align: center;
            border-radius: 0 0 24px 24px;
            margin-bottom: 3rem;
        }

            .about-header h1 {
                font-weight: 800;
                font-size: 2.5rem;
                margin-bottom: 0.5rem;
            }

        .about-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            padding: 2.5rem;
            height: 100%;
        }

        .about-title-secondary {
            font-weight: 700;
            color: var(--color-texto);
            font-size: 1.6rem;
            margin-bottom: 1.25rem;
            position: relative;
        }

            .about-title-secondary::after {
                content: '';
                display: block;
                width: 50px;
                height: 4px;
                background-color: var(--color-principal);
                border-radius: 2px;
                margin-top: 0.5rem;
            }

        .about-text {
            color: #4A5568;
            line-height: 1.7;
            font-size: 1rem;
        }

        /* Bloque de Valores */
        .value-box {
            text-align: center;
            padding: 1.5rem;
            background-color: #F8FAFC;
            border-radius: 12px;
            transition: transform 0.2s ease;
            height: 100%;
        }

        .iconoAdmin {
            font-size: 1.2rem;
            color: black !important;
        }

        .value-box:hover {
            transform: translateY(-5px);
        }

        .value-icon {
            font-size: 2.2rem;
            color: var(--color-principal);
            margin-bottom: 1rem;
            display: inline-block;
        }

        .value-title {
            font-weight: 700;
            font-size: 1.1rem;
            color: var(--color-texto);
            margin-bottom: 0.5rem;
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
                            <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="nav-link nav-link-custom fw-bold text-primary">Sobre Nosotros</asp:HyperLink>
                        </li>
                    </ul>

                    <div class="d-flex align-items-center gap-4">
                  
                        <asp:Label ID="lblNombreAdmin" runat="server" Text="" CssClass="text-white-50 small d-none d-sm-inline iconoAdmin ">
                        </asp:Label>
                        <asp:HyperLink ID="lnkPerfil" runat="server" NavigateUrl="~/perfil.aspx" CssClass="nav-icon" ToolTip="Mi Perfil">
                            <i class="bi bi-person-circle"></i>
                        </asp:HyperLink>

                        <asp:HyperLink ID="lnkCarrito" runat="server" NavigateUrl="~/carrito.aspx" CssClass="nav-icon" ToolTip="Carrito de compras">
                            <i class="bi bi-cart3"></i>
                            <span class="cart-badge">3</span>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <!-- ================= HERO HEADER ================= -->
        <div class="about-header">
            <div class="container">
                <h1>Conoce más sobre NL Shop</h1>
                <p class="lead opacity-75">Nuestra misión es conectar tus deseos con la mejor tecnología y accesorios.</p>
            </div>
        </div>

        <!-- ================= CONTENIDO DE HISTORIA ================= -->
        <div class="container mb-5">
            <div class="row g-4 align-items-stretch">

                <!-- Columna Izquierda: Historia -->
                <div class="col-12 col-md-7">
                    <div class="about-card">
                        <h2 class="about-title-secondary">Nuestra Historia</h2>
                        <p class="about-text mt-3">
                            <strong>NL Shop</strong> nació en el año 2022 con una idea simple pero ambiciosa: transformar la manera en la que las personas adquieren sus productos esenciales del día a día, eliminando las fricciones del comercio tradicional y garantizando accesibilidad y confianza.
                        </p>
                        <p class="about-text">
                            Lo que comenzó en un pequeño garage como un proyecto entre amigos entusiastas de la tecnología, rápidamente escaló gracias al apoyo de nuestra comunidad. Nos dimos cuenta de que el mercado no solo necesitaba productos de calidad, sino una experiencia de atención humana, envíos rápidos y un soporte post-venta que realmente respalde al cliente.
                        </p>
                        <p class="about-text">
                            Hoy en día, en pleno 2026, nos enorgullece ser uno de los e-commerce con mayor crecimiento, ofreciendo un catálogo cuidadosamente seleccionado que abarca desde gadgets tecnológicos de última generación hasta accesorios de uso diario, siempre priorizando la satisfacción de quienes confían en nosotros.
                        </p>
                    </div>
                </div>

                <!-- Columna Derecha: Imagen decorativa / Presentación corporativa -->
                <div class="col-12 col-md-5">
                    <div class="about-card bg-light d-flex flex-column justify-content-center align-items-center text-center p-4">
                        <i class="bi bi-rocket-takeoff-fill text-primary mb-3" style="font-size: 4rem;"></i>
                        <h3 class="fw-bold mb-2">Innovación Constante</h3>
                        <p class="small text-muted px-3">
                            No nos detenemos. Optimizamos nuestra plataforma día tras día para que tu experiencia de compra sea rápida, segura y sumamente placentera desde cualquier dispositivo.
                        </p>
                    </div>
                </div>

            </div>

            <!-- ================= SECCIÓN VALORES ================= -->
            <h2 class="about-title-secondary text-center mt-5 mb-4 mx-auto" style="width: fit-content;">Nuestros Pilares</h2>

            <div class="row g-4">
                <!-- Valor 1 -->
                <div class="col-12 col-md-4">
                    <div class="value-box">
                        <i class="bi bi-shield-check value-icon"></i>
                        <h4 class="value-title">Confianza Absoluta</h4>
                        <p class="small text-muted mb-0">Protegemos tus datos y tus transacciones con los más altos estándares de seguridad web del mercado.</p>
                    </div>
                </div>

                <!-- Valor 2 -->
                <div class="col-12 col-md-4">
                    <div class="value-box">
                        <i class="bi bi-truck value-icon"></i>
                        <h4 class="value-title">Envíos Eficientes</h4>
                        <p class="small text-muted mb-0">Sabemos que lo quieres ya. Trabajamos incansablemente con la red logística más rápida para acortar las esperas.</p>
                    </div>
                </div>

                <!-- Valor 3 -->
                <div class="col-12 col-md-4">
                    <div class="value-box">
                        <i class="bi bi-emoji-smile value-icon"></i>
                        <h4 class="value-title">Atención Centrada en Ti</h4>
                        <p class="small text-muted mb-0">Nuestro equipo de soporte está siempre listo y disponible para resolver tus dudas antes, durante y después de la compra.</p>
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
