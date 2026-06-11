<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="abmlVenta.aspx.cs" Inherits="Ecomerce.abmlVenta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Historial de Ventas - NL Shop</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
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
            background-color: var(--color-principal);
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

        /* Botón de acción: Ver Detalle */
        .btn-action-view {
            background-color: rgba(43, 108, 176, 0.1);
            color: var(--color-principal);
            border: none;
            padding: 0.45rem 0.8rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .btn-action-view:hover {
            background-color: var(--color-principal);
            color: white;
            cursor: pointer;
        }

        /* Ajustes Estéticos para el Modal */
        .modal-content-custom {
            border-radius: 14px;
            border: none;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .modal-header-custom {
            background-color: #F8FAFC;
            border-bottom: 1px solid #E2E8F0;
            border-top-left-radius: 14px;
            border-top-right-radius: 14px;
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
        
        <nav class="navbar navbar-expand-lg navbar-admin sticky-top">
            <div class="container">
                <div class="d-flex align-items-center gap-2">
                    <asp:HyperLink ID="lnkLogoAdmin" runat="server" NavigateUrl="~/homeAdmin.aspx" CssClass="navbar-brand-admin">
                        <i class="bi bi-shield-lock-fill me-2"></i>NL Shop
                    </asp:HyperLink>
                    <span class="badge-admin">ABML VENTAS</span>
                </div>

                <div class="ms-auto">
                    <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/homeAdmin.aspx" CssClass="btn-volver-admin">
                        <i class="bi bi-arrow-left me-1"></i>Volver al Panel
                    </asp:HyperLink>
                </div>
            </div>
        </nav>

        <div class="container my-5">
            
            <div class="abml-card">
                <h2 class="abml-title"><i class="bi bi-receipt-cutoff"></i> Registro Histórico de Ventas</h2>
                <p class="text-muted small mb-4">A continuación se listan las órdenes facturadas en la plataforma. Presione el botón de visualización para auditar el desglose de artículos de cada transacción.</p>
                
                <div class="table-responsive">
                    <table class="table table-custom table-hover mb-0">
                        <thead>
                            <tr>
                                <th style="width: 120px;">ID Venta</th>
                                <th>Fecha de Venta</th>
                                <th>DNI Cliente</th>
                                <th style="width: 180px;">Total Facturado</th>
                                <th class="text-center" style="width: 150px;">Detalles</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="fw-bold">#20441</td>
                                <td>08/06/2026 14:22</td>
                                <td>38444555</td>
                                <td class="fw-bold text-success">$ 154.990,00</td>
                                <td class="text-center">
                                    <%-- Atributos data-bs de bootstrap para levantar el modal sin código extra de ejemplo --%>
                                    <button type="button" class="btn-action-view" data-bs-toggle="modal" data-bs-target="#modalDetalleVenta">
                                        <i class="bi bi-eye-fill"></i> Ver Detalle
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="fw-bold">#20442</td>
                                <td>09/06/2026 10:05</td>
                                <td>40111222</td>
                                <td class="fw-bold text-success">$ 65.000,00</td>
                                <td class="text-center">
                                    <button type="button" class="btn-action-view" data-bs-toggle="modal" data-bs-target="#modalDetalleVenta">
                                        <i class="bi bi-eye-fill"></i> Ver Detalle
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="fw-bold">#20443</td>
                                <td>09/06/2026 15:30</td>
                                <td>35999888</td>
                                <td class="fw-bold text-success">$ 18.500,00</td>
                                <td class="text-center">
                                    <button type="button" class="btn-action-view" data-bs-toggle="modal" data-bs-target="#modalDetalleVenta">
                                        <i class="bi bi-eye-fill"></i> Ver Detalle
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <div class="modal fade" id="modalDetalleVenta" tabindex="-1" aria-labelledby="modalDetalleVentaLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content modal-content-custom">
                    
                    <div class="modal-header modal-header-custom">
                        <h5 class="modal-title fw-bold" id="modalDetalleVentaLabel">
                            <i class="bi bi-info-circle-fill text-primary me-2"></i>Desglose de Artículos - Venta #20441
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body p-4">
                        <div class="mb-3 small text-muted">
                            <span class="me-3"><strong>Cliente DNI:</strong> 38444555</span>
                            <span><strong>Fecha Operación:</strong> 08/06/2026</span>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-sm table-custom table-bordered mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Cod. Producto</th>
                                        <th>Nombre Producto</th>
                                        <th class="text-center" style="width: 100px;">Cantidad</th>
                                        <th class="text-end" style="width: 140px;">Precio Unitario</th>
                                        <th class="text-end" style="width: 140px;">Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="fw-semibold">101</td>
                                        <td>Zapatillas Running Pro</td>
                                        <td class="text-center">1</td>
                                        <td class="text-end">$ 85.000,00</td>
                                        <td class="text-end fw-semibold">$ 85.000,00</td>
                                    </tr>
                                    <tr>
                                        <td class="fw-semibold">102</td>
                                        <td>Remera Algodón Premium</td>
                                        <td class="text-center">2</td>
                                        <td class="text-end">$ 18.500,00</td>
                                        <td class="text-end fw-semibold">$ 37.000,00</td>
                                    </tr>
                                    <tr>
                                        <td class="fw-semibold">105</td>
                                        <td>Medias Deportivas Tech x3</td>
                                        <td class="text-center">4</td>
                                        <td class="text-end">$ 8.247,50</td>
                                        <td class="text-end fw-semibold">$ 32.990,00</td>
                                    </tr>
                                </tbody>
                                <tfoot class="table-light fw-bold">
                                    <tr>
                                        <td colspan="4" class="text-end">Monto Total Liquidado:</td>
                                        <td class="text-end text-success" style="font-size: 1rem;">$ 154.990,00</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    
                    <div class="modal-footer border-top-0">
                        <button type="button" class="btn btn-secondary px-4 font-weight-600 sm-btn" style="border-radius: 8px; font-size: 0.9rem;" data-bs-dismiss="modal">Cerrar Ventana</button>
                    </div>

                </div>
            </div>
        </div>

        <footer class="py-4 mt-auto">
            <div class="container text-center text-md-between d-md-flex align-items-center small">
                <p class="mb-0 text-white-50">&copy; 2026 NL Shop - Panel de Administración Seguro.</p>
                <p class="mb-0 text-white-50 mt-2 mt-md-0">Módulo: Ventas y Auditoría</p>
            </div>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>