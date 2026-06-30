<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="Ecomerce.carrito" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mi Carrito - NL Shop</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        /* Coherencia estética del proyecto */
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

        .iconoAdmin {
            font-size: 1.2rem;
            color: black !important;
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

        /* --- CONTENEDORES Y CARTAS --- */
        .cart-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            padding: 1.5rem;
        }

        /* Item Individual de la Lista del Carrito */
        .cart-item {
            display: flex;
            align-items: center;
            padding: 1.25rem 0;
            border-bottom: 1px solid #EDF2F7;
        }

            .cart-item:last-child {
                border-bottom: none;
            }

        .cart-item-img-wrapper {
            width: 80px;
            height: 80px;
            background-color: #F8FAFC;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            flex-shrink: 0;
        }

        .cart-item-img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            padding: 0.25rem;
        }

        .cart-item-details {
            flex-grow: 1;
            padding-left: 1.25rem;
        }

        .cart-item-title {
            font-size: 1rem;
            font-weight: 600;
            color: var(--color-texto);
            margin-bottom: 0.25rem;
        }

        .cart-item-price {
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--color-principal);
        }

        /* Controles de Cantidad (+ y -) */
        .quantity-control {
            display: flex;
            align-items: center;
            gap: 0.25rem;
            background-color: #F1F5F9;
            padding: 0.25rem;
            border-radius: 8px;
        }

        .btn-qty {
            background-color: #ffffff;
            border: 1px solid #E2E8F0;
            color: var(--color-texto);
            width: 32px;
            height: 32px;
            border-radius: 6px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }

            .btn-qty:hover {
                background-color: var(--color-principal);
                color: #ffffff;
                border-color: var(--color-principal);
                cursor: pointer;
            }

        .qty-number {
            width: 35px;
            text-align: center;
            font-size: 0.95rem;
            font-weight: 600;
        }

        /* Botón de borrar */
        .btn-delete-item {
            background: transparent;
            border: none;
            color: #A0AEC0;
            font-size: 1.25rem;
            padding: 0.5rem;
            transition: color 0.2s ease;
            margin-left: 1rem;
        }

            .btn-delete-item:hover {
                color: #E53E3E;
                cursor: pointer;
            }

        /* Resumen de Totales Lateral */
        .summary-title {
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid #EDF2F7;
            padding-bottom: 0.5rem;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.75rem;
            font-size: 0.95rem;
            color: #4A5568;
        }

        .summary-total-row {
            display: flex;
            justify-content: space-between;
            margin-top: 1.5rem;
            margin-bottom: 1.5rem;
            font-size: 1.3rem;
            font-weight: 800;
            color: var(--color-texto);
            border-top: 2px dashed #E2E8F0;
            padding-top: 1rem;
        }

        .btn-finalizar {
            background-color: var(--color-principal);
            color: #ffffff;
            border: none;
            font-weight: 700;
            padding: 0.9rem;
            border-radius: 8px;
            width: 100%;
            font-size: 1.05rem;
            transition: background-color 0.2s ease;
            display: block;
            text-align: center;
            text-decoration: none;
        }

            .btn-finalizar:hover {
                background-color: var(--color-principal-hover);
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
                            <asp:HyperLink ID="lnkProductos" runat="server" NavigateUrl="~/productos.aspx" CssClass="nav-link nav-link-custom">Productos</asp:HyperLink>
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

                        <asp:HyperLink ID="lnkCarrito" runat="server" NavigateUrl="~/carrito.aspx" CssClass="nav-icon fw-bold text-primary" ToolTip="Carrito de compras">
                            <i class="bi bi-cart3"></i>
                            <span class="cart-badge"><%= CantidadCarrito() %></span> 
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </nav>

        <!-- ================= CONTENIDO DEL CARRITO ================= -->
        <div class="container my-5">
            <h1 class="fw-bold mb-4" style="font-size: 1.75rem;"><i class="bi bi-cart3 me-2"></i>Tu Carrito de Compra</h1>

            <div class="row g-4">

                <!-- COLUMNA IZQUIERDA: LISTA DE PRODUCTOS AGREGADOS -->
                <div class="col-12 col-lg-8">
                    <div class="cart-card">

                        <!-- Producto Ejemplo 1 -->
                        <asp:Repeater ID="RepProductos" runat="server">
                            <ItemTemplate>
                                <div class="cart-item">
                                    <div class="cart-item-img-wrapper">
                                        <img src="<%# Eval("Producto.ImagenUrl") %>" class="cart-item-img" alt="Producto" />
                                    </div>
                                    <div class="cart-item-details">
                                        <h3 class="cart-item-title"><%# Eval("Producto.nombreProducto") %></h3>
                                        <p class="cart-item-price"><%# Eval("Producto.precioUnitario", "${0:F2}") %></p>
                                    </div>
                                    <!-- Control de cantidad maqueta -->
                                    <div class="quantity-control">
                                        <asp:Button ID="btnMenos" runat="server" Text="-" CssClass="btn-qty" CommandArgument='<%# Eval("Producto.idProducto") %>' OnClick="btnMenos_Click" />
                                        <span class="qty-number"><%# Eval("Cantidad") %></span>
                                        <asp:Button ID="btnMas" runat="server" Text="+" CssClass="btn-qty" CommandArgument='<%# Eval("Producto.idProducto") %>' OnClick="btnMas_Click" />
                                    </div>
                                    <!-- Botón eliminar maqueta -->
                                    <asp:Button type="button" runat="server" class="btn-delete-item" CommandArgument='<%# Eval("Producto.idProducto") %>' OnClick="btnEliminar_Click" Text="🗑"></asp:Button>
                                </div>
                            <!-- Control de cantidad maqueta -->
                                <div class="quantity-control">
                                    <asp:Button ID="btnMenos" runat="server" Text="-" CssClass="btn-qty" CommandArgument='<%# Eval("Producto.idProducto") %>' OnClick="btnMenos_Click" />
                                    <span class="qty-number"><%# Eval("Cantidad") %></span>
                                    <asp:Button ID="btnMas" runat="server" Text="+" CssClass="btn-qty" CommandArgument='<%# Eval("Producto.idProducto") %>' OnClick="btnMas_Click" />
                                </div>
                            <!-- Botón eliminar maqueta -->
                                <asp:Button ID="btnEliminar" runat="server" CssClass="btn-delete-item" CommandArgument='<%# Eval("Producto.idProducto") %>' OnClick="btnEliminar_Click" Text="🗑" />
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>




                    </div>
                </div>

                <!-- COLUMNA DERECHA: RESUMEN DE COMPRA Y TOTAL -->
                <div class="col-12 col-lg-4">
                    <div class="cart-card">
                        <h2 class="summary-title">Resumen de la Orden</h2>

                        <div class="summary-row">
                            <span>Subtotal Productos</span>
                            <span class="fw-medium">$<%= TotalCarrito().ToString("N2") %></span>
                        </div>
                        <div class="summary-row">
                            <span>Costo de Envío</span>
                            <span class="text-success fw-medium">Gratis</span>
                        </div>

                        <!-- Total de la Venta final -->
                        <div class="summary-total-row">
                            <span>Total</span>
                            <span>$<%= TotalCarrito().ToString("N2") %></span>
                        </div>

                        <!-- Botón Finalizar Venta -->
                        <asp:Button ID="btnFinalizarVenta" runat="server" Text="Finalizar Compra" CssClass="btn-finalizar" OnClick="btnFinalizarVenta_Click"/>
                    </div>
                </div>

            </div>
        </div>

                <div class="toast-container position-fixed bottom-0 start-0 p-3">
    <div id="toastError" class="toast align-items-center text-bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
        <div class="toast-body">
            <asp:Literal ID="litError" runat="server"></asp:Literal>
        </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    </div>
</div>

        <div class="modal fade" id="modalCompraExitosa" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">

            <div class="modal-body text-center p-5">

                <div class="mb-4">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 5rem;"></i>
                </div>

                <h2 class="fw-bold mb-3">
                    ¡Compra realizada con éxito!
                </h2>

                <p class="text-muted mb-4">
                    Tu pedido fue registrado correctamente y ya se encuentra
                    <strong>en proceso</strong>.
                </p>

                <div class="d-grid gap-2">
                    <asp:Button ID="btnVerVenta"
                        runat="server"
                        Text="Ver mi compra"
                        CssClass="btn btn-success btn-lg"
                        OnClick="btnVerVenta_Click" />

                    <button type="button"
                        class="btn btn-outline-secondary"
                        data-bs-dismiss="modal">
                        Seguir comprando
                    </button>
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
