<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Iniciar Sesión</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="images/favicon.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sam.css">
    <link rel="stylesheet" href="css/bootstrapValidator.min.css">
    
    <style>
    .has-error .help-block {
	  color: red;
	  font-family: Arial, Helvetica, sans-serif;
	  font-size: large;
	}
    </style>
    
  </head>
  <body>

    <div class="wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-6 d-flex align-items-center">
						<p class="mb-0 phone pl-md-2">
							<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span> +51 971 893 196</a> 
							<a href="#"><span class="fa fa-paper-plane mr-1"></span> contacto@4patitas.com</a>
						</p>
					</div>
					<div class="col-md-6 d-flex justify-content-md-end">
						<div class="social-media">
			    		<p id="sam-login" class="mb-0 d-flex align-items-center text-light sam-login">
                <a href="/login" class="d-flex align-items-center justify-content-center"><span class="fa fa-user"><i class="sr-only"></i></span></a>
                <span>Iniciar Sesión</span>
			    		</p>
		        </div>
					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	<a class="navbar-brand" href="/"><span class="flaticon-pawprint-1 mr-2"></span>4 PATITAS</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item"><a href="index.html" class="nav-link">Inicio</a></li>
	        	
	          <li class="nav-item"><a href="galeria.html" class="nav-link">Galería</a></li>
	          <li class="nav-item"><a href="crud_mascota.html" class="nav-link">Mis Mascotas</a></li>
	          <li class="nav-item"><a href="crud_producto.html" class="nav-link">Productos</a></li>
	          <li class="nav-item"><a href="crud_servicio.html" class="nav-link">Servicios</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

<div id="fw-container" class="fw-container">
	<div class="container sam-lisu">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li id="sam-login-tab" class="nav-item">
      <a  class="nav-link active" data-toggle="tab" href="#login">INICIAR SESIÓN</a>
    </li>
    <li class="nav-item">
      <a id="sam-signup-tab" class="nav-link" data-toggle="tab" href="#signup">REGISTRARSE</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  	<!-- CONTENIDO TAB 1 -->
  	<c:if test="${requestScope.mensaje != null}">
               		<div class="alert alert-danger fade in" id="success-alert">
				        <a href="#" class="close" data-dismiss="alert">&times;</a>
				        <strong>${requestScope.mensaje}</strong>
				    </div>
	</c:if> 
    <div id="login" class="container tab-pane active"><br>
    	<form action="login" method="POST">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group w-50">
						<label class="label sam-form-label" for="form-dniLogin">DNI</label>
						<input type="text" class="form-control sam-form-input" name="dni_usu" placeholder="Ingrese su DNI">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group w-50">
						<label class="label sam-form-label" for="form-passwordLogin">Clave</label>
						<input type="password" class="form-control sam-form-input" name="pass_usu" placeholder="Ingrese su Contraseña">
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<input type="submit" value="Ingresar" class="btn btn-primary">
					</div>
				</div>
			</div>
		</form>
   </div>
    <!-- CONTENIDO TAB 2 -->
     <div id="signup" class="container tab-pane fade sam-tab-signup"><br>
      <form action="" method="POST" id="contactForm" name="contactForm" class="contactForm">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="form-name">Nombres</label>
					<input type="text" class="form-control sam-form-input" name="nom_usu" placeholder="Ingrese sus Nombres">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="form-surname">Apellidos</label>
					<input type="text" class="form-control sam-form-input" name="ape_usu" placeholder="Ingrese sus Apellidos">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="form-dniRegistrar">DNI</label>
					<input type="number" class="form-control sam-form-input" name="dni_usu" placeholder="Ingrese su Dni">
				</div>
			</div>	
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="form-address">Dirección</label>
					<input type="email" class="form-control sam-form-input" name="dir_usu" placeholder="Ingrese su Dirección">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="form-email">Email</label>
					<input type="email" class="form-control sam-form-input" name="correo_usu" placeholder="Ingrese su Correo Electrónico">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="form-passwordRegistrar">Clave</label>
					<input type="password" class="form-control sam-form-input" name="pass_usu" placeholder="Ingrese su Contraseña">
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<input type="submit" value="Registrarse" class="btn btn-primary">
				</div>
			</div>
		</div>
	</form>
    </div>
  </div>
 </div>
</div>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-1.4.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>  
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script> 
  <script src="js/main.js"></script> 
  <script src="js/sam.js"></script>     
  <script src="js/bootstrapValidator.min.js"></script>


<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


<script type="text/javascript">
$(document).ready(function() {
    $('#login').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	dni_usu: {
                validators: {
                    notEmpty: {
                        message: 'El DNI es un campo obligatorio.'
                    }
                }
            },
            pass_usu: {
                validators: {
                    notEmpty: {
                        message: 'La contraseña es un campo obligatorio.'
                    }
                }
            }
        }   
    });
});
</script>

    
  </body>
</html>