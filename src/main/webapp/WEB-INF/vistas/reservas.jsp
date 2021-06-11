<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Reservas</title>
</head>
<body>
	<div class="container">
		<h2 class="text-center text-success" style="text-decoration:underline;"> Mis Reservas</h2>
		<input type="hidden" class="form-control" id="cod_usu" name="cod_usu"
			value="${objUsuario.cod_usu}"> <br>&nbsp;<br>
		<div id="divReserva">
			<table id="id_table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Nro. Reserva</th>
						<th>Fecha</th>
						<th>Estado</th>
						<th>Opción</th>						
					</tr>
				</thead>
				<tbody id="id_table_reserva_body">

				</tbody>
			</table>
		</div>
		
		
			<div class="modal fade" id="registroModal" tabindex="-1" role="dialog"
			aria-labelledby="id_mensaje" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" id="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					<table id="id_table_detallereserva" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 30%">Servicio</th>
												<th style="width: 20%">Precio</th>
												<th style="width: 10%">Detalle</th>
												<th style="width: 10%">Subtotal</th>
												<th style="width: 5%"></th>
											</tr>
										</thead>
										<tbody id="id_table_detallereserva_body">
												
										</tbody>
										
					</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="agregarReserva()">Registrar</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="resetBtn">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    var cod_usu=$("#cod_usu").val();

    $ .getJSON("cargarReservaxCodUsuario",
            {
            'cod_usu' : cod_usu
        }

        ,
        function(data) {
			console.log(data);
            $ .each(data,
                function(index,
                    item) {
                    var stat="";

                    if (item.estado=='1') {
                        stat='Reservado';
                    }

                    else if (item.estado=='2') {
                        stat='Realizado';
                    }

                    else if (item.estado=='3') {
                        stat='Cancelado';
                    }

                    $('#id_table_reserva_body') .append("<tr><td>"
                        + item.num_reserva + "</td><td>"
                        + item.fecha + "</td><td>"
                        + stat + "</td><td><button type='button' onclick='detalleReserva("
                        + item.num_reserva + ");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></button></td></tr>");
                }

            );
        }

    );

}

);

function detalleReserva (num_reserva){
	$('#registroModal').modal({backdrop: 'static', keyboard: false,show:true});  
	 $ .getJSON("detalleReserva",{'num_reserva' : num_reserva},
	        function(data) {
		        console.log(data[0].boleta.num_boleta);
		        $("#modal-header").append("<h3> Nro de reserva "+data[0].boleta.num_reserva+"</h3>");
	            $ .each(data,function(index,item) {
							
	            	$('#id_table_detallereserva_body').append("<tr><td>"
	                        + item.servicio.nom_ser + "</td><td>"
	                        + item.precio + "</td><td>"
	                        + item.fecha + "</td></tr>");

	            	

	            });
	           
	        }

	    );

}
	
</script>
</html>
