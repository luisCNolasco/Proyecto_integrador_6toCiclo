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
	   <button type="button" data-toggle='modal' class='btn btn-primary' id="validateBtnw2" onclick="modalProducto()">Nuevo Producto</button>
	    <br>&nbsp;<br>
	    <div id="divProducto">
	       <table id="id_table" class="table table-striped table-bordered" >
												<thead>
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
	
	<div class="modal fade" id="registroModal" tabindex="-1" role="dialog" aria-labelledby="id_mensaje" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h3 class="modal-title" id="id_mensaje"></h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	    <div class="modal-body">
	 		<div class="container">    
			  	<form  id="id_registra" action="saveProducto" method="POST">
			  		<input type="hidden"  id="id_codigo" name="cod_pro">
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label>Nombre</label>								
								<input type="text" class="form-control" id="nom_pro" name="nom_pro" placeholder="Nombre del producto">
							</div>
						</div>
					</div>
					<div class="row">	
						<div class="col-md-2">
							<div class="form-group">
								<label>Precio</label>
								<input type="number" class="form-control" id="pre_pro" name="pre_pro" placeholder="Ingrese S/0.00">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Stock</label>
								<input type="number" class="form-control" id="stock_pro" name="stock_pro" placeholder="Ingrese Stock">
							</div>
						</div>		
					</div>
					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<label>Marca</label><br>
								<select class="form-control" id="marca" name="marca" >
									 <option selected disabled value="-1" >[SELECCIONE]</option>											
								</select>
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label>Proveedor</label><br>
								<select class="form-control" id="proveedor" name="proveedor" >
									 <option selected disabled value="-1" >[SELECCIONE]</option>											
								</select>
							</div>
						</div>
					</div>	
					
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label>Descripción Simple</label>
								<textarea class="form-control" rows="3" id="desc_sim_pro" name="desc_sim_pro" placeholder="Escribe una breve descripción aquí"></textarea>
							</div>
						</div>
					</div>
						
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label>Descripción HTML</label>
								<textarea class="form-control" rows="3" id="desc_html_pro" name="desc_html_pro" placeholder="HTML"></textarea>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-5">
						    <div class="form-group">
								<label>Elegir imagen 1</label>
								<input type="file" class="form-control" id="id_foto1" name="foto1">
							</div>
							<div class="col-lg-2">								
								<img id="id_preview1" width="210" height="230">
							</div>
						</div>
					</div>	
						
					<div class="row">
					   <div class="col-md-5">
						    <div class="form-group">
								<label>Elegir imagen 2</label>
								<input type="file" class="form-control" id="id_foto2" name="foto2">								
							</div>
							<div class="col-lg-2">								
								<img id="id_preview2" width="210" height="230">
							</div>
						</div>
					</div>
					
					<div class="row">
					   <div class="col-md-5">
						    <div class="form-group">
								<label>Elegir imagen 3</label>
								<input type="file" class="form-control" id="id_foto3" name="foto3">
							</div>
							<div class="col-lg-2">								
								<img id="id_preview3" width="210" height="230">
							</div>
						</div>
					</div>
					
				</form>
			</div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onclick="postValidarRegistra()">Registrar</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>	        
	      </div>
	    </div>
	  </div>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
	   $('#id_table').DataTable();
	} );	

    /* Registro*/
    
    setTimeout(function() {
	    $("#id_preview1").fadeOut("fast"); }, 0);
	
	$("#id_foto1").change(function(event){
		var src = URL.createObjectURL(event.target.files[0]);
		if(src != null){
		    setTimeout(function(){
		      $("#id_preview1").attr("src", src).fadeIn("slow"); }, 1000);
		    
		    setTimeout(function() {
		      $("#id_preview1").fadeOut("slow"); }, 10000);
		}
	});

	setTimeout(function() {
	    $("#id_preview2").fadeOut("fast"); }, 0);
	
	$("#id_foto2").change(function(event){
		var src = URL.createObjectURL(event.target.files[0]);
		if(src != null){
		    setTimeout(function(){
		      $("#id_preview2").attr("src", src).fadeIn("slow"); }, 1000);
		    
		    setTimeout(function() {
		      $("#id_preview2").fadeOut("slow"); }, 10000);
		}
	});

	setTimeout(function() {
	    $("#id_preview3").fadeOut("fast"); }, 0);
    
	$("#id_foto3").change(function(event){
		var src = URL.createObjectURL(event.target.files[0]);
		if(src != null){
		    setTimeout(function(){
		      $("#id_preview3").attr("src", src).fadeIn("slow"); }, 1000);
		    
		    setTimeout(function() {
		      $("#id_preview3").fadeOut("slow"); }, 10000);
		}		
	});	

</script>								
								
<script type="text/javascript">
function tablaProducto(){
	$("#id_table").DataTable().destroy();
	$("#id_table tbody").empty(); 
	$.getJSON("cargaProducto",{}, function (data){
		$.each(data, function(index, item){
			var editar='<button type="button" class="btn btn-success" onclick="updateProducto('+item.cod_pro+","+
																					"'"+item.nom_pro+"',"+
																					"'"+item.pre_pro+"',"+
																					"'"+item.stock_pro+"',"+
																					"'"+item.marca.cod_mar+"',"+
																					"'"+item.proveedor.cod_prov+"',"+
																					"'"+item.desc_sim_pro+"',"+
																					"'"+item.desc_html_pro+"',"+
																					"'"+item.foto1+"',"+
																					"'"+item.foto2+"',"+
																					"'"+item.foto3+"'"+')">Editar</button>';
																																										    
																								
																												    
		    var eliminar='<button type="button" class="btn btn-danger" onclick="eliminar('+item.cod_pro+')">Eliminar</button>';

			$("#id_table").append("<tr><td>"+item.cod_pro+"</td>"+
											  "<td>"+item.nom_pro+"</td>"+
											  "<td>"+item.pre_pro+"</td>"+
											  "<td>"+item.stock_pro+"</td>"+
											  "<td>"+item.marca.nom_mar+"</td>"+
											  "<td>"+item.proveedor.nom_prov+"</td>"+
											  "<td>"+item.desc_sim_pro+"</td>"+
											  "<td>"+item.desc_html_pro+"</td>"+
											  "<td> <img src='data:image/png;base64,"+item.foto1+"' width='150px'/> </td>"+
											  "<td> <img src='data:image/png;base64,"+item.foto2+"' width='150px'/> </td>"+
											  "<td> <img src='data:image/png;base64,"+item.foto3+"' width='150px'/> </td>"+
											  "<td>"+editar+"</td>"+
											  "<td>"+eliminar+"</td>");
		});
		$("#id_table").DataTable().draw();
		$("#id_table").DataTable();
	});
}

	$.getJSON("cargaMarca", {}, function(data) {
		$.each(data, function(index, item) {
			$("#marca").append("<option value='"+item.cod_mar+"'>"+
					 item.nom_mar+"</option>");
			});
		});

	$.getJSON("cargaProveedor", {}, function(data) {
		$.each(data, function(index, item) {
			$("#proveedor").append("<option value='"+item.cod_prov+"'>"+
					 item.nom_prov+"</option>");
			});
		});
		
	function modalProducto(){
		$('#id_registra').trigger("reset");
		$("#id_codigo").val(0);
		$("#id_mensaje").text("Registrar Producto");
		$('#registroModal').modal({backdrop: 'static', keyboard: false,show:true});  
	}

	function postValidarRegistra() {
			var validator = $('#id_registra').data('bootstrapValidator');
	        validator.validate();
	        if (validator.isValid()) {
	        	saveProducto();
	        }
		}
	function saveProducto(){

			  var formData = new FormData();
			  	formData.append("cod_pro", $("#id_codigo").val());	
	  	        formData.append("nom_pro", $("#nom_pro").val());
	  	        formData.append("pre_pro", $("#pre_pro").val());
	  	        formData.append("stock_pro", $("#stock_pro").val());
	  	        formData.append("marca", $("#marca").val());
	  	     	formData.append("proveedor", $("#proveedor").val());
	  	     	formData.append("desc_sim_pro", $("#desc_sim_pro").val());
	  	        formData.append("desc_html_pro", $("#desc_html_pro").val());

		  	      var file1 = $('#id_foto1')[0].files[0];	  	        
		  	        formData.append("foto1", file1);
		  	        
		  	      var file2 = $('#id_foto2')[0].files[0];	  	        
		  	        formData.append("foto2", file2);
		  	        
		  	      var file3 = $('#id_foto3')[0].files[0];	  	        
		  	        formData.append("foto3", file3); 
			
			
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
			   				url:  'saveProducto',
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

	function updateProducto(cod_pro,nom_pro,pre_pro,stock_pro, marca, proveedor, desc_sim_pro, desc_html_pro, foto1, foto2, foto3){	
		$("#id_codigo").val(cod_pro);		
		$("#nom_pro").val(nom_pro);
		$("#pre_pro").val(pre_pro);
		$("#stock_pro").val(stock_pro);
		$("#marca").val(marca);
		$("#proveedor").val(proveedor);
		$("#desc_sim_pro").val(desc_sim_pro);
		$("#desc_html_pro").val(desc_html_pro);
		$("#foto1").val(foto1);
		$("#foto2").val(foto2);
		$("#foto3").val(foto3);

		$("#id_mensaje").text("Actualizar Producto");
		$('#registroModal').modal({backdrop: 'static',keyboard:false,show:true});
		}	
	
	function eliminar(cod_pro){		
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
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		tablaProducto();
	} );
</script>
<script type="text/javascript">
$('#id_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"nom_pro":{
            selector: "#nom_pro",
            validators:{
                notEmpty: {
                     message: 'El nombre es obligatorio'
                },
                stringLength: {
                    min: 3,
                    max: 10,
                    message: 'El nombre es de 3 a 10 caracteres'
                },
            }
        },
        "pre_pro":{
        	 selector: "#pre_pro",
             validators:{
            	 notEmpty: {
                     message: 'El precio es obligatorio'
                }
             }
        },
        "stock_pro":{
       	 selector: "#stock_pro",
            validators:{
           	 notEmpty: {
                    message: 'El stock es obligatorio'
               }
            }
       },
       "marca":{
        	 selector: "#marca",
             validators:{
            	 notEmpty: {
                     message: 'Seleccionar la marca es obligatorio'
                }
             }
        },
       "proveedor":{
         	 selector: "#proveedor",
              validators:{
            	  notEmpty: {
                      message: 'Seleccionar el proveedor es obligatorio'
                 }
              }
         },
       "desc_sim_pro":{
      	 selector: "#desc_sim_pro",
           validators:{
          	 notEmpty: {
                   message: 'La descripción simple es obligatorio'
              }
           }
      },
      "desc_html_pro":{
     	 selector: "#desc_html_pro",
          validators:{
         	 notEmpty: {
                  message: 'El descripción HTML es obligatorio'
             }
          }
     },
      "foto1":{
     	 selector: "#id_foto1",
          validators:{
         	 notEmpty: {
                  message: 'Seleccionar foto 1 es obligatorio'
             }
          }
     },
      "foto2":{
     	 selector: "#id_foto2",
          validators:{
         	 notEmpty: {
                  message: 'Seleccionar foto 2 es obligatorio'
             }
          }
     },
      "foto3":{
     	 selector: "#id_foto3",
          validators:{
         	 notEmpty: {
                  message: 'Seleccionar foto 3 es obligatorio'
             }
          }
     }
    }   
});
</script>
</body>

</html>