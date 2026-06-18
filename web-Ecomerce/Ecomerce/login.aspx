<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Ecomerce.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Iniciar Sesión - E-commerce</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />

    <style>
        
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
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 15px;
        }

        .login-card {
            background: #ffffff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            padding: 2.5rem 2rem;
        }

        .login-title {
            font-weight: 700;
            color: var(--color-texto);
            font-size: 1.75rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-label-custom {
            font-size: 0.9rem;
            font-weight: 600;
            color: #4A5568;
            margin-bottom: 0.5rem;
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
            font-size: 1.1rem;
            z-index: 10;
        }

        .form-control-custom {
            width: 100%;
            padding: 0.75rem 0.75rem 0.75rem 2.5rem; 
            font-size: 0.95rem;
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

        
        .btn-principal {
            background-color: var(--color-principal);
            color: #ffffff;
            font-weight: 600;
            padding: 0.75rem;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 1rem;
            transition: background-color 0.2s ease;
            margin-top: 0.5rem;
            margin-bottom: 1.25rem;
        }

        .btn-principal:hover {
            background-color: var(--color-principal-hover);
            color: #ffffff;
            cursor: pointer;
        }

        
        .login-footer {
            text-align: center;
            font-size: 0.9rem;
        }

        .link-custom {
            color: var(--color-principal);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .link-custom:hover {
            color: var(--color-principal-hover);
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="login-container">
        <div class="login-card">
            
            <h1 class="login-title">
                <asp:Label ID="Label1" runat="server" Text="Iniciar sesión"></asp:Label>
            </h1>
            
            <div class="mb-3">
                <asp:Label ID="Label2" runat="server" Text="Email" CssClass="form-label-custom"></asp:Label>
                <div class="input-group-custom">
                    <i class="bi bi-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control-custom" placeholder="ejemplo@correo.com"></asp:TextBox>
                </div>
            </div>

            <div class="mb-3">
                <asp:Label ID="Label3" runat="server" Text="Contraseña" CssClass="form-label-custom"></asp:Label>
                <div class="input-group-custom">
                    <i class="bi bi-lock"></i>
                    <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" CssClass="form-control-custom" placeholder="••••••••"></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="btnInciar" runat="server" Text="Ingresar" CssClass="btn-principal" OnClick="btnInciar_Click"/>

            <div class="login-footer">
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                <br />
                <span class="text-muted">¿No tienes cuenta?</span> 
                <asp:HyperLink ID="hypLinkCrear" runat="server" NavigateUrl="~/registrarse.aspx" CssClass="link-custom">Crear una cuenta</asp:HyperLink>
            </div>

        </div>
    </form>

   
</body>
</html>