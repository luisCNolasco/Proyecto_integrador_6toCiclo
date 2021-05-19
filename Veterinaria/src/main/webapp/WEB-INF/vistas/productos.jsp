<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="en">
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Productos 4 Patitas</title>
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
   
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
    
</head>
<body>

	<div id="fw-container" class="fw-container container-crudproducto">
	<div class="container-fluid">
		<form id="id_form_elimina" action="eliminaCrudProducto">
			<input type="hidden" id="id_elimina" name="id">
		</form>	
		<div class="col-md-2" >
			    <input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
		</div>
		<div class="col-md-2" >
				<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
		</div>
		<div class="row d-flex justify-content-end mb-3">
			<button type="button" class="btn btn-primary" data-toggle="modal" onclick="modalProducto();">
			  Registrar Producto
			</button>
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="id_mensaje" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered sam-crudproducto" role="document">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h5 class="modal-title" id="id_mensaje">Registra un producto</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	    <div class="modal-body sam-modal-body">
	 		<div class="container sam-lisu">	        
			  	<form  id="id_registra" action="#" method="POST" id="contactForm" name="contactForm" class="contactForm">
			  		<input type="hidden"  id="id_codigo" name="cod_pro">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Nombre</label>
								<input type="text" class="form-control sam-form-input" name="subject" id="subject" placeholder="Nombre del producto">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Precio</label>
								<input type="number" class="form-control sam-form-input" name="subject" id="subject" placeholder="Ingrese su S/0.00">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Stock</label>
								<input type="number" class="form-control sam-form-input" name="subject" id="subject" placeholder="Ingrese su Stock">
							</div>
						</div>	
						<div class="col-md-6">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Marca</label><br>
								<select class="form-control sam-form-input" id="id_marca" name="cod_mar" >
									<option value=" ">[SELECCIONE]</option>
												<c:forEach var="marca" items="${dataMarca}">
										              <option value="${marca.cod_mar}" >
														${marca.nom_mar}</option>
										        </c:forEach>  
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Proveedor</label><br>
								<select class="form-control sam-form-input" id="tipo">
									<option selected disabled value="masculino"></option>
									<option value="1">Proveedor 1</option>
								</select>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Descripción Simple</label><br>
								<textarea class="form-control" rows="3" id="comment" placeholder="Escribe una breve descripción aquí"></textarea>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Descripción HTML</label><br>
								<textarea class="form-control" rows="3" id="comment" placeholder="HTML"></textarea>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Elegir imagen 1</label>
								<input type="file" class="form-control sam-form-input" name="subject">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Elegir imagen 2</label>
								<input type="file" class="form-control sam-form-input" name="subject">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label sam-form-label" for="subject">Elegir imagen 3</label>
								<input type="file" class="form-control sam-form-input" name="subject">
							</div>
						</div>
					</div>
				</form>
			</div>
	      </div>
	      <div class="modal-footer sam-modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	        <button type="button" class="btn btn-primary">Registrar</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="container-fluid sam-table sam-crudproducto-table">
		<div id="divProducto" class="col-md-12">
		<table id="id_table" class="table table-striped table-bordered" >
												<thead class="thead-dark">
														<tr>
															<th>Codigo</th>
															<th>Nombre</th>
															<th>Precio</th>
															<th>Stock</th>
															<th>Marca</th>
															<th>Proveedor</th>
															<th>Desc</th>
															<th>Desc 2</th>
															<th>Foto 1</th>
															<th>Foto 2</th>
															<th>Foto 3</th>
															<th></th>
															<th></th>
														</tr>
												</thead>
												<tbody>
													<c:forEach var="producto" items="${dataProducto}">
														<tr>
															<td>${producto.cod_pro}</td>
															<td>${producto.nom_pro}</td>
															<td>${producto.pre_pro}</td>
															<td>${producto.stock_pro}</td>
															<td>${producto.marca.nom_mar}</td>
															<td>${producto.proveedor.nom_prov}</td>
															<td>${producto.desc_sim_pro}</td>
															<td>${producto.desc_html_pro}</td>
															<td>${producto.foto1}</td>
															<td>${producto.foto2}</td>
															<td>${producto.foto3}</td>
															<td><button type="button" class="btn btn-danger" 
															onclick="eliminarProducto'${producto.cod_pro}')">Eliminar</button></td>
														</tr>
													</c:forEach>												
												</tbody>
											</table>	
										</div>
									</div>
								</div>
<script type="text/javascript">
	$(document).ready(function() {
	   $('#id_table').DataTable();
	} );
</script>								
								
<script type="text/javascript">

	function modalProducto(){
		$('#id_registra').trigger("reset");
		$("#id_codigo").val(0);
		$("#id_mensaje").text("Registrar Producto");
		$('#exampleModal').modal({backdrop: 'static', keyboard: false,show:true});  
	}
	function postValidarRegistra() {
		var validator = $('#id_registra').data('bootstrapValidator');
        validator.validate();
        if (validator.isValid()) {
        	registrarProducto();
        }
	}
	function registrarProducto(){
		var formData = new FormData($("#id_registra")[0]);
		swal({
			  title: "Seguro de Guardar?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
				  $.ajax({
						url:  'saveProducto',
						type: 'POST',
						dataType: "html",
			            data: formData,
			            cache: false,
			            contentType: false,
			     		processData: false,
						success:function(data){
							listarProducto();
						  	$('#id_registra').data('bootstrapValidator').resetForm(true);
					    	swal("Sistema","Registro Guardado...","success");
							$('#exampleModal').modal("hide");
						},
						error: function (e) { 
							swal("Sistema", "Disculpe, existió un problema", "error");
				    	}
					})
			  } 
			});
	}
	function eliminarProducto(cod_pro){		
		swal({
			  title: "Seguro de Eliminar?",
			  text: "Eliminar el producto con Código : "+cod_pro,
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url:'deleteProducto',
						type:'POST',
						data:{cod_pro:cod_pro},
						success: function(data){
							listarProducto();
							swal("Sistema","Registro eliminado...","success");
						},
						error: function (e) { 
							swal("Sistema", "Disculpe, existió un problema "+e, "error");
				    	}
					});
			  }
			});
	}
		
</script>
<script type="text/javascript">
	$(document).ready(function() {
		listarProducto();
	} );
</script>
       
</body>

</html>