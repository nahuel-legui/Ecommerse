<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="abmlProducto.aspx.cs" Inherits="Ecomerce.abmlProducto" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ABML Productos - NL Shop</title>
    
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

        /* Formulario e Inputs */
        .form-label-custom {
            font-size: 0.85rem;
            font-weight: 600;
            color: #4A5568;
            margin-bottom: 0.4rem;
            display: block;
        }

        .form-control-custom {
            width: 100%;
            padding: 0.6rem 0.75rem;
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

        /* Botones de acción formulario */
        .btn-guardar {
            background-color: var(--color-principal);
            color: white;
            font-weight: 600;
            border: none;
            padding: 0.6rem 1.5rem;
            border-radius: 8px;
            font-size: 0.9rem;
            transition: background-color 0.2s ease;
        }

        .btn-guardar:hover {
            background-color: var(--color-principal-hover);
            cursor: pointer;
        }

        .btn-cancelar {
            background-color: transparent;
            color: #718096;
            font-weight: 600;
            border: 1px solid #CBD5E0;
            padding: 0.6rem 1.5rem;
            border-radius: 8px;
            font-size: 0.9rem;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .btn-cancelar:hover {
            background-color: #E2E8F0;
            color: var(--color-texto);
            cursor: pointer;
        }

        /* Tablas de datos */
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

        /* Botones en filas */
        .btn-action-edit {
            background-color: rgba(43, 108, 176, 0.1);
            color: var(--color-principal);
            border: none;
            padding: 0.4rem 0.6rem;
            border-radius: 6px;
            transition: all 0.2s ease;
            display: inline-block;
            text-decoration: none;
        }

        .btn-action-edit:hover {
            background-color: var(--color-principal);
            color: white;
            cursor: pointer;
        }

        .btn-action-delete {
            background-color: rgba(229, 62, 98, 0.1);
            color: #E53E3E;
            border: none;
            padding: 0.4rem 0.6rem;
            border-radius: 6px;
            transition: all 0.2s ease;
            display: inline-block;
            text-decoration: none;
        }

        .btn-action-delete:hover {
            background-color: #E53E3E;
            color: white;
            cursor: pointer;
        }
        .btn-action-activate {
            background-color: rgba(56, 161, 105, 0.1);
            color: #38A169;
            border: none;
            padding: 0.4rem 0.6rem;
            border-radius: 6px;
            transition: all 0.2s ease;
            display: inline-block;
            text-decoration: none;
        }

        .btn-action-activate:hover {
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
        
        <nav class="navbar navbar-expand-lg navbar-admin sticky-top">
            <div class="container">
                <div class="d-flex align-items-center gap-2">
                    <asp:HyperLink ID="lnkLogoAdmin" runat="server" NavigateUrl="~/homeAdmin.aspx" CssClass="navbar-brand-admin">
                        <i class="bi bi-shield-lock-fill me-2"></i>NL Shop
                    </asp:HyperLink>
                    <span class="badge-admin">ABML PRODUCTOS</span>
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
                <h2 class="abml-title"><i class="bi bi-box-seam-fill"></i> Inventario de Productos</h2>
                <p class="text-muted small mb-4">Listado actual de productos en catálogo. Utilice las acciones de la derecha para modificar valores o dar de baja un producto.</p>
                
                <div class="table-responsive">
                    <table class="table table-custom table-hover mb-0">
                        <thead>
                            <tr>
                                <th style="width: 100px;">ID</th>
                                <th>Producto</th>
                                <th>Descripción</th>
                                <th style="width: 150px;">Precio Unitario</th>
                                <th style="width: 120px;">Stock</th>
                                <th class="text-center" style="width: 140px;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepProductos" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td class="fw-bold"><%# Eval("idProducto") %></td>
                                        <td><%# Eval("nombreProducto") %></td>
                                        <td class="text-muted"><%# Eval("descripcion") %></td>
                                        <td class="fw-semibold">$ <%# Eval("precioUnitario", "{0:N2}") %></td>
                                        <td>
                                            <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1"><%# Eval("stock") %> unidades</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex justify-content-center gap-2">
                                                <asp:LinkButton ID="btnEditarRow" runat="server" CssClass="btn-action-edit" ToolTip="Modificar Producto" CommandName="Editar" CommandArgument='<%# Eval("idProducto") %>' OnClick="btnEditarRow_Click">
                                                    <i class="bi bi-pencil-square"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnBorrarRow" runat="server" CssClass="btn-action-delete" ToolTip="Dar de Baja Producto" CommandName="Eliminar" CommandArgument='<%# Eval("idProducto") %>' OnClick="btnBorrarRow_Click"> 
                                                    <i class="bi bi-trash3-fill"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <asp:Label ID="lblBorrar" runat="server" Text=""></asp:Label>
                    </table>
                </div>
            </div>

           <div class="abml-card">
    <h2 class="abml-title"><i class="bi bi-pencil-fill"></i> Datos del Producto</h2>
    <p class="text-muted small mb-4">Complete el formulario para dar de alta un nuevo artículo o modificar los datos del producto seleccionado arriba.</p>
    
    <%-- Guardamos el idProducto en un campo oculto cuando editamos --%>
    <asp:HiddenField ID="hfProductoID" runat="server" />

    <div class="row g-3">
        <div class="col-md-6">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre del Producto" CssClass="form-label-custom"></asp:Label>
            <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control-custom" placeholder="Ej. Gorra Trucker Urbana"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:Label ID="lblPrecio" runat="server" Text="Precio Unitario ($)" CssClass="form-label-custom"></asp:Label>
            <asp:TextBox ID="txtPrecioUnitario" runat="server" CssClass="form-control-custom" placeholder="0.00" type="number" step="0.01"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <asp:Label ID="lblIdProducto" runat="server" Text="" Enabled="True" Visible="False"></asp:Label>
            <asp:Label ID="lblStock" runat="server" Text="Stock Inicial" CssClass="form-label-custom"></asp:Label>
            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control-custom" placeholder="0" type="number"></asp:TextBox>
        </div>
        
        <div class="col-12">
            <asp:Label ID="lblCategoria" runat="server" Text="Categoría del Producto" CssClass="form-label-custom"></asp:Label>
            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control-custom">
                <asp:ListItem Value="0">-- Seleccione una Categoría --</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-12">
            <asp:Label ID="lblImagenUrl" runat="server" Text="URL de la Imagen del Producto" CssClass="form-label-custom"></asp:Label>
            <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control-custom" placeholder="https://ejemplo.com/imagenes/producto.jpg"></asp:TextBox>
        </div>
        <div class="col-12">
            <asp:Label ID="lblDescripcion" runat="server" Text="Descripción del Producto" CssClass="form-label-custom"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control-custom" placeholder="Escriba aquí los detalles y especificaciones del producto..."></asp:TextBox>
        </div>
    </div>

    <div class="mt-4 d-flex gap-2 justify-content-end">
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar / Limpiar" CssClass="btn-cancelar" OnClick="btnCancelar_Click"/>
        <asp:Button ID="btnGuardar" runat="server" Text="Agregar Producto" CssClass="btn-guardar" OnClick="btnGuardar_Click" />
    </div>
    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
</div>
            <div class="abml-card">
    <h2 class="abml-title"><i class="bi bi-box-seam-fill"></i> Inventario de Productos Dados de Baja</h2>
    <p class="text-muted small mb-4">Listado actual de productos en catálogo dado de baja . Utilice la accion de la derecha para dar de alta un producto .</p>
    
    <div class="table-responsive">
        <table class="table table-custom table-hover mb-0">
            <thead>
                <tr>
                    <th style="width: 100px;">ID</th>
                    <th>Producto</th>
                    <th>Descripción</th>
                    <th style="width: 150px;">Precio Unitario</th>
                    <th style="width: 120px;">Stock</th>
                    <th class="text-center" style="width: 140px;">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpProductoBaja" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="fw-bold"><%# Eval("idProducto") %></td>
                            <td><%# Eval("nombreProducto") %></td>
                            <td class="text-muted"><%# Eval("descripcion") %></td>
                            <td class="fw-semibold">$ <%# Eval("precioUnitario", "{0:N2}") %></td>
                            <td>
                                <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1"><%# Eval("stock") %> unidades</span>
                            </td>
                            <td class="text-center">
                                <div class="d-flex justify-content-center gap-2">
                                   <asp:LinkButton ID="btnAltaRow" runat="server" CssClass="btn-action-activate" ToolTip="Dar de Alta / Reactivar Producto" CommandName="Alta" CommandArgument='<%# Eval("idProducto") %>' OnClick="btnAltaRow_Click">
                                        <i class="bi bi-check-circle-fill"></i>
                                   </asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
            <asp:Label ID="lblMensajeBaja" runat="server" Text=""></asp:Label>
        </table>
    </div>
</div>


        <footer class="py-4 mt-auto">
            <div class="container text-center text-md-between d-md-flex align-items-center small">
                <p class="mb-0 text-white-50">&copy; 2026 NL Shop - Panel de Administración Seguro.</p>
                <p class="mb-0 text-white-50 mt-2 mt-md-0">Módulo: Productos</p>
            </div>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>