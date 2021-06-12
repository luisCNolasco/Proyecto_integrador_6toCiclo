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
<script type="text/javascript" src="sweetalert/sweetalert.min.js"></script>
<title>Pedidos</title>
</head>
<body>
	<div class="container">
		<h2 class="text-center text-success" style="text-decoration:underline;"> Mis Pedidos</h2>
		<input type="hidden" class="form-control" id="cod_usu" name="cod_usu"
			value="${objUsuario.cod_usu}"> <br>&nbsp;<br>
		<input type="hidden" class="form-control" id="tiposuario" name="tiposuario"
			value="${objUsuario.tipousuario.cod_tip_usu}"> <br>&nbsp;<br>			
		<div id="divPedido">
			<table id="id_table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Nro. Boleta</th>
						<th>Fecha de Emisión</th>
						<th>Estado</th>
						<th>Opción</th>						
					</tr>
				</thead>
				<tbody id="id_table_pedido_body">

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
					<table id="id_table_detalleboleta" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 30%">Producto y/o Servicio</th>
												<th style="width: 20%">Precio</th>
												<th style="width: 10%">Cantidad</th>
												<th style="width: 10%">Subtotal</th>
											</tr>
										</thead>
										<tbody id="id_table_detalleboleta_body">
												
										</tbody>
										
					</table>
					</div>
					<div class="modal-footer">
					<p id="Total">Total: </>					
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
						<h3>Editar Estado de Pedido</h3>
					</div>
					<div class="modal-body">
					<div class="row">
								<input name="num_boleta" id="num_boleta" value="" type="hidden">
								
								<div class="form-group col-md-5">
								<label>Estado</label><br> 
								<select class="form-control" name="estado" id="estado">
									<option value="1">Generado</option>
									<option value="2">En preparación</option>
									<option value="3">Enviado</option>
									<option value="4">Entregado</option>
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
	listarPedido();
});

function listarPedido(){
	var tipUser = $("#tiposuario").val();
	
	if(tipUser == 3){	
    var cod_usu = $("#cod_usu").val();
	
    $.getJSON("cargarPedidosxCodUsuario",{'cod_usu' : cod_usu},
        function(data) {
            $ .each(data,
                function(index,
                    item) {
                    var stat="";

                    if (item.estado=='1') {
                        stat='Generado';
                    }

                    else if (item.estado=='2') {
                        stat='En preparación';
                    }

                    else if (item.estado=='3') {
                        stat='Enviado';
                    }

                    else if (item.estado=='4') {
                        stat='Entregado';
                    }

                    $('#id_table_pedido_body') .append("<tr><td>"
                        + item.num_boleta + "</td><td>"
                        + item.fecha + "</td><td>"
                        + stat + "</td><td><button type='button' onclick='detallePedido("
                        + item.num_boleta + ");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></button></td></tr>");
                }

            );
        }

    );

	}else {

	    $.getJSON("listaPedido",{},
	        function(data) {
	        console.log(data);
	            $ .each(data,
	                function(index,
	                    item) {
	                    var stat="";

	                    if (item.estado=='1') {
	                        stat='Generado';
	                    }

	                    else if (item.estado=='2') {
	                        stat='En preparación';
	                    }

	                    else if (item.estado=='3') {
	                        stat='Enviado';
	                    }

	                    else if (item.estado=='4') {
	                        stat='Entregado';
	                    }

	                    $('#id_table_pedido_body') .append("<tr><td>"
	                        + item.num_boleta + "</td><td>"
	                        + item.fecha + "</td><td>"
	                        + stat + "</td><td><button type='button' onclick='detallePedido("
	                        + item.num_boleta + ");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-plus' aria-hidden='true'></span> </button><button type='button' onclick='editarEstadoPedido("
	                        + item.num_boleta +"," + item.estado +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button></td></tr>");
	                }

	            );
	        }

	    );
			
	}
}


function detallePedido (num_boleta){
	$('#registroModal').modal({backdrop: 'static', keyboard: false,show:true});
	$("#id_mensaje").empty();		
	$("#id_table_detalleboleta_body").empty();	
	$("#Total").empty();
	$ .getJSON("detalleBoleta",{'num_boleta' : num_boleta},
	        function(data) {		        
		        $("#id_mensaje").append("<h3> Nro de Boleta "+data[0].boleta.num_boleta+"</h3>");
		        var total = 0;
	            $ .each(data,function(index,item) {
					var subTotal = item.cantidad * item.precio;		
					total = total + subTotal;					
	            	$('#id_table_detalleboleta_body').append("<tr><td>"
	                        + item.producto.nom_pro + "</td><td>"
	                        + item.precio + "</td><td>"
	                        + item.cantidad + "</td><td>"
	                        + subTotal + "</td></tr>");
		
	            });
	            $("#Total").append("Total: S/."+total);
	        }
	
	    );

}

function editarEstadoPedido (num_boleta, estado){
	console.log(num_boleta, estado);
	$('#editModal').modal({backdrop: 'static', keyboard: false,show:true});
	$("#num_boleta").val(num_boleta);	
	$("#estado").val(estado);
}

function registro (){
	  var estado = 	$("#estado").val();
	  var num_boleta = $("#num_boleta").val();		
	 	
	  $.ajax({
			url:'actualizarEstadoPedido',
			type:'POST',
			data:{estado:estado, num_boleta:num_boleta},
			success: function(data){
				$("#id_table_pedido_body").empty(); 
				listarPedido();
				swal("Sistema","Actualizo Estado...","success");
			},
			error: function (e) { 
				swal("Sistema", "Disculpe, existió un problema "+e, "error");
	    	}
		});
	
}
	
</script>
</html>
