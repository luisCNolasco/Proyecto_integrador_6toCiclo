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
			<input type="hidden" class="form-control" id="tiposuario" name="tiposuario"
			value="${objUsuario.tipousuario.cod_tip_usu}"> <br>&nbsp;<br>	
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
						<h3 id="id_mensaje"></h3>
					</div>
					<div class="modal-body">
					<table id="id_table_detallereserva" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 30%">Servicio</th>
												<th style="width: 20%">Precio</th>
												<th style="width: 20%">Detalle</th>
												
											</tr>
										</thead>
										<tbody id="id_table_detallereserva_body">
												
										</tbody>
										
					</table>
					</div>					
				</div>
			</div>
		</div>
		
		
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
			aria-labelledby="id_mensaje" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" id="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h3>Editar Estado de Reserva</h3>
					</div>
					<div class="modal-body">
					<div class="row">
								<input name="num_reserva" id="num_reserva" value="" type="hidden">
								
								<div class="form-group col-md-5">
								<label>Estado</label><br> 
								<select class="form-control" name="estado" id="estado">
									<option value="1">Reservado</option>
									<option value="2">Realizado</option>
									<option value="3">Cancelado</option>
								</select>
								</div>

					</div>
					
					
					
					</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="registro()">Registrar</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="resetBtn">Cerrar</button>
				</div>
				</div>
			</div>
		</div>
	</div>	
	
</body>
<script type="text/javascript">
$(document).ready(function() {
	listarReserva();
});
    
function listarReserva(){
	var tipUser = $("#tiposuario").val();
	
	if(tipUser == 3){	
    var cod_usu = $("#cod_usu").val();
	
    $.getJSON("cargarReservaxCodUsuario",{'cod_usu' : cod_usu},
        function(data) {
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

	}else {

	    $.getJSON("listaReserva",{},
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
	                        + item.num_reserva + ");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-plus' aria-hidden='true'></span> </button><button type='button' onclick='editarEstadoReserva("
	                        + item.num_reserva +"," + item.estado +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button></td></tr>");
	                }

	            );
	        }

	    );
			
	}
}



function detalleReserva (num_reserva){
	$('#registroModal').modal({backdrop: 'static', keyboard: false,show:true});
	$("#id_mensaje").empty();		
	$("#id_table_detallereserva_body").empty();	
	$ .getJSON("detalleReserva",{'num_reserva' : num_reserva},
	        function(data) {		
        		console.log(data);	        
        		$("#id_mensaje").append("<h3> Nro de Reserva "+data[0].reserva.num_reserva+"</h3>");
	            $ .each(data,function(index,item) {						
	            	$('#id_table_detallereserva_body').append("<tr><td>"
	                        + item.servicio.nom_ser + "</td><td>"
	                        + item.precio + "</td><td>"
	                        + item.fecha + "</td></tr>");
		
	            });	      
	        }
	
	    );

}

function editarEstadoReserva (num_reserva, estado){
	console.log(num_reserva, estado);
	$('#editModal').modal({backdrop: 'static', keyboard: false,show:true});
	$("#num_reserva").val(num_reserva);	
	$("#estado").val(estado);
}

function registro(){
	  var estado = 	$("#estado").val();
	  var num_reserva = $("#num_reserva").val();		
	 	
	  $.ajax({
			url:'actualizarEstadoReserva',
			type:'POST',
			data:{estado:estado, num_reserva:num_reserva},
			success: function(data){
				$("#id_table_reserva_body").empty(); 
				listarReserva();
				swal("Sistema","Actualizo Estado...","success");
			},
			error: function (e) { 
				swal("Sistema", "Disculpe, existió un problema "+e, "error");
	    	}
		});
	
}
	
</script>
</html>
