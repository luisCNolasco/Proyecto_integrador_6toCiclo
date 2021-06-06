<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link href="css/bootstrapValidator.min.css" rel="stylesheet">
<title>Carrito de Compras Boleta</title>
</head>
<body style="margin-top: 10px;">
	<div class ="container">
		<div class="panel panel-default">
					<div class="panel-heading">Boleta</div>
						<div class="panel-body">							
							<div class="form-group">
								<div class="col-lg-12">
									<input type="hidden" id="id_cliente_dni" value="${sessionScope.objUsuario.dni_usu}">
									<table id="id_table_boleta" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 5%">Código</th>
												<th style="width: 30%">Nombre</th>
												<th style="width: 20%">Precio</th>
												<th style="width: 10%">Cantidad</th>
												<th style="width: 10%">Subtotal</th>
												<th style="width: 5%"></th>
											</tr>
										</thead>
										<tbody id="id_table_boleta_body">
												
										</tbody>
										
									</table>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-5">
									<button type="button" id="id_btnRegistrar"  class="btn btn-primary">REGISTRA BOLETA</button>
								</div>
							</div>
					</div>
				</div>
			</div>
			
<script>
$(document).ready(function() {

	//Se añade los clientes a la tabla
	$.getJSON("listaSeleccion",{}, function (data){
		$.each(data, function(index, item){
			$('#id_table_boleta_body').append("<tr><td>" +item.cod_pro + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.cantidad + "</td><td>" +item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.cod_pro +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");                     
		});
	});
	
});

function f_elimina_seleccion(id){	
	//limpiar la tabla
	$("#id_table_boleta_body").empty();
		
	//Se añade los clientes a la tabla
	$.getJSON("eliminaSeleccion",{"cod_pro":id}, function (data){
		$.each(data, function(index, item){
			$('#id_table_boleta_body').append("<tr><td>" +item.cod_pro + "</td><td>" +item.nombre + "</td><td>" +item.precio + "</td><td>" +item.cantidad + "</td><td>" +item.totalParcial + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.cod_pro +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
		});
	});
}

$("#id_btnRegistrar").click(function (){
	var var_dni_usu = $("#id_cliente_dni").val();
	
	var var_count = 0;
	$("#id_table_boleta_body tr").each(function() {
		var_count = var_count + 1;
	});
	
	if (var_count < 1){
		$("#idMensajeTexto").text("Seleccione un producto");
		$("#idMensaje").modal("show");
	}else{

		var jsonParam = {"dni_usu":var_dni_usu};
		console.log(jsonParam);
		$.ajax({
			url:  'registraBoleta',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data.texto != "-1"){
					console.log(data.texto);
					/*$("#idMensajeTexto").html(data.texto);
					$("#idMensaje").modal("show");
					$("#id_table_boleta_body").empty();
					$("#id_cliente_id").val("-1");
					$("#id_cliente_nombre").val("");
					$("#id_cliente_apellido").val("");*/
				}else
					swal("Error al agregar la Boleta","","error");
					return false;
				},
			error: function (jqXhr) { 
				swal("Error en la conexión","","error");
			}
	   });	
		   
	}
});
</script>
</body>
</html>