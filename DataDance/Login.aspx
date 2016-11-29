<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DataDance.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Data Dance</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0. minimum-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">
        <div class="card card-container">
            <div class="col-md-12">
                <img src="/images/company.jpg" alt="Escuela" width='250' height="250" align="center"/>
            </div>
            <br />
            <br />
            <span id="reauth-email" class="reauth-email"></span>
                <asp:TextBox runat="server" ID="email" Placeholder="example@example.com" CssClass="form-control" required="True" TextMode="Email"></asp:TextBox><br />
                <asp:TextBox runat="server" ID="password" Placeholder="Contraseña" CssClass="form-control" required="True" TextMode="Password"></asp:TextBox><br />
                <asp:Button runat="server" ID="login_button" Text="Ingresar" CssClass="btn btn-block btn-success" OnClick="login_button_Click"/>
        </div>
    </div>
    </form>
     <script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
