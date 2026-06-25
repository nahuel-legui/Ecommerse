<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="misCompras.aspx.cs" Inherits="Ecomerce.misCompras" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Mis Compras - NL Shop</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        /* Coherencia de marca e identidad visual (Estilo Home) */
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
            background-color: #1A202C;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1rem;
        }

        .navbar-brand-custom {
            font-weight: 700;
            color: #ffffff !important;
            font-size: 1.3rem;
            text-decoration: none;
        }

        .btn-volver-custom {
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

        .btn-volver-custom:hover {
            background-color: #4A5568;
            color: #ffffff;
        }

        /* --- CONTENEDORES Y TARJETAS --- */
        .compras-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .compras-title {
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

        /* Tablas de datos simplificada */
        .table-custom {
            font-size: 0.95rem;
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
            padding: 1.2rem 1rem !important;
            color: #4A5568;
            border-bottom: 1px solid #EDF2F7;
        }
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

        /* Botón Estilizado "Ver Detalles" */
        .btn-detalles-custom {
            background-color: rgba(43, 108, 176, 0.1);
            color: var(--color-principal);
            border: 1px solid rgba(43, 108, 176, 0.15);
            font-weight: 600;
            font-size: 0.85rem;
            padding: 0.4rem 1rem;
            border-radius: 6px;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
        }

        .btn-detalles-custom:hover {
            background-color: var(--color-principal);
            color: white;
            border-color: var(--color-principal);
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
        
        <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
            <div class="container">
                <div class="d-flex align-items-center gap-2">
                    <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/home.aspx" CssClass="navbar-brand-custom">
                        <i class="bi bi-bag-heart-fill me-2 text-primary"></i>NL Shop
                    </asp:HyperLink>
                </div>

                <div class="ms-auto">
                    <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/home.aspx" CssClass="btn-volver-custom">
                        <i class="bi bi-arrow-left me-1"></i>Volver a la Tienda
                    </asp:HyperLink>
                </div>
            </div>
        </nav>

        <div class="container my-5">
            
            <div class="compras-card">
                <h2 class="compras-title"><i class="bi bi-box-seam-fill text-primary"></i> Historial de mis Compras</h2>
                <p class="text-muted small mb-4">Acá podés seguir el estado de tus envíos y revisar el detalle de tus pedidos anteriores.</p>
                
                <div class="table-responsive">
                    <table class="table table-custom table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Fecha de Venta</th>
                                <th>Total de la Venta</th>
                                <th style="width: 220px;">Estado de Envío</th>
                                <th class="text-center" style="width: 160px;">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepCompras" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("fechaVenta") %>
                                        </td>
                                        
                                        <td class="fw-semibold text-dark">
                                            <%# Eval("total") %>
                                        </td>
                                            
                                        <td>
                                            <asp:Label ID="lblEstadoPaquete" runat="server" 
                                                CssClass='<%# ObtenerClasesEstado(Eval("enCamino"), Eval("entregado")) %>'>
                                                <%# ObtenerTextoEIconoEstado(Eval("enCamino"), Eval("entregado")) %>
                                            </asp:Label>
                                        </td>
                                        
                                        <td class="text-center">
                                            <button type="button" class="btn-action-view" data-bs-toggle="modal" data-bs-target="#modalDetalleVenta" onclick="mostrarDetalle(<%# Eval("idVenta") %>)">
                                                <i class="bi bi-eye-fill"></i> Ver Detalle
                                            </button>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
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
                    <i class="bi bi-info-circle-fill text-primary me-2"></i>Desglose de Artículos
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <div class="modal-body p-4">
                <div class="mb-3 small text-muted">
                    <span class="me-3"><strong>Cliente DNI:</strong> <span id="modalDni"></span></span>
                    <span><strong>Fecha Operación:</strong> <span id="modalFecha"></span></span>
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
                        <tbody id="modalDetalleBody">
                        </tbody>
                        <tfoot class="table-light fw-bold">
                            <tr>
                                <td colspan="4" class="text-end">Monto Total Liquidado:</td>
                                <td class="text-end text-success" id="modalTotal" style="font-size: 1rem;"></td>
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
                <p class="mb-0 text-white-50">&copy; 2026 NL Shop - Tus compras protegidas.</p>
                <p class="mb-0 text-white-50 mt-2 mt-md-0">Sección Clientes</p>
            </div>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
 <script>
     var ventasData = <%= VentasJson %>

     function formatearMoneda(valor) {
         return '$ ' + Number(valor).toLocaleString('es-AR', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
     }

     function mostrarDetalle(idVenta) {
         var venta = ventasData.find(function (v) { return v.idVenta === idVenta; });
         if (!venta) return;

         document.getElementById('modalDetalleVentaLabel').innerHTML =
             '<i class="bi bi-info-circle-fill text-primary me-2"></i>Desglose de Artículos - Venta #' + venta.idVenta;

         document.getElementById('modalDni').textContent = venta.dniCliente;
         document.getElementById('modalFecha').textContent = venta.fechaVenta;
         document.getElementById('modalTotal').textContent = formatearMoneda(venta.total);

         var tbody = document.getElementById('modalDetalleBody');
         tbody.innerHTML = '';

         if (!venta.detalles || venta.detalles.length === 0) {
             tbody.innerHTML = '<tr><td colspan="5" class="text-center text-muted">No hay artículos registrados para esta venta.</td></tr>';
             return;
         }

         venta.detalles.forEach(function (detalle) {
             var subtotal = detalle.cantidad * detalle.precioUnitario;
             var fila = document.createElement('tr');
             fila.innerHTML =
                 '<td class="fw-semibold">' + detalle.idProducto + '</td>' +
                 '<td>' + detalle.nombreProducto + '</td>' +
                 '<td class="text-center">' + detalle.cantidad + '</td>' +
                 '<td class="text-end">' + formatearMoneda(detalle.precioUnitario) + '</td>' +
                 '<td class="text-end fw-semibold">' + formatearMoneda(subtotal) + '</td>';
             tbody.appendChild(fila);
         });
     }
 </script>
</body>
</html>