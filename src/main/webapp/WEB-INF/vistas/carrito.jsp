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
</script>
</body>
</html>