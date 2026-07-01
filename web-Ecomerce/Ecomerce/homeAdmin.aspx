<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homeAdmin.aspx.cs" Inherits="Ecomerce.homeAdmin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Panel de Administración - NL Shop</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        /* Mantenemos la identidad visual del proyecto */
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

        /* --- HEADER / NAVBAR ADMINISTRADOR --- */
        .navbar-admin {
            background-color: #1A202C; /* Color oscuro para diferenciar el entorno Admin del cliente */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1rem;
        }

        .navbar-brand-admin {
            font-weight: 700;
            color: #ffffff !important;
            font-size: 1.3rem;
        }

        .badge-admin {
            background-color: var(--color-principal);
            color: white;
            font-size: 0.75rem;
            padding: 4px 8px;
            border-radius: 6px;
            font-weight: 600;
            letter-spacing: 0.05em;
        }

        .btn-logout-admin {
            background-color: transparent;
            color: #E53E3E;
            border: 1px solid #E53E3E;
            font-weight: 600;
            font-size: 0.85rem;
            padding: 0.4rem 1rem;
            border-radius: 6px;
            transition: all 0.2s ease;
            text-decoration: none;
        }

            .btn-logout-admin:hover {
                background-color: #E53E3E;
                color: #ffffff;
            }

        /* --- TARJETAS DEL DASHBOARD (MÓDULOS) --- */
        .dashboard-title {
            font-weight: 700;
            color: var(--color-texto);
            font-size: 1.75rem;
        }

        .admin-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            padding: 2rem 1.5rem;
            text-align: center;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            text-decoration: none !important; /* Quita subrayado de links */
            color: var(--color-texto) !important;
        }

            .admin-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 25px rgba(43, 108, 176, 0.1);
                border-bottom: 4px solid var(--color-principal);
            }

        .admin-icon-wrapper {
            width: 65px;
            height: 65px;
            background-color: rgba(43, 108, 176, 0.08);
            color: var(--color-principal);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin-bottom: 1.25rem;
            transition: all 0.2s ease;
        }

        .admin-card:hover .admin-icon-wrapper {
            background-color: var(--color-principal);
            color: #ffffff;
        }

        .module-title {
            font-size: 1.15rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .module-description {
            font-size: 0.85rem;
            color: #718096;
            line-height: 1.5;
            margin-bottom: 0;
        }

        .iconoAdmin {
            font-size: 1.2rem;
            color: white;
        }

        /* --- FOOTER --- */
        footer {
            background-color: #1A202C;
            color: #A0AEC0;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- ================= NAVBAR ADMINISTRADOR ================= -->
        <nav class="navbar navbar-expand-lg navbar-admin sticky-top">
            <div class="container">
                <div class="d-flex align-items-center gap-2">
                    <asp:HyperLink ID="lnkLogoAdmin" runat="server" NavigateUrl="~/homeAdmin.aspx" CssClass="navbar-brand-admin">
                        <i class="bi bi-shield-lock-fill me-2"></i>NL Shop
                    </asp:HyperLink>
                    <span class="badge-admin">PANEL CONTROL</span>
                </div>

                <div class="ms-auto d-flex align-items-center gap-3">

                    <i class="bi bi-person-circle me-1 iconoAdmin "></i>
                    <asp:Label ID="lblNombreAdmin" runat="server" Text="" CssClass="text-white-50 small d-none d-sm-inline iconoAdmin ">
                    </asp:Label>
                    <asp:LinkButton ID="btnSalir" runat="server" CssClass="btn-logout-admin" OnClick="btnSalir_Click">
                        <i class="bi bi-box-arrow-right me-1"></i>Salir
                    </asp:LinkButton>

                </div>
            </div>
        </nav>

        <!-- ================= PANEL PRINCIPAL / MENÚ GENERAL ================= -->
        <div class="container my-5">
            <div class="mb-4">
                <h1 class="dashboard-title">¡Bienvenido Administrador!</h1>
                <p class="text-muted">Selecciona uno de los siguientes módulos para gestionar el e-commerce.</p>
            </div>

            <!-- Rejilla de Accesos a Páginas ABML y Gestión Centrada -->
            <div class="row g-4 justify-content-center">

                <!-- Tarjeta 1: ABML Cliente -->
                <div class="col-12 col-sm-6 col-md-4">
                    <asp:HyperLink ID="lnkAbmlCliente" runat="server" NavigateUrl="~/abmlCliente.aspx" CssClass="admin-card">
                <div class="admin-icon-wrapper">
                    <i class="bi bi-people-fill"></i>
                </div>
                <h3 class="module-title">ABML Clientes</h3>
                <p class="module-description">Alta, baja, modificación y listado de todas las cuentas de usuarios de la tienda.</p>
                    </asp:HyperLink>
                </div>

                <!-- Tarjeta 2: ABML Producto -->
                <div class="col-12 col-sm-6 col-md-4">
                    <asp:HyperLink ID="lnkAbmlProducto" runat="server" NavigateUrl="~/abmlProducto.aspx" CssClass="admin-card">
                <div class="admin-icon-wrapper">
                    <i class="bi bi-box-seam-fill"></i>
                </div>
                <h3 class="module-title">ABML Productos</h3>
                <p class="module-description">Administra el stock, añade nuevos artículos, cambia precios y edita las categorías.</p>
                    </asp:HyperLink>
                </div>

                <!-- Tarjeta 3: ABML Venta (Removido el offset para que fluya en la segunda fila centrado) -->
                <div class="col-12 col-sm-6 col-md-4">
                    <asp:HyperLink ID="lnkAbmlVenta" runat="server" NavigateUrl="~/abmlVenta.aspx" CssClass="admin-card">
                <div class="admin-icon-wrapper">
                    <i class="bi bi-receipt"></i>
                </div>
                <h3 class="module-title">ABML Ventas</h3>
                <p class="module-description">Control de transacciones efectuadas, edición de comprobantes y anulaciones de órdenes.</p>
                    </asp:HyperLink>
                </div>

                <!-- Tarjeta 4: Seguimiento (Removido el offset para que fluya en la segunda fila centrado) -->
                <div class="col-12 col-sm-6 col-md-4">
                    <asp:HyperLink ID="lnkSeguimiento" runat="server" CssClass="admin-card" NavigateUrl="~/adminSeguimiento.aspx">
                <div class="admin-icon-wrapper">
                    <i class="bi bi-truck-flatbed"></i>
                </div>
                <h3 class="module-title">Seguimiento</h3>
                <p class="module-description">Monitorea los despachos, actualiza los estados de envío (Pendiente, Enviado, Entregado).</p>
                    </asp:HyperLink>
                </div>

            </div>
        </div>

        <!-- ================= FOOTER EXCLUSIVO ENTORNO ADMIN ================= -->
        <footer class="py-4 mt-auto">
            <div class="container text-center text-md-between d-md-flex align-items-center small">
                <p class="mb-0 text-white-50">&copy; 2026 NL Shop - Panel de Administración Seguro.</p>
                <p class="mb-0 text-white-50 mt-2 mt-md-0">Version 2.4.0 (Modo Supervisor)</p>
            </div>
        </footer>

    </form>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
