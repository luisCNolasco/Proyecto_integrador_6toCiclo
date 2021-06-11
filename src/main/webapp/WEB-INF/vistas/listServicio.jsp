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
	    <div id="divServicio">
	    	<input type="hidden" id="id_cliente_dni" value="${sessionScope.objUsuario.dni_usu}">
	    
	       <table id="id_table" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Codigo</th>
															<th>Nombre</th>
															<th>Precio</th>
															<th>Descripción</th>
															<th>Horario</th>
															<th>Acción</th>
														</tr>
												</thead>
												<tbody>
																																		
												</tbody>
		   </table>	
		</div>
		
			
	<div class="container">
		<div class="modal fade" id="registroModal" tabindex="-1" role="dialog"
			aria-labelledby="id_mensaje" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="id_mensaje"></h3>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Codigo</label> 
								<input type="text" id="cod_ser" class="form-control" name="cod_ser" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Nombre</label> 
								<input type="text" id="nom_ser" class="form-control" name="nom_ser" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Precio</label> 
								<input type="text" id="pre_ser" class="form-control" name="pre_ser" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Descripción</label> 
								<input type="text" id="desc_ser" class="form-control" name="desc_ser" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Horario</label> 
								<input type="text" id="horio_ser" class="form-control" name="horio_ser" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Ingrese el horario para su cita</label> 
								<input type="number" id="fecha" class="form-control" name="fecha">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="id_btnRegistrar">Registrar</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="resetBtn">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Mensaje -->	
				  <div class="modal fade" id="idMensaje" >
					<div class="modal-dialog" style="width: 60%">
		
						<div class="modal-content">
						<div class="modal-header" style="padding: 20px 20px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Mensaje</h4>
						</div>
						<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">
							
					    </div>
					</div>
					</div>
				</div>
</div>
	
<script type="text/javascript">
	$(document).ready(function() {
		tablaServicio();
		 $('#resetBtn').click(function() {
		        $('#id_registra').data('bootstrapValidator').resetForm(true);
		        $('#exampleModal').modal("hide");
		 }); 
	} );
</script>
<script type="text/javascript">
function tablaServicio(){ 
	$("#id_table").DataTable().destroy();
	$("#id_table tbody").empty(); 
	$.getJSON("listaServicio",{}, function (data){
		$.each(data, function(index, item){
			var solicitar='<button type="button" class="btn btn-success" onclick="solicitarServicio('+item.cod_ser+","+
																									"'"+item.nom_ser+"',"+
																									"'"+item.pre_ser+"',"+
																									"'"+item.desc_ser+"',"+																									
																									"'"+item.horio_ser+"'"+')">Solicitar</button>';																
																								    
			$("#id_table").append("<tr><td>"+item.cod_ser+"</td>"+
											  "<td>"+item.nom_ser+"</td>"+
											  "<td>"+item.pre_ser+"</td>"+
											  "<td>"+item.desc_ser+"</td>"+
											  "<td>"+item.horio_ser+"</td>"+											  
											  "<td>"+solicitar+"</td>");
		});
		$("#id_table").DataTable().draw();
		$("#id_table").DataTable();
	});
}


function solicitarServicio(){
	var var_dni_usu = $("#id_cliente_dni").val();
	
		var jsonParam = {"dni_usu":var_dni_usu};
		console.log(jsonParam);
		$.ajax({
			url:  'registraReserva',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data.texto != "-1"){
					$("#idMensajeTexto").html(data.texto);
					$("#idMensaje").modal("show");
				}else
					swal("Error al agregar la reserva","","error");
					return false;
				},
			error: function (jqXhr) { 
				swal("Error en la conexión","","error");
			}
	   });
}
</script>
			
	

</body>
</html>