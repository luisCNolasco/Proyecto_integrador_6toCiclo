<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/sam.css">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrapValidator.min.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
<title></title>
<style>
.product_list {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	margin-top: 30px;
}

.product_list .products_item {
	width: 30%;
	margin-left: 3%;
	margin-bottom: 25px;
	box-shadow: 0px 0px 6px 0px rgba(0, 0, 0, 0.22);
	display: flex;
	flex-direction: column;
}

.product_list .products_item img {
	width: 100%;
}
</style>
</head>
<body>		
	
	<div class="container">
	<input type="hidden" id="id_cliente_dni" value="${sessionScope.objUsuario.dni_usu}">
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
								<label for="full_name_id" class="control-label">Descripcion</label> 
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
								<label for="full_name_id" class="control-label">Ingrese el horario deseado</label> 
								<input type="text" id="ho_ser" class="form-control" name="ho_ser">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="id_btnRegistrar" onclick="agregarReserva()">Registrar</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="resetBtn">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
		<div id="card-columns" class="product_list"></div>
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
	
	
</body>
<script type="text/javascript">
	$
			.getJSON(
					"cargaClienteServicio",
					{},
					function(data) {
						$
								.each(
										data,
										function(index, item) {

											$("#card-columns")
													.append(
															"<div class='card products_item'>"
																	
																	+ "<div class='card-body'> Servicio: "
																	+ item.nom_ser
																	+ "</td>"
																	+ "<h5 class='card-title text-danger'> Precio: "
																	+ item.pre_ser
																	+ "</h5>"
																	+ "<p class='card-text'> Descripcion: "
																	+ item.desc_ser
																	+ "</td>"
																	+ "<p class='card-text'> Horario:"
																	+ item.horio_ser
																	+ "</td>"
																	+ '<button type="button" class="btn btn-success" onclick="agregarServicioModal('
																	+ item.cod_ser
																	+ ","
																	+ "'"
																	+ item.nom_ser
																	+ "',"
																	+ "'"
																	+ item.pre_ser
																	+ "',"
																	+ "'"
																	+ item.desc_ser
																	+ "',"
																	+ "'"
																	+ item.horio_ser
																	+ "'"
																	+ ')">Reservar</button>'
																	+ "</div></div>");

										});
					});

	$("#id_btnRegistrar").click(function (){
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
						swal("Error al agregar la Boleta","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });	
			   
		
	});
	

	function agregarServicioModal(cod_ser, nom_ser, pre_ser, desc_ser, horio_ser) {
		
		$("#cod_ser").val(cod_ser);		
		$("#nom_ser").val(nom_ser);
		$("#pre_ser").val(pre_ser);
		$("#desc_ser").val(desc_ser);	
		$("#horio_ser").val(horio_ser);
		$("#id_mensaje").text("Descripción de Producto");	

		$('#registroModal').modal({
			backdrop : 'static',
			keyboard : false,
			show : true
		});

	}
	
</script>
</html>