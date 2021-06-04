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
	   <button type="button" data-toggle='modal' class='btn btn-primary' id="validateBtnw2" onclick="modalServicio()">Nuevo Servicio</button>
	    <br>&nbsp;<br>
	    <div id="divServicio">
	       <table id="id_table" class="table table-striped table-bordered" >
												<thead>
														<tr>
															<th>Codigo</th>
															<th>Nombre</th>
															<th>Precio</th>
															<th>DescripciÛn</th>
															<th>Horario</th>
															<th>EDITAR</th>
															<th>ELIMINAR</th>
														</tr>
												</thead>
												<tbody>
																																		
												</tbody>
		   </table>	
		</div>
	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="id_mensaje" aria-hidden="true">
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
			  	<form  id="id_registra" action="registraServicio" method="POST">
			  		<input type="hidden"  id="id_codigo" name="cod_ser">
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label>Nombre del Servicio</label>								
								<input type="text" class="form-control" id="nom_ser" name="nom_ser" placeholder="Nombre del servicio">
							</div>
						</div>
					</div>
					<div class="row">	
						<div class="col-md-2">
							<div class="form-group">
								<label>Precio</label>
								<input type="text" class="form-control" id="pre_ser" name="pre_ser" placeholder="Ingrese su S/0.00">
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>DescripciÛn</label>
								<input type="text" class="form-control" id="desc_ser" name="desc_ser" placeholder="Ingrese la descripciÛn del servicio">
							</div>
						</div>		
					</div>
					
					
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label>Horario del Servicio</label>
								<input type="text" class="form-control" id="horio_ser" name="horio_ser" placeholder="Ingrese el horario del servicio">
							</div>
						</div>
					</div>
						
					
					
				</form>
			</div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" onclick="postValidarRegistra()">Registrar</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="resetBtn">Cerrar</button>	        
	      </div>
	    </div>
	  </div>
	</div>
	
	
<script type="text/javascript">
function tablaServicio(){ 
	$("#id_table").DataTable().destroy();
	$("#id_table tbody").empty(); 
	$.getJSON("listaServicio",{}, function (data){
		$.each(data, function(index, item){
			var editar='<button type="button" class="btn btn-success" onclick="updateServicio('+item.cod_ser+","+
																					"'"+item.nom_ser+"',"+
																					"'"+item.pre_ser+"',"+
																					"'"+item.desc_ser+"',"+																									
																					"'"+item.horio_ser+"'"+')">Editar</button>';
																																										    
																								
																												    
		    var eliminar='<button type="button" class="btn btn-danger" onclick="eliminar('+item.cod_ser+')">Eliminar</button>';
																									
																								    
			$("#id_table").append("<tr><td>"+item.cod_ser+"</td>"+
											  "<td>"+item.nom_ser+"</td>"+
											  "<td>"+item.pre_ser+"</td>"+
											  "<td>"+item.desc_ser+"</td>"+
											  "<td>"+item.horio_ser+"</td>"+											  
											  "<td>"+editar+"</td>"+
											  "<td>"+eliminar+"</td>");
		});
		$("#id_table").DataTable().draw();
		$("#id_table").DataTable();
	});
}


function modalServicio(){
	$('#id_registra').trigger("reset");
	$("#id_codigo").val(0);
	$("#id_mensaje").text("Registrar Servicio");
	$('#exampleModal').modal({backdrop: 'static', keyboard: false,show:true});  
}

 function postValidarRegistra() {
		var validator = $('#id_registra').data('bootstrapValidator');
        validator.validate();
        if (validator.isValid()) {
        	registraServicio();
        }
	}
	function registraServicio(){

		  var formData = new FormData();
		  	formData.append("cod_ser", $("#id_codigo").val());
  	        formData.append("nom_ser", $("#nom_ser").val());
  	        formData.append("pre_ser", $("#pre_ser").val());
  	        formData.append("desc_ser", $("#desc_ser").val());
  	        formData.append("horio_ser", $("#horio_ser").val());
  	     	
		swal({
			  title: "øSeguro de Guardar los datos?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willSave) => {
			  if (willSave) {
		   		 $.ajax({
		   				url:  'registraServicio',
		   				type: "POST",
		   				data: formData,
			   			enctype : 'multipart/form-data',
				        contentType : false,
				        processData : false,
				        cache:false,
		   				success:function(data){
		   					console.log(data);
		   					if(data!=null){
								swal("Registro Guardado correctamente...","","success");
								tablaServicio();
								$("#exampleModal").modal("hide");
								$('#id_registra').data('bootstrapValidator').resetForm(true);
			   			    	$('#id_registra').trigger("reset");
							}
							else
								swal("Error al guardar el registro...","","error");
		   				},
		   				error: function (jqXhr) { // error callback 
		   					swal("Error ...","","error");
		   		    	}
		   			})
			  } 
			})
	}	
	
	function updateServicio(cod_ser,nom_ser,pre_ser,desc_ser, horio_ser){	
		$("#id_codigo").val(cod_ser);		
		$("#nom_ser").val(nom_ser);
		$("#pre_ser").val(pre_ser);
		$("#desc_ser").val(desc_ser);
		$("#horio_ser").val(horio_ser);

		$("#id_mensaje").text("Actualizar Servicio");
		$('#exampleModal').modal({backdrop: 'static',keyboard:false,show:true});
	
	}	
	
	
	function eliminar(cod){		
		swal({
			  title: "øSeguro de eliminar?",
			  text: "Se eliminar· el servicio con cÛdigo : "+cod,
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url:'eliminaServicio',
						type:'POST',
						data:{cod:cod},
						success: function(data){
							tablaServicio();
							swal("Sistema","Registro eliminado...","success");
						},
						error: function (e) { 
							swal("Sistema", "Disculpe, existiÛ un problema "+e, "error");
				    	}
					});
			  }
			});
	}
	
</script>

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
$('#id_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"nom_ser":{
            selector: "#nom_ser",
            validators:{
                notEmpty: {
                     message: 'El nombre es obligatorio'
                },
                stringLength: {
                    min: 5,
                    max: 50,
                    message: 'El nombre es de 5 a 50 caracteres'
                },
                regexp: {
					regexp: /^[a-zA-ZÒ—·ÈÌÛ˙¡…Õ”⁄\s]+$/,
					message: 'El nombre contiene solo letras'
	            }
            }
        },
        "pre_ser":{
        	 selector: "#pre_ser",
             validators:{
            	 notEmpty: {
                     message: 'El precio es obligatorio'
                },
                regexp: {
                	regexp : /^[0-9]+([.][0-9]{2})$/,
					message : 'El Precio debe ser 0.00 dÌgitos'
	            }
             }
        },
        "desc_ser":{
       	 selector: "#desc_ser",
            validators:{
           	 notEmpty: {
                    message: 'La descripciÛn es obligatorio'
               },
               stringLength: {
                   min: 5,
                   max: 150,
                   message: 'La descripciÛn es de 5 a 150 caracteres'
               },
               regexp: {
					regexp: /^[a-zA-ZÒ—·ÈÌÛ˙¡…Õ”⁄\s]+$/,
					message: 'La descripciÛn contiene solo letras'
	            }
            }
       },
       "horio_ser":{
      	 selector: "#horio_ser",
           validators:{
          	 notEmpty: {
                   message: 'El horario es obligatorio'
              }
           }
      }
        
    }   
});
</script>
			
	

</body>
</html>