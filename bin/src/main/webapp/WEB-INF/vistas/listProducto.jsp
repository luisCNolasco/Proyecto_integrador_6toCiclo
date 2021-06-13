<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<title></title>
<style>
.product_list{
	width: 100%;
	display: flex;
	flex-wrap: wrap;	
	margin-top: 30px;
}

.product_list .products_item{
	width: 30%;
	margin-left: 3%;
	margin-bottom: 25px;
	box-shadow: 0px 0px 6px 0px rgba(0,0,0,0.22);
	
	display: flex;
	flex-direction: column;
}

.product_list .products_item img{
	width: 100%; 		
}
</style>
</head>
<body>
<div class="container">
	<div id="card-columns" class="product_list">
		
	</div>
</div>	
</body>
<script type="text/javascript">
$.getJSON("cargaProductoCliente",{}, function (data){
	$.each(data, function(index, item){
		console.log(data);
		console.log(index);
		console.log(item);
		
		
		$("#card-columns").append("<div class='card products_item'>"+
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