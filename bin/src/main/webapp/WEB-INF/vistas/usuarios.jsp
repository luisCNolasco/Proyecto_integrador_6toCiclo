<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="en">
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Usuarios 4 Patitas</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 	<link rel="icon" type="image/png" href="images/favicon.png">   
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
 

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sam.css">  
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrapValidator.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
</head>
<body>
	
	<div class="container">
	    <br>&nbsp;<br>
	   <button type="button" data-toggle='modal' class='btn btn-primary' id="validateBtnw2" onclick="modalUsuarios()">Nuevo Usuario</button>
	    <br>&nbsp;<br>
	    <div id="divUsuario">
	       <table id="id_table" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Codigo</th>
															<th>Nombre</th>
															<th>Apellido</th>
															<th>DNI</th>
															<th>Contraseña</th>
															<th>Correo</th>
															<th>Distrito</th>
															<th>Tipo de usuario</th>
															<th>EDITAR</th>
															<th>ELIMINAR</th>
														</tr>
												</thead>
												<tbody>
																																		
												</tbody>
		   </table>	
		</div>
	</div>
	
	<!--  NUEVO -->
	
	<div class="modal fade" id="registroModal" tabindex="-1" role="dialog" aria-labelledby="id_mensaje" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h3 class="modal-title" id="id_mensaje"></h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	    <div class="modal-body">
	 		<div class="container">    
			  	<form  id="id_registra" action="guardarUsuario" method="POST">
			  		<input type="hidden"  id="id_codigo" name="cod_usu">
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label>Nombre</label>								
								<input type="text" class="form-control" id="nom_usu" name="nom_usu" placeholder="Ingrese el nombre del usuario">
							</div>
						</div>
					</div>
					<div class="row">	
						<div class="col-md-2">
							<div class="form-group">
								<label>Apellido</label>
								<input type="text" class="form-control" id="ape_usu" name="ape_usu" placeholder="Ingrese el apellido del usuario">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>DNI</label>
								<input type="number" class="form-control" id="dni_usu" name="dni_usu" placeholder="Ingrese número de DNI" maxlength="8">
							</div>
						</div>		
					</div>
					<div class="row">	
						<div class="col-md-2">
							<div class="form-group">
								<label>Contraseña</label>
								<input type="password" class="form-control" id="pass_usu" name="pass_usu" placeholder="Ingrese la contraseña">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Correo</label>
								<input type="email" class="form-control" id="correo_usu" name="correo_usu" placeholder="Ingrese su correo">
							</div>
						</div>		
					</div>
					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<label>Distrito</label><br>
								<select class="form-control" id="distrito" name="distrito" >
									 <option selected disabled value="-1" >[SELECCIONE]</option>											
								</select>
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label>Tipo de usuario</label><br>
								<select class="form-control" id="tipousuario" name="tipousuario" >
									 <option selected disabled value="-1" >[SELECCIONE]</option>											
								</select>
							</div>
						</div>
					</div>	
					
				</form>
			</div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onclick="postValidarRegistra()">Registrar</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="resetBtn">Cerrar</button>	        
	      </div>
	    </div>
	  </div>
	</div>							
								
<script type="text/javascript">
function tablaUsuario(){
	$("#id_table").DataTable().destroy();
	$("#id_table tbody").empty(); 
	$.getJSON("listaUsuario",{}, function (data){
		$.each(data, function(index, item){
			var editar='<button type="button" class="btn btn-success" onclick="updateUsuario('+item.cod_usu+","+
																					"'"+item.nom_usu+"',"+
																					"'"+item.ape_usu+"',"+
																					"'"+item.dni_usu+"',"+
																					"'"+item.pass_usu+"',"+
																					"'"+item.correo_usu+"',"+
																					"'"+item.distrito.cod_dis+"',"+																					
																					"'"+item.tipousuario.cod_tip_usu+"'"+')">Editar</button>';
																																										    
																								
																												    
		    var eliminar='<button type="button" class="btn btn-danger" onclick="eliminar('+item.cod_usu+')">Eliminar</button>';

			$("#id_table").append("<tr><td>"+item.cod_usu+"</td>"+
											  "<td>"+item.nom_usu+"</td>"+
											  "<td>"+item.ape_usu+"</td>"+
											  "<td>"+item.dni_usu+"</td>"+
											  "<td>"+item.pass_usu+"</td>"+
											  "<td>"+item.correo_usu+"</td>"+
											  "<td>"+item.distrito.nom_dis+"</td>"+
											  "<td>"+item.tipousuario.nom_tip_usu+"</td>"+
											  "<td>"+editar+"</td>"+
											  "<td>"+eliminar+"</td>");
		});
		$("#id_table").DataTable().draw();
		$("#id_table").DataTable();
	});
}

	$.getJSON("listaTipoUsuario", {}, function(data) {
		$.each(data, function(index, item) {
			$("#tipousuario").append("<option value='"+item.cod_tip_usu+"'>"+
					 item.nom_tip_usu+"</option>");
			});
		});

	$.getJSON("listaDistrito", {}, function(data) {
		$.each(data, function(index, item) {
			$("#distrito").append("<option value='"+item.cod_dis+"'>"+
					 item.nom_dis+"</option>");
			});
		});
		
	function modalUsuarios(){
		$('#id_registra').trigger("reset");
		$("#id_codigo").val(0);
		$("#id_mensaje").text("Registrar usuario");
		$('#registroModal').modal({backdrop: 'static', keyboard: false,show:true});  
	}

	function postValidarRegistra() {
			var validator = $('#id_registra').data('bootstrapValidator');
	        validator.validate();
	        if (validator.isValid()) {
	        	guardarUsuario();
	        }
		}
	function guardarUsuario(){

			  var formData = new FormData();
			  	formData.append("cod_usu", $("#id_codigo").val());	
	  	        formData.append("nom_usu", $("#nom_usu").val());
	  	        formData.append("ape_usu", $("#ape_usu").val());
	  	        formData.append("dni_usu", $("#dni_usu").val());
	  	        formData.append("pass_usu", $("#pass_usu").val());
	  	     	formData.append("correo_usu", $("#correo_usu").val());
	  	     	formData.append("distrito", $("#distrito").val());
	  	        formData.append("tipousuario", $("#tipousuario").val());
			
			swal({
				  title: "¿Seguro de guardar los datos?",
				  text: "",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willSave) => {
				  if (willSave) {
			   		 $.ajax({
			   				url:  'guardarUsuario',
			   				type: "POST",
			   				data: formData,
				   			enctype : 'multipart/form-data',
					        contentType : false,
					        processData : false,
					        cache:false,
			   				success:function(data){
			   					//console.log(data);
			   					if(data != null){
									swal("Registro guardado correctamente...","","success");
									tablaUsuario();
									$("#registroModal").modal("hide");
									$('#id_registra').data('bootstrapValidator').resetForm(true);
				   			    	$('#id_registra').trigger("reset");
								}
								else
									swal("Error al guardar el registro...","","error");
			   				},
			   				error: function (jqXhr) { // error callback 
			   					swal("Error ...","","error");
			   		    	}
			   			});
				  } 
				});
		}	

	function updateUsuario(cod_usu,nom_usu,ape_usu,dni_usu,pass_usu,correo_usu,distrito,tipousuario){	
		$("#id_codigo").val(cod_usu);		
		$("#nom_usu").val(nom_usu);
		$("#ape_usu").val(ape_usu);
		$("#dni_usu").val(dni_usu);
		$("#pass_usu").val(pass_usu);
		$("#correo_usu").val(correo_usu);
		$("#distrito").val(distrito);
		$("#tipousuario").val(tipousuario);

		$("#id_mensaje").text("Actualizar usuario");
		$('#registroModal').modal({backdrop: 'static',keyboard:false,show:true});
		}	
	
	function eliminar(cod_usu){		
		swal({
			  title: "¿Seguro de eliminar?",
			  text: "Se eliminará el usuario con código : "+cod_usu,
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url:'eliminaUsuario',
						type:'POST',
						data:{cod:cod_usu},
						success: function(data){
							tablaUsuario();
							swal("Sistema","Registro eliminado...","success");
						},
						error: function (e) { 
							swal("Sistema", "Disculpe, existió un problema "+e, "error");
				    	}
					});
			  }
			});
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		tablaUsuario();
		 $('#resetBtn').click(function() {
		        $('#id_registra').data('bootstrapValidator').resetForm(true);
		        $('#registroModal').modal("hide");
		    }); 
	} );
</script>
<script type="text/javascript">
$('#id_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"nom_usu":{
            selector: "#nom_usu",
            validators:{
                notEmpty: {
                     message: 'El nombre es obligatorio'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'El nombre es de 3 a 40 caracteres'
                },
	            regexp : {
						regexp : /^[a-zA-Z ]{2,40}$/,
						message : 'El nombre solamente debe contener 2 a 40 caracteres'
				}
            }
        },
        "ape_usu":{
            selector: "#ape_usu",
            validators:{
                notEmpty: {
                     message: 'El apellido es obligatorio'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'El apellido es de 3 a 40 caracteres'
                },
	            regexp : {
					regexp : /^[a-zA-Z ]{2,40}$/,
					message : 'El nombre solamente debe contener 2 a 40 caracteres'
			  }
            }
        },
        "dni_usu":{
       	 selector: "#dni_usu",
            validators:{
           	 notEmpty: {
                    message: 'El DNI es obligatorio'
               },
               stringLength: {
                   max: 8
               },
               regexp: {
					regexp: /^[0-9]{8}$/,
					message: 'El DNI tiene 8 dígitos'
	            }
            }
       },
       "pass_usu":{
        	 selector: "#pass_usu",
             validators:{
            	 notEmpty: {
                     message: 'La contraseña es obligatoria'
                }
             }
        },
       "correo_usu":{
         	 selector: "#correo_usu",
              validators:{
            	  notEmpty: {
                      message: 'El correo es obligatorio'
                 },
                 regexp: {
                     regexp: /\S+@\S+\.\S+$/,
                     message: 'El correo debe ser como similar ejemplo prueba@correo.com'
                   }
              }
         },

         "distrito":{
         	 selector: "#distrito",
              validators:{
            	  notEmpty: {
                      message: 'Seleccionar el distrito es obligatorio'
                 }
              }
         },
         "tipousuario":{
         	 selector: "#tipousuario",
              validators:{
            	  notEmpty: {
                      message: 'Seleccionar el tipo de usuario es obligatorio'
                 }
              }
         }
    } 
 });   

</script>
</body>

</html>