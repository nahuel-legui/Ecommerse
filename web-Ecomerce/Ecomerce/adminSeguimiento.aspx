<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminSeguimiento.aspx.cs" Inherits="Ecomerce.adminSeguimiento" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Seguimiento de Pedidos - NL Shop</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        /* Coherencia de marca e identidad visual del Administrador */
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
            background-color: #1A202C;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1rem;
        }

        .navbar-brand-admin {
            font-weight: 700;
            color: #ffffff !important;
            font-size: 1.3rem;
            text-decoration: none;
        }

        .badge-admin {
            background-color: #4A5568;
            color: white;
            font-size: 0.75rem;
            padding: 4px 8px;
            border-radius: 6px;
            font-weight: 600;
            letter-spacing: 0.05em;
        }

        .btn-volver-admin {
            background-color: transparent;
            color: #A0AEC0;
            border: 1px solid #4A5568;
            font-weight: 500;
            font-size: 0.85rem;
            padding: 0.4rem 1rem;
            border-radius: 6px;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .btn-volver-admin:hover {
            background-color: #4A5568;
            color: #ffffff;
        }

        /* --- CONTENEDORES Y TARJETAS --- */
        .abml-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .abml-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--color-texto);
            margin-bottom: 1.5rem;
            border-bottom: 2px solid #EDF2F7;
            padding-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Tablas de datos (Simulación GridView) */
        .table-custom {
            font-size: 0.9rem;
            vertical-align: middle;
        }

        .table-custom thead {
            background-color: #F8FAFC;
            color: #4A5568;
            font-weight: 700;
        }

        .table-custom th {
            border-bottom: 2px solid #E2E8F0 !important;
            padding: 1rem !important;
        }

        .table-custom td {
            padding: 1rem !important;
            color: #4A5568;
            border-bottom: 1px solid #EDF2F7;
        }

        /* Botones de acción de estados manuales */
        .btn-status-transit {
            background-color: rgba(43, 108, 176, 0.1);
            color: var(--color-principal);
            border: 1px solid rgba(43, 108, 176, 0.2);
            padding: 0.45rem 0.75rem;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .btn-status-transit:hover {
            background-color: var(--color-principal);
            color: white;
            cursor: pointer;
        }

        .btn-status-delivered {
            background-color: rgba(56, 161, 105, 0.1);
            color: #38A169;
            border: 1px solid rgba(56, 161, 105, 0.2);
            padding: 0.45rem 0.75rem;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .btn-status-delivered:hover {
            background-color: #38A169;
            color: white;
            cursor: pointer;
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
                    <span class="badge-admin">LOGÍSTICA & SEGUIMIENTO</span>
                </div>

                <div class="ms-auto">
                    <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/homeAdmin.aspx" CssClass="btn-volver-admin">
                        <i class="bi bi-arrow-left me-1"></i>Volver al Panel
                    </asp:HyperLink>
                </div>
            </div>
        </nav>

        <!-- ================= PANEL PRINCIPAL (LISTADO DE CONTROL LOGÍSTICO) ================= -->
        <div class="container my-5">
            
            <div class="abml-card">
                <h2 class="abml-title"><i class="bi bi-truck-flatbed"></i> Monitoreo de Despacho de Ventas</h2>
                <p class="text-muted small mb-4">Panel de actualización manual de entregas. Utilice los comandos de acción por fila para despachar las órdenes en tránsito o darlas por finalizadas una vez que lleguen al comprador.</p>
                
                <div class="table-responsive">
                    <table class="table table-custom table-hover mb-0">
                        <thead>
                            <tr>
                                <th style="width: 110px;">ID Venta</th>
                                <th>Fecha Venta</th>
                                <th>DNI Cliente</th>
                                <th>Total Orden</th>
                                <th style="width: 160px;">Estado Actual</th>
                                <th class="text-center" style="width: 280px;">Cambiar Estado Manualmente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Ejemplo 1: Venta Recién Ingresada (Pendiente) -->
                            <tr>
                                <td class="fw-bold">#20441</td>
                                <td>08/06/2026 14:22</td>
                                <td>38444555</td>
                                <td class="fw-medium">$ 154.990,00</td>
                                <td>
                                    <span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle px-2 py-1 w-100 text-start">
                                        <i class="bi bi-clock me-1"></i> Pendiente
                                    </span>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center gap-2">
                                        <button type="button" class="btn-status-transit" title="Marcar En Camino">
                                            <i class="bi bi-truck"></i> En Camino
                                        </button>
                                        <button type="button" class="btn-status-delivered" title="Marcar como Entregado">
                                            <i class="bi bi-check-circle-fill"></i> Entregado
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            
                            <!-- Ejemplo 2: Venta en Tránsito (En Camino) -->
                            <tr>
                                <td class="fw-bold">#20442</td>
                                <td>09/06/2026 10:05</td>
                                <td>40111222</td>
                                <td class="fw-medium">$ 65.000,00</td>
                                <td>
                                    <span class="badge bg-warning-subtle text-warning-emphasis border border-warning-subtle px-2 py-1 w-100 text-start">
                                        <i class="bi bi-truck me-1"></i> En Camino
                                    </span>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center gap-2">
                                        <%-- Deshabilitado visualmente puesto que ya se encuentra en camino --%>
                                        <button type="button" class="btn-status-transit opacity-50" disabled="disabled" title="Ya está en camino">
                                            <i class="bi bi-truck"></i> En Camino
                                        </button>
                                        <button type="button" class="btn-status-delivered" title="Marcar como Entregado">
                                            <i class="bi bi-check-circle-fill"></i> Entregado
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Ejemplo 3: Venta Finalizada (Entregada) -->
                            <tr>
                                <td class="fw-bold">#20443</td>
                                <td>09/06/2026 15:30</td>
                                <td>35999888</td>
                                <td class="fw-medium">$ 18.500,00</td>
                                <td>
                                    <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1 w-100 text-start">
                                        <i class="bi bi-check-circle-fill me-1"></i> Entregado
                                    </span>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center gap-2">
                                        <button type="button" class="btn-status-transit opacity-50" disabled="disabled">
                                            <i class="bi bi-truck"></i> En Camino
                                        </button>
                                        <button type="button" class="btn-status-delivered opacity-50" disabled="disabled">
                                            <i class="bi bi-check-circle-fill"></i> Entregado
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

        <!-- ================= FOOTER EXCLUSIVO ADMIN ================= -->
        <footer class="py-4 mt-auto">
            <div class="container text-center text-md-between d-md-flex align-items-center small">
                <p class="mb-0 text-white-50">&copy; 2026 NL Shop - Panel de Administración Seguro.</p>
                <p class="mb-0 text-white-50 mt-2 mt-md-0">Módulo: Gestión de Envíos</p>
            </div>
        </footer>

    </form>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>