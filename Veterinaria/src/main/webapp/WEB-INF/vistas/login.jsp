<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Iniciar Sesión</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="images/favicon.png">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">


    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sam.css">
	    
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
	<link rel="stylesheet" href="css/bootstrapValidator.css"/>
	<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>

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
      <a class="nav-link" data-toggle="tab" href="#login">INICIAR SESIÓN</a>
    </li>
    <li>
      <a class="nav-link" data-toggle="tab" href="#registrar" onclick="modalUsuario()">REGISTRARSE</a>
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
    	<form action="login" method="POST" id="contactForm" name="contactForm" class="contactForm">
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
				<div class="col-md-6">
					<div class="form-group">
						<input type="submit" value="Ingresar" class="btn btn-primary">
					</div>
				</div>
			</div>
		</form>
   </div>
    <!-- CONTENIDO TAB 2 -->
     <div id="registrar" class="container tab-pane"><br>
     	  <form action="saveUsuario" method="POST" id="id_registrar" name="contactForm" class="contactForm">
			<input type="hidden" id="cod_usu" name="cod_usu">     	  
			<div class="row">
				<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Nombres</label>
					<input class="form-control" id="nom_usu" name="nom_usu" placeholder="Ingrese su Nombre" type="text" maxlength="40"/>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Apellidos</label>
					<input class="form-control" id="ape_usu" name="ape_usu" placeholder="Ingrese su Apellido" type="text" maxlength="60"/>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">DNI</label>
					<input class="form-control" id="dni_usu" name="dni_usu" placeholder="Ingrese su número de DNI" type="text" maxlength="8"/>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Clave</label>
					<input class="form-control" id="pass_usu" name="pass_usu" placeholder="Ingrese su contraseña" type="password" />
				</div>
			</div>	
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Correo</label>
					<input class="form-control" id="correo_usu" name="correo_usu" placeholder="Ingrese su correo" type="email"/>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Distrito</label><br>
					<select id="distrito" name="distrito" class='form-control'>
							<option value=" ">[Seleccione]</option>    
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="label sam-form-label" for="subject">Tipo de Usuario</label><br>
					<select id="tipousuario" name="tipousuario" class='form-control'>
							<option value=" ">[Seleccione]</option>    
					</select>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="id_btn_registra">Registrarse</button>
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


  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script> 
  <script src="js/main.js"></script> 
  <script src="js/sam.js"></script>
  <script type="text/javascript" src="js/bootstrapValidator.min.js"></script> 


<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


<script type="text/javascript">
function modalUsuario(){
	$('#id_registrar').trigger("reset");
	$("#cod_usu").val(0);
}

$.getJSON("listaDistrito", {}, function(data){
	$.each(data, function(i,item){
		$("#distrito").append("<option value="+item.cod_dis +">"+ item.nom_dis +"</option>");
	});
});

$.getJSON("listaTipoUsuario", {}, function(data){
	$.each(data, function(i,item){
		$("#tipousuario").append("<option value="+item.cod_tip_usu +">"+ item.nom_tip_usu +"</option>");
	});
});

$("#id_btn_registra").click(function(){
	var validator = $('#id_registrar').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {      
        saveUsuario();
    }
});

function saveUsuario(){
	 var formData = new FormData();
	   formData.append("cod_usu", $("#cod_usu").val());	
       formData.append("nom_usu", $("#nom_usu").val());
       formData.append("ape_usu", $("#ape_usu").val());
       formData.append("dni_usu", $("#dni_usu").val());
       formData.append("pass_usu", $("#pass_usu").val());
       formData.append("correo_usu", $("#correo_usu").val());
       formData.append("distrito", $("#distrito").val());
       formData.append("tipousuario", $("#tipousuario").val());
       
	swal({
		  title: "Seguro de Guardar?",
		  text: "",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willSave) => {
		  if (willSave) {
			  $.ajax({
					url:  'saveUsuario',
					type: 'POST',
					dataType: "html",
		            data: formData,
		            enctype : 'multipart/form-data',
			        contentType : false,
			        processData : false,
			        cache:false,
					success:function(data){
						//console.log(data);						
				    	swal("Sistema","Registro Guardado...","success");
						$('#registrar').modal("hide");
					},
					error: function (e) { 
						swal("Sistema", "Disculpe, existió un problema", "error");
			    	}
				})
		  } 
		});
}
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


<script type="text/javascript">
	$('#id_registrar').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nom_usu": {
        		selector : '#nom_usu',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 3 a 40 caracteres',
                    	min : 3,
                    	max : 40
                    }
                }
            },
            "ape_usu": {
        		selector : '#ape_usu',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido es de 3 a 60 caracteres',
                    	min : 3,
                    	max : 60
                    }
                }
            },
            "dni_usu": {
        		selector : '#dni_usu',
                validators: {
                	notEmpty: {
                        message: 'El número de DNI es un campo obligatorio'
                    },
                    regexp: {
						regexp: /[0-9]{8}$/,
						message: 'El DNI tiene 8 dígitos'
		            }        
                }
            },
            "pass_usu": {
        		selector : '#pass_usu',
                validators: {
                	notEmpty: {
                        message: 'La contraseña es un campo obligatorio'
                    },
                    
                }
            },
            "correo_usu": {
        		selector : '#correo_usu',
                validators: {
                	notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },
                }
            },
            "distrito.cod_dis": {
        		selector : '#distrito',
                validators: {
                	notEmpty: {
                        message: 'El distrito un campo obligatorio'
                    },
                }
            },
            "tipousuario.cod_tip_usu": {
        		selector : '#tipousuario',
                validators: {
                	notEmpty: {
                        message: 'El tipo de usuario es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>
  </body>
</html>