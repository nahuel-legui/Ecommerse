<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="abmlCliente.aspx.cs" Inherits="Ecomerce.abmlCliente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Consulta y Baja de Clientes - NL Shop</title>
    
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
            background-color: #E53E3E; /* Color rojo sutil para indicar Baja/Eliminación */
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
            font-size: 0.85rem; /* Ajustado ligeramente el tamaño de fuente para acomodar todos los campos */
            vertical-align: middle;
        }

        .table-custom thead {
            background-color: #F8FAFC;
            color: #4A5568;
            font-weight: 700;
        }

        .table-custom th {
            border-bottom: 2px solid #E2E8F0 !important;
            padding: 1rem 0.75rem !important;
        }

        .table-custom td {
            padding: 1rem 0.75rem !important;
            color: #4A5568;
            border-bottom: 1px solid #EDF2F7;
        }

        /* Botón de acción único: Eliminar */
        .btn-action-delete {
            background-color: rgba(229, 62, 98, 0.1);
            color: #E53E3E;
            border: none;
            padding: 0.45rem 0.75rem;
            border-radius: 6px;
            text-decoration:none;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .btn-action-delete:hover {
            background-color: #E53E3E;
            color: white;
            cursor: pointer;
        }

        /* --- FOOTER --- */
        footer {
            background-color: #1A202C;
            color: #A0AEC0;
            margin-top: auto;
        }
        .auto-style1 {
            width: 98px;
        }
        /* Botón de acción rápido: Alta (Verde) */
        .btn-action-success-custom {
            background-color: rgba(56, 161, 105, 0.1);
            color: #38A169;
            border: none;
            padding: 0.45rem 0.75rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            text-decoration: none; /* Quita el subrayado clásico de los enlaces */
        }

        .btn-action-success-custom:hover {
            background-color: #38A169;
            color: white;
            cursor: pointer;
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
                    <span class="badge-admin">BAJA DE CLIENTES</span>
                </div>

                <div class="ms-auto">
                    <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/homeAdmin.aspx" CssClass="btn-volver-admin">
                        <i class="bi bi-arrow-left me-1"></i>Volver al Panel
                    </asp:HyperLink>
                </div>
            </div>
        </nav>

        <!-- ================= PANEL PRINCIPAL DEL LISTADO ================= -->
        <div class="container my-5">
            
            <div class="abml-card">
                <h2 class="abml-title"><i class="bi bi-people-fill"></i> Listado y Control de Bajas</h2>
                <p class="text-muted small mb-4">A continuación se detallan los clientes registrados en el sistema. Utilice el botón de acción para remover o dar de baja permanentemente a un usuario.</p>
                
                <div class="table-responsive">
                    <%-- Tabla mapeada con las propiedades del backend C# --%>
                    <table class="table table-custom table-hover mb-0">
                        <thead>
                            <tr>
                                <th>DNI</th>
                                <th class="auto-style1">Apellido</th>
                                <th>Nombre</th>
                                <th>Correo Electrónico</th>
                                <th>Dirección</th>
                                <th>Localidad</th>
                                <th>F. Nacimiento</th>
                                <th class="text-center" style="width: 130px;">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Cliente Ejemplo 1 -->
                            <asp:Repeater ID="RepClientes" runat="server">
                                <itemTemplate>
                                    <tr>
                                        <td class="fw-bold"><%# Eval("dni") %></td>
                                        <td><%# Eval("apellido") %></td>
                                        <td><%# Eval("nombre") %></td>
                                        <td><%# Eval("correoElectronico") %></td>
                                        <td><%# Eval("direccion") %></td>
                                        <td><%# Eval("localidad") %></td>
                                        <td><%# Eval("fechaNacimiento") %></td>
                                        <td class="text-center">
                                            <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn-action-delete" ToolTip="Eliminar Cliente permanentemente" CommandName="borrar" CommandArgument='<%# Eval("dni") %>' OnClick="btnEliminar_Click">
                                                 <i class="bi bi-trash3-fill"></i> Eliminar
                                            </asp:LinkButton>
                                        </td>
                                    </tr>

                                </itemTemplate>
                            </asp:Repeater>
                           
                        </tbody>
                    </table>
                </div>
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </div>

            <div class="abml-card">
    <h2 class="abml-title"><i class="bi bi-people-fill"></i> Listado y Control de Altas</h2>
    <p class="text-muted small mb-4">A continuación se detallan los clientes dados de baja registrados en el sistema. Utilice el botón de acción para dar de alta a un usuario.</p>
    
    <div class="table-responsive">
        <%-- Tabla mapeada con las propiedades del backend C# --%>
        <table class="table table-custom table-hover mb-0">
            <thead>
                <tr>
                    <th>DNI</th>
                    <th class="auto-style1">Apellido</th>
                    <th>Nombre</th>
                    <th>Correo Electrónico</th>
                    <th>Dirección</th>
                    <th>Localidad</th>
                    <th>F. Nacimiento</th>
                    <th class="text-center" style="width: 130px;">Acción</th>
                </tr>
            </thead>
            <tbody>
                <!-- Cliente Ejemplo 1 -->
                <asp:Repeater ID="RepClientesBaja" runat="server">
                    <itemTemplate>
                        <tr>
                            <td class="fw-bold"><%# Eval("dni") %></td>
                            <td><%# Eval("apellido") %></td>
                            <td><%# Eval("nombre") %></td>
                            <td><%# Eval("correoElectronico") %></td>
                            <td><%# Eval("direccion") %></td>
                            <td><%# Eval("localidad") %></td>
                            <td><%# Eval("fechaNacimiento") %></td>
                            <td class="text-center">
                               <asp:LinkButton ID="btnAlta" runat="server" CssClass="btn-action-success-custom" ToolTip="Dar de Alta Cliente" CommandName="alta" CommandArgument='<%# Eval("dni") %>' OnClick="btnAlta_Click">
                                    <i class="bi bi-check-circle-fill"></i> Alta
                                </asp:LinkButton>
                            </td>
                        </tr>

                    </itemTemplate>
                </asp:Repeater>
               
            </tbody>
        </table>
    </div>
    <asp:Label ID="lblMensajeAlta" runat="server" Text=""></asp:Label>
</div>
        </div>

        <!-- ================= FOOTER EXCLUSIVO ADMIN ================= -->
        <footer class="py-4 mt-auto">
            <div class="container text-center text-md-between d-md-flex align-items-center small">
                <p class="mb-0 text-white-50">&copy; 2026 NL Shop - Panel de Administración Seguro.</p>
                <p class="mb-0 text-white-50 mt-2 mt-md-0">Módulo: Clientes (Bajas)</p>
            </div>
        </footer>

    </form>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>