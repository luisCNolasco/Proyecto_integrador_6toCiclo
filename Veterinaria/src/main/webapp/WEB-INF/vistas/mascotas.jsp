<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Productos 4 Patitas</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
		<button type="button" data-toggle='modal' class='btn btn-primary'
			id="validateBtnw2" onclick="modalMascota()">Registrar
			mascota</button>
		<br>&nbsp;<br>
		<div id="divProducto">
			<table id="id_table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Codigo</th>
						<th>Nombre</th>
						<th>Tipo</th>
						<th>Foto</th>
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

	<div class="modal fade" id="registroModal" tabindex="-1" role="dialog"
		aria-labelledby="id_mensaje" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h3 class="modal-title" id="id_mensaje"></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<input type="hidden" class="form-control" id="usuarioCodigo"
									name="usuarioCodigo" value="${ objUsuario.cod_Usu}">
				<div class="modal-body">
					<div class="container">

						<form>
							<input type="hidden" id="codigo" name="codigo">
							
							<div class="row">
								<div class="form-group col-md-5">
									<label for="full_name_id" class="control-label">Nombre</label>
									<input type="text" id="nombre" class="form-control"
										name="nombre">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-5">
									<label>Tipo de Mascota</label><br> <select
										class="form-control" id="tipo" name="tipo">
										<option selected disabled value="-1">[SELECCIONE]</option>
									</select>
								</div>

							</div>

							<div class="form-group col-12">
								<input type="hidden" class="form-control" id="usuario"
									name="usuario" value="${ objUsuario.cod_Usu}">
							</div>
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label>Elegir imagen 2</label> <input type="file"
											class="form-control" id="foto" name="foto">
									</div>
									<div class="col-lg-2">
										<img id="id_preview" width="210" height="230">
									</div>
								</div>
							</div>

						</form>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="saveMascota()">Registrar</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function() {
	   $('#id_table').DataTable();

	   $.getJSON("listarTipoMascota", {}, function(data) {
			$.each(data, function(index, item) {
				$("#tipo").append(
						"<option value='"+item.tipoMascota+"'>"
								+ item.nombreMascota + "</option>");
			});
		});

	   tablaProducto();
	});	



    /* Registro*/

	setTimeout(function() {
	    $("#id_preview").fadeOut("fast"); }, 0);
    
	$("#foto").change(function(event){
		var src = URL.createObjectURL(event.target.files[0]);
		if(src != null){
		    setTimeout(function(){
		      $("#id_preview").attr("src", src).fadeIn("slow"); }, 1000);
		    
		    setTimeout(function() {
		      $("#id_preview").fadeOut("slow"); }, 10000);
		}		
	});	


</script>

<script type="text/javascript">

function tablaProducto(){
	$("#id_table").DataTable().destroy();
	$("#id_table tbody").empty(); 

	var codigoUsuario =parseInt($("#usuarioCodigo").val());
	$.getJSON("cargarMascotas",{"codigoUsuario":codigoUsuario}, function (data){
		$.each(data, function(index, item){
			var editar='<button type="button" class="btn btn-success" onclick="updateMascota('+item.codigoMascota+","+
																					"'"+item.nombreMascota+"',"+
																					"'"+item.tipoMascota.nombreMascota+"',"+
																					"'"+item.codigoUsuario+"',"+
																					"'"+item.foto1+"'"+')">Editar</button>';
																																										    
																								
																												    
		    var eliminar='<button type="button" class="btn btn-danger" onclick="eliminar('+item.codigoMascota+')">Eliminar</button>';

			$("#id_table").append("<tr><td>"+item.codigoMascota+"</td>"+
											  "<td>"+item.nombreMascota+"</td>"+
											  "<td>"+item.tipoMascota.nombreMascota+"</td>"+										  
											  "<td> <img src='data:image/png;base64,"+item.foto1+"' width='150px'/> </td>"+
											  
											  "<td>"+editar+"</td>"+
											  "<td>"+eliminar+"</td>");
		});
		$("#id_table").DataTable().draw();
		$("#id_table").DataTable();
	});
}

	
		
	function modalMascota(){
		$('#id_registra').trigger("reset");
		$("#codigo").val(0);
		
		$("#id_mensaje").text("Registrar Mascota");
		$('#registroModal').modal({backdrop: 'static', keyboard: false,show:true});  
	}

	function registrar() {
			//var validator = $('#id_registra').data('bootstrapValidator');
	        //validator.validate();
	        //if (validator.isValid()) {
	        	//saveMascota();
	       // }
		}
	function saveMascota(){

			  var formData = new FormData();
			  	formData.append("codigo", $("#codigo").val());	
	  	        formData.append("nombre", $("#nombre").val());
	  	        formData.append("tipo", $("#tipo").val());
	  	        formData.append("usuario", $("#usuario").val());
	  	        
		  	      var file = $('#foto')[0].files[0];	  	        
		  	        formData.append("foto", file);
		  	        
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
			   				url:  'saveMascota',
			   				type: "POST",
			   				data: formData,
				   			enctype : 'multipart/form-data',
					        contentType : false,
					        processData : false,
					        cache:false,
			   				success:function(data){
			   					//console.log(data);
			   					if(data != null){
									swal("Registro Guardado correctamente...","","success");
									tablaProducto();
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

	function updateMascota(cod,nom,tipoMascota,codUsu,foto1){	

		console.log(cod,nom,tipoMascota,codUsu,foto1);

		$("#codigo").val(cod);		
		$("#nombre").val(nom);
		$("#tipo").val(tipoMascota);
		$("#usuario").val(codUsu);
		$("#foto").val(foto1);
		
		$("#id_mensaje").text("Actualizar Producto");
		$('#registroModal').modal({backdrop: 'static',keyboard:false,show:true});

	
		}	
	
	/*function eliminar(cod_pro){		
		swal({
			  title: "Seguro de Eliminar?",
			  text: "Se eliminará el producto con código : "+cod_pro,
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url:'deleteProducto',
						type:'POST',
						data:{cod:cod_pro},
						success: function(data){
							tablaProducto();
							swal("Sistema","Registro eliminado...","success");
						},
						error: function (e) { 
							swal("Sistema", "Disculpe, existió un problema "+e, "error");
				    	}
					});
			  }
			});
	}*/
	
</script>

	
</body>

</html>