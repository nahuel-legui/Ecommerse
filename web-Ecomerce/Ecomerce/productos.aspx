<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productos.aspx.cs" Inherits="Ecomerce.cliente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Productos - Mi E-commerce</title>

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

        .iconoAdmin {
            font-size: 1.2rem;
            color: black !important;
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

        /* --- SECCIÓN FILTROS (IZQUIERDA) --- */
        .filter-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            padding: 1.5rem;
            position: sticky;
            top: 90px; /* Se queda fijo al hacer scroll abajo del navbar */
        }

        .filter-title {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 1.25rem;
            color: var(--color-texto);
            border-bottom: 2px solid #EDF2F7;
            padding-bottom: 0.5rem;
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
            background-color: #FFF;
            transition: all 0.2s ease;
        }

            .form-control-custom:focus {
                outline: none;
                border-color: var(--color-principal);
                box-shadow: 0 0 0 3px rgba(43, 108, 176, 0.15);
            }

        .btn-filtrar {
            background-color: var(--color-principal);
            color: #ffffff;
            font-weight: 600;
            padding: 0.6rem;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 0.9rem;
            transition: background-color 0.2s ease;
        }

            .btn-filtrar:hover {
                background-color: var(--color-principal-hover);
                cursor: pointer;
            }

        /* --- SECCIÓN PRODUCTOS (DERECHA) --- */
        .product-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            }

        .product-img-wrapper {
            height: 200px;
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

        .product-body {
            padding: 1.25rem;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .product-title {
            font-size: 0.95rem;
            font-weight: 600;
            color: var(--color-texto);
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }

        .product-price {
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--color-principal);
            margin-top: auto; /* Empuja el precio y el botón al fondo si el título es corto */
            margin-bottom: 0.75rem;
        }

        .btn-agregar-carrito {
            background-color: transparent;
            color: var(--color-principal);
            border: 1px solid var(--color-principal);
            font-weight: 600;
            font-size: 0.85rem;
            padding: 0.5rem;
            border-radius: 6px;
            width: 100%;
            transition: all 0.2s ease;
        }

            .btn-agregar-carrito:hover {
                background-color: var(--color-principal);
                color: #ffffff;
                cursor: pointer;
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
                            <asp:HyperLink ID="lnkProductos" runat="server" NavigateUrl="~/productos.aspx" CssClass="nav-link nav-link-custom fw-bold text-primary">Productos</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="nav-link nav-link-custom">Sobre Nosotros</asp:HyperLink>
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
                            <span class="cart-badge"><%= CantidadCarrito() %></span>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <!-- ================= CUERPO PRINCIPAL (FILTROS + CATALOGO) ================= -->
        <div class="container my-5">
            <div class="row g-4">

                <!-- COLUMNA IZQUIERDA: FILTROS -->
                <div class="col-12 col-lg-3">
                    <div class="filter-card">
                        <h2 class="filter-title"><i class="bi bi-sliders me-2"></i>Filtros</h2>

                        <!-- Filtro por Nombre -->
                        <div class="mb-3">
                            <asp:Label ID="lblBuscar" runat="server" Text="Buscar por nombre" CssClass="form-label-custom"></asp:Label>
                            <div class="input-group-custom">
                                <i class="bi bi-search"></i>
                                <asp:TextBox ID="txtBuscarNombre" runat="server" CssClass="form-control-custom" placeholder="Ej: Auriculares..." AutoPostBack="true" OnTextChanged="txtBuscarNombre_TextChanged"></asp:TextBox>
                            </div>
                        </div>

                        <!-- Filtro por Categoría -->
                        <div class="mb-4">
                            <asp:Label ID="lblCategoria" runat="server" Text="Categoría" CssClass="form-label-custom"></asp:Label>
                            <div class="input-group-custom">
                                <i class="bi bi-tags"></i>
                                <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="form-control-custom">
                                    <%-- Se deja vacío estructuralmente según lo solicitado --%>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Botón para procesar filtros -->
                        <asp:Button ID="btnFiltrar" runat="server" Text="Aplicar Filtros" CssClass="btn-filtrar" OnClick="btnFiltrar_Click" />
                    </div>
                </div>

                <!-- COLUMNA DERECHA: CATÁLOGO DE PRODUCTOS -->
                <div class="col-12 col-lg-9">
                    <div class="row g-4">

                        <!-- Producto 1 -->
                        <asp:Repeater ID="RepProductos" runat="server">
                            <ItemTemplate>
                                <div class="col-12 col-sm-6 col-md-4">
                                    <div class="product-card">
                                        <div class="product-img-wrapper">
                                            <img src="<%# Eval("ImagenUrl") %>" class="product-img" alt="Producto" />
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-title"><%# Eval("nombreProducto")  %></h3>
                                            <p class="product-price">$<%# Eval("precioUnitario", "{0:N2}") %></p>
                                            <asp:Button ID="btnC1" runat="server" Text="Agregar al Carrito" CssClass="btn-agregar-carrito" OnClick="btnAgregarItem" CommandArgument='<%# Eval("idProducto") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>

                        </asp:Repeater>

                    </div>
                </div>

            </div>
        </div>

        <!-- ================= FOOTER ================= -->
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
                            <li class="mb-2"><i class="bi bi-envelope-fill me-2 text-white"></i>soporte@ecommerce.com</li>
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

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
