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
								<input type="text" id="cod_pro" class="form-control" name="cod_pro" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Nombre</label> 
								<input type="text" id="nom_pro" class="form-control" name="nom_pro" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Precio</label> 
								<input type="text" id="pre_pro" class="form-control" name="pre_pro" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Stock Actual</label> 
								<input type="text" id="stock_pro" class="form-control" name="stock_pro" disabled>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-5">
								<label for="full_name_id" class="control-label">Ingrese Cantidad a Llevar</label> 
								<input type="number" id="cant_pro" class="form-control" name="cant_pro">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="agregarBoleta()">Registrar</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="resetBtn">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
		<div id="card-columns" class="product_list"></div>
	</div>
</body>
<script type="text/javascript">
	$
			.getJSON(
					"cargaProductoCliente",
					{},
					function(data) {
						$
								.each(
										data,
										function(index, item) {

											$("#card-columns")
													.append(
															"<div class='card products_item'>"
																	+ "<img <img src='data:image/png;base64,"+item.foto1+"' width='150px'/> </td>"
																	+ "<div class='card-body'> Producto: "
																	+ item.nom_pro
																	+ "</td>"
																	+ "<h5 class='card-title text-danger'> Precio: "
																	+ item.pre_pro
																	+ "</h5>"
																	+ "<p class='card-text'> Stock Disponible: "
																	+ item.stock_pro
																	+ "</td>"
																	+ "<p class='card-text'>"
																	+ item.desc_sim_pro
																	+ "</td>"
																	+ '<button type="button" class="btn btn-success" onclick="agregarProductoModal('
																	+ item.cod_pro
																	+ ","
																	+ "'"
																	+ item.nom_pro
																	+ "',"
																	+ "'"
																	+ item.pre_pro
																	+ "',"
																	+ "'"
																	+ item.stock_pro
																	+ "'"
																	+ ')">Añadir</button>'
																	+ "</div></div>");

										});
					});

	function agregarBoleta(){

				var cod_pro = $("#cod_pro").val();		
				var nom_pro = $("#nom_pro").val();
				var pre_pro = $("#pre_pro").val();
				var stock_pro = $("#stock_pro").val();
				var cant_pro = $("#cant_pro").val();	
				
		if(parseInt(cant_pro) > parseInt(stock_pro)){
			alert("Superaste la cantidad de stock disponible");
		}else{		
		
				var jsonParam = {"cod_pro":cod_pro,"nombre":nom_pro,"precio":pre_pro,"cantidad":cant_pro};
				console.log(jsonParam);

				var resta = parseInt(stock_pro) - parseInt(cant_pro);
				console.log(resta);
				$.ajax({
					url:  'agregarSeleccion',
					type: 'POST',
					dataType:'json',
					data: jsonParam,
					success:function(data){
						console.log(data);
						if(data != null){				
							swal("Producto Agregado","","success");
							return true;
						}else
							swal("Error al agregar la selección del producto","","error");
							return false;
						},
					error: function (jqXhr) { 
						swal("Error en la conexión","","error");
					}
				});

				$("#stock_pro").val(resta);
			}
		}
	

	function agregarProductoModal(cod_pro, nom_pro, pre_pro, stock_pro) {
		
		$("#cod_pro").val(cod_pro);		
		$("#nom_pro").val(nom_pro);
		$("#pre_pro").val(pre_pro);
		$("#stock_pro").val(stock_pro);	
		$("#id_mensaje").text("Descripción de Producto");	

		$('#registroModal').modal({
			backdrop : 'static',
			keyboard : false,
			show : true
		});

	}
</script>
</html>