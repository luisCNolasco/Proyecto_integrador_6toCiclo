<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<title></title>
</head>
<body>
	<div id="card-columns" class="d-flex justify-content-around">
		
	</div>
</body>
<script type="text/javascript">
$.getJSON("cargaProductoCliente",{}, function (data){
	$.each(data, function(index, item){
		console.log(item);
		$("#card-columns").append("<div id='card' class='card'>"+
									 "<img <img src='data:image/png;base64,"+item.foto1+"' width='150px'/> </td>"+
								     "<div class='card-body'> Producto: "+item.nom_pro+"</td>"+
								     "<h5 class='card-title text-danger'> Precio: "+item.pre_pro+"</h5>"+
								       "<p class='card-text'> Stock Disponible: "+item.stock_pro+"</td>"+						       
								       "<p class='card-text'>"+item.desc_sim_pro+"</td>"+						       
								       "<p> <a href='' class='btn btn-primary'>Añadir</a> </p>"+
						           "</div></div>");
				
	});
});
</script>
</html>