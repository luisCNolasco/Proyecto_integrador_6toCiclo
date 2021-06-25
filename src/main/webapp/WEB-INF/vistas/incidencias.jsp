<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="en">
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Servicios 4 Patitas</title>
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
	   <button type="button" data-toggle='modal' class='btn btn-primary' id="validateBtnw2" onclick="modalIncidencias()">Nueva Incidencia</button>
	    <br>&nbsp;<br>
	    <div id="divServicio">
	       <table id="id_table" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Codigo</th>
															<th>Usuario</th>
															<th>Mascota</th>
															<th>Descripción</th>
															<th>Recomendación</th>
															<th>ELIMINAR</th>
														</tr>
												</thead>
												<tbody>
																																		
												</tbody>
		   </table>	
		</div>
	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="id_mensaje" aria-hidden="true">
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
			  	<form  id="id_registra" action="registraIncidencia" method="POST">
			  		<input type="hidden"  id="id_codigo" name="cod_inc">
					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<label>Usuario</label><br>
								<select class="form-control" id="usuario" name="usuario" >
									 <option selected disabled value="-1" >[SELECCIONE]</option>											
								</select>
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label>Mascota</label><br>
								<select class="form-control" id="mascota" name="mascota" >
									 <option selected disabled value="-1" >[SELECCIONE]</option>											
								</select>
							</div>
						</div>
					</div>
					<div class="row">	
						<div class="col-md-3">
							<div class="form-group">
								<label>Descripción</label>
								<input type="text" class="form-control" id="desc_inc" name="desc_inc" placeholder="Ingrese descripción">
							</div>
						</div>							
					</div>
					
					
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label>Recomendación</label>
								<input type="text" class="form-control" id="recom_inc" name="recom_inc" placeholder="Ingrese la recomendación">
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
function tablaIncidencias(){ 
	$("#id_table").DataTable().destroy();
	$("#id_table tbody").empty(); 
	$.getJSON("listaIncidencias",{}, function (data){
		$.each(data, function(index, item){																																										    																								
																												    
		    var eliminar='<button type="button" class="btn btn-danger" onclick="eliminar('+item.cod_inc+')">Eliminar</button>';
																									
																								    
			$("#id_table").append("<tr><td>"+item.cod_inc+"</td>"+
											  "<td>"+item.usuario.cod_usu+"</td>"+
											  "<td>"+item.mascota.codigoMascota+"</td>"+
											  "<td>"+item.desc_inc+"</td>"+
											  "<td>"+item.recom_inc+"</td>"+											  
											  "<td>"+eliminar+"</td>");
		});
		$("#id_table").DataTable().draw();
		$("#id_table").DataTable();
	});
}


function modalIncidencias(){
	$('#id_registra').trigger("reset");
	$("#id_codigo").val(0);
	$("#id_mensaje").text("Registrar Incidencia");
	$('#exampleModal').modal({backdrop: 'static', keyboard: false,show:true});  
}

function postValidarRegistra() {
	var validator = $('#id_registra').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
    	registraIncidencia();
    }
}

function registraIncidencia(){

		  var formData = new FormData();
		  	formData.append("cod_inc", $("#id_codigo").val());
  	        formData.append("usuario", $("#usuario").val());
  	        formData.append("mascota", $("#mascota").val());
  	        formData.append("desc_inc", $("#desc_inc").val());
  	        formData.append("recom_inc", $("#recom_inc").val());
  	     	
		swal({
			  title: "¿Seguro de Guardar los datos?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
		   		 $.ajax({
		   				url:  'registraIncidencias',
		   				type: "POST",
		   				data: formData,
			   			
				        contentType : false,
				        processData : false,
				        cache:false,
		   				success:function(data){
		   					console.log(data);
		   					if(data!=null){
								swal("Registro Guardado correctamente...","","success");
								tablaIncidencias();
								$("#exampleModal").modal("hide");
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
	
	
	
	function eliminar(cod){		
		swal({
			  title: "¿Seguro de eliminar?",
			  text: "Se eliminará la incidencia con código : "+cod,
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url:'eliminaIncidencias',
						type:'POST',
						data:{cod:cod},
						success: function(data){
							tablaIncidencias();
							swal("Sistema","Registro eliminado...","success");
						},
						error: function (e) { 
							swal("Sistema", "Disculpe, existió un problema "+e, "error");
				    	}
					});
			  }
			});
	}
	
	/*$.getJSON("listaUsuario", {}, function(data) {
		$.each(data, function(index, item) {
			$("#usuario").append("<option value='"+item.cod_usu+"'>"+
					 item.nom_usu+"</option>");
			});
		});
	$.getJSON("cargarMascotas", {}, function(data) {
		$.each(data, function(index, item) {
			$("#mascota").append("<option value='"+item.codigoMascota+"'>"+
					 item.nombreMascota+"</option>");
			});
		});*/
		
		
		$.getJSON("listaUsuario",{}, function(data){
			$.each(data, function(i, item){
				$("#usuario").append("<option value='"+item.cod_usu+"'>"+
						 item.nom_usu+"</option>");
			});
		});
		
		$("#usuario").change(function(){
			var var_usu = $("#usuario").val();

			$("#mascota").empty();
			$("#mascota").append("<option value=' '>[Seleccione]</option>");
			
			$.getJSON("cargarMascotas",{"nom_usu":var_usu}, function(data){
				$.each(data, function(i, item){
					$("#mascota").append("<option value='"+ item +"'>"+ item+"</option>");
				});
			});
		});
	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		tablaIncidencias();
		 $('#resetBtn').click(function() {
		        $('#id_registra').data('bootstrapValidator').resetForm(true);
		        $('#exampleModal').modal("hide");
		 }); 
	});
</script>


			
	

</body>
</html>