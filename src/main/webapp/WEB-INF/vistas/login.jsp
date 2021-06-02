<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Iniciar Sesión</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="images/favicon.png">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>    
        
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">


    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sam.css">
	    
	<!-- <link rel="stylesheet" href="css/bootstrap.min.css"/>-->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
	<link rel="stylesheet" href="css/bootstrapValidator.css"/>
	<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
	
	<style type="text/css">
	 
	 .text-tabs {
	  color: black;
	  font-weight: bold;
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

                <a href="login" class="d-flex align-items-center justify-content-center"><span class="fa fa-user"><i class="sr-only"></i></span></a>
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
	        	<li class="nav-item"><a href="/" class="nav-link">Inicio</a></li>

	          <li class="nav-item"><a href="/galeria" class="nav-link">Galería</a></li>
	          <li class="nav-item"><a href="/mascota" class="nav-link">Mascotas</a></li>
	          <li class="nav-item"><a href="/producto" class="nav-link">Productos</a></li>
	          <li class="nav-item"><a href="/servicio" class="nav-link">Servicios</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

<div id="fw-container" class="fw-container">
  <div class="container sam-lisu">
  <!-- Nav tabs -->
  
  <ul id="tabs" class="nav nav-tabs" role="tablist">
    <li class="nav-item"><a id="resetBtn1" class="nav-link active text-tabs" role="tab" data-toggle="tab" href="#login">INICIAR SESIÓN</a></li>
    <li class="nav-item"><a id="resetBtn2" class="nav-link text-tabs" role="tab" data-toggle="tab" href="#registrar" onclick="modalUsuario()">REGISTRARSE</a></li>
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
	
    <div id="login" class="tab-pane fade show active"><br>
    	<form action="iniciarSesion" method="POST" id="id_login" name="contactForm" class="contactForm">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group w-50">
						<label class="label sam-form-label" for="form-dniLogin">DNI</label>
						<input type="text" class="form-control sam-form-input" name="dni_usu" maxlength="8" placeholder="Ingrese su DNI">
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
    <div id="registrar" class="tab-pane fade"><br>
     	  <form action="saveUsuario" method="POST" id="id_registrar" name="contactForm" class="contactForm">
			<input type="hidden" id="cod_usu" name="cod_usu">     
			<input type="hidden" id="tipousuario" name="tipousuario">     	  
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

$(document).ready(function(){
	 $('#resetBtn1').click(function() {
	        $('#id_registrar').data('bootstrapValidator').resetForm(true);
	        $('#registrar').modal("hide");
	  }); 
	    
	 $('#resetBtn2').click(function() {
	        $('#id_login').data('bootstrapValidator').resetForm(true);
	        $('#login').modal("hide");
	    }); 
	
    $("#tabs a").click(function(e){
        e.preventDefault();
        $(this).tab('show');
    });
});
</script>


<script type="text/javascript">
function modalUsuario(){
	$('#id_registrar').trigger("reset");
	$("#cod_usu").val(0);
	$("#tipousuario").val(3);
}

$.getJSON("listaDistrito", {}, function(data){
	$.each(data, function(i,item){
		$("#distrito").append("<option value="+item.cod_dis +">"+ item.nom_dis +"</option>");
	});
});

$("#id_btn_registra").click(function(){
	var validator = $('#id_registrar').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {      
        saveUsuario();
    }
});

function limpiarformulario(){
	$("#cod_usu").val("");
	$("#nom_usu").val("");
	$("#ape_usu").val("");
	$("#dni_usu").val("");
	$("#pass_usu").val("");
	$("#correo_usu").val("");
	$("#distrito").val("");
	$("#tipousuario").val("");
	
}

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
				    	limpiarformulario();
				    	location. reload();
						//$('#registrar').modal("hide");
					},
					error: function (e) { 
						swal("Sistema", "Disculpe, existiÃ³ un problema", "error");
			    	}
				})
		  } 
		});
}
</script>


<script type="text/javascript">
$(document).ready(function() {
    $('#id_login').bootstrapValidator({
        message:'This value is not valid',
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
                    },
                    stringLength: {
                        max: 8,
                        message: 'El DNI tiene maximo 8 dígitos'
                    },
                    regexp: {
     					regexp: /^[0-9]{8}$/,
     					message: 'Ejemplo 12345678 DNI tiene 8 dígitos'
     	            }
                }
            },
            pass_usu: {
                validators: {
                    notEmpty: {
                        message: 'La contraseÃ±a es un campo obligatorio.'
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
                    stringLength: {
                        min: 2,
                        max: 40,
                        message: 'El nombre es de 2 a 40 caracteres'
                    },
    	            regexp : {
    						regexp : /^[a-zA-Z ]{2,40}$/,
    						message : 'El nombre solamente debe contener 2 a 40 caracteres'
    				}
                }
            },
            "ape_usu": {
        		selector : '#ape_usu',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength: {
                        min: 2,
                        max: 40,
                        message: 'El apellido es de 2 a 40 caracteres'
                    },
    	            regexp : {
    					regexp : /^[a-zA-Z ]{2,40}$/,
    					message : 'El nombre solamente debe contener 2 a 40 caracteres'
    			  }
                }
            },
            "dni_usu": {
        		selector : '#dni_usu',
                validators: {
                	notEmpty: {
                        message: 'El nÃºmero de DNI es un campo obligatorio'
                    },
                    regexp: {
						regexp: /[0-9]{8}$/,
						message: 'El DNI tiene 8 dÃ­gitos'
		            }        
                }
            },
            "pass_usu": {
        		selector : '#pass_usu',
                validators: {
                	notEmpty: {
                        message: 'La contraseÃ±a es un campo obligatorio'
                    },
                    
                }
            },
            "correo_usu": {
        		selector : '#correo_usu',
                validators: {
                	notEmpty: {
                        message: 'El correo es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /\S+@\S+\.\S+$/,
                        message: 'El correo debe ser como similar ejemplo prueba@correo.com'
                     }
                }
            },
            "distrito.cod_dis": {
        		selector : '#distrito',
                validators: {
                	notEmpty: {
                        message: 'El distrito un campo obligatorio'
                    },
                }
            }
        	
        }   
    });
</script>
  </body>
</html>
