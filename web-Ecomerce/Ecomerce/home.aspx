<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Ecomerce.home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Home - Mi E-commerce</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
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

        /* Iconos de Perfil y Carrito */
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

   
        .carousel-item img {
            height: 450px;
            object-fit: cover; 
        }

        .carousel-caption-custom {
            background: rgba(0, 0, 0, 0.4);
            border-radius: 8px;
            padding: 1.5rem;
            backdrop-filter: blur(4px);
        }

        
        .section-title {
            font-weight: 700;
            color: var(--color-texto);
            position: relative;
            margin-bottom: 2rem;
        }

        .product-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }

        .product-img-wrapper {
            height: 220px;
            overflow: hidden;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
            padding: 1rem;
        }

        .product-title {
            font-size: 1rem;
            font-weight: 600;
            color: var(--color-texto);
            margin-bottom: 0.5rem;
        }

        .product-price {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--color-principal);
        }

 
        .btn-ver-mas {
            border: 2px solid var(--color-principal);
            color: var(--color-principal);
            font-weight: 600;
            padding: 0.6rem 2rem;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.2s ease;
            display: inline-block;
        }

        .btn-ver-mas:hover {
            background-color: var(--color-principal);
            color: white;
        }

        
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
                        <asp:HyperLink ID="lnkPerfil" runat="server" NavigateUrl="~/perfil.aspx" CssClass="nav-icon" ToolTip="Mi Perfil">
                            <i class="bi bi-person-circle"></i>
                        </asp:HyperLink>
                        
                        <asp:HyperLink ID="lnkCarrito" runat="server" NavigateUrl="~/carrito.aspx" CssClass="nav-icon" ToolTip="Carrito de compras">
                            <i class="bi bi-cart3"></i>
                            <span class="cart-badge">3</span> </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <div id="promoCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#promoCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#promoCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://picsum.photos/1600/450?random=1" class="d-block w-100" alt="Oferta Tecno" />
                    <div class="carousel-caption d-none d-md-block text-start">
                        <div class="carousel-caption-custom">
                            <h2>Súper Ofertas Semanales</h2>
                            <p>Hasta 40% OFF en tecnología seleccionada y envío gratis.</p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://picsum.photos/1600/450?random=2" class="d-block w-100" alt="Nueva Temporada" />
                    <div class="carousel-caption d-none d-md-block text-start">
                        <div class="carousel-caption-custom">
                            <h2>Nueva Temporada</h2>
                            <p>Descubre lo último en moda y accesorios con cuotas sin interés.</p>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#promoCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#promoCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>

        <div class="container my-5">
    <h2 class="text-center section-title">Productos Destacados</h2>

    <div class="row g-4">

        <%
        int contador = 0;

        foreach (Ecomerce.Entidad.Producto item in productosList)
        {
            if (contador >= 4)
                break;
        %>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <div class="product-card">
                <div class="product-img-wrapper">
                    <img src="<%: item.ImagenUrl %>" class="product-img" alt="<%: item.nombreProducto %>" />
                </div>

                <div class="p-3">
                    <h3 class="product-title"><%: item.nombreProducto %></h3>
                    <p class="product-price">$<%: item.precioUnitario %></p>
                </div>
            </div>
        </div>

        <%
            contador++;
        }
        %>

    </div>
</div>

            <div class="text-center mt-5">
                <asp:HyperLink ID="lnkVerMas" runat="server" NavigateUrl="~/productos.aspx" CssClass="btn-ver-mas">
                    Ver más productos <i class="bi bi-arrow-right ms-1"></i>
                </asp:HyperLink>
            </div>
        </div>

        <footer class="py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-md-4">
                        <h5>Nuestra Tienda</h5>
                        <p class="small mt-3">Tu e-commerce de confianza. Traemos los mejores productos del mercado internacional directamente a tu puerta con la seguridad que buscas.</p>
                    </div>
                    <div class="col-6 col-md-4 ps-md-5">
                        <h5>Enlaces Útiles</h5>
                        <ul class="list-unstyled mt-3 small">
                            <li class="mb-2"><asp:HyperLink ID="lnkFootHome" runat="server" NavigateUrl="~/home.aspx">Inicio</asp:HyperLink></li>
                            <li class="mb-2"><asp:HyperLink ID="lnkFootProd" runat="server" NavigateUrl="~/productos.aspx">Catálogo de Productos</asp:HyperLink></li>
                            <li class="mb-2"><asp:HyperLink ID="lnkFootAbout" runat="server" NavigateUrl="~/about.aspx">Quiénes Somos</asp:HyperLink></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-4">
                        <h5>Contacto y Soporte</h5>
                        <ul class="list-unstyled mt-3 small text-white-50">
                            <li class="mb-2"><i class="bi bi-geo-alt-fill me-2 text-white"></i> Av. de la Tienda 1234, CABA</li>
                            <li class="mb-2"><i class="bi bi-telephone-fill me-2 text-white"></i> +54 11 4444-5555</li>
                            <li class="mb-2"><i class="bi bi-envelope-fill me-2 text-white"></i> soporte@ecommerce.com</li>
                        </ul>
                    </div>
                </div>
                <hr class="border-secondary my-4" />
                <div class="row small">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-0">&copy; 2026 E-Shop. Todos los derechos reservados.</p>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>