<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Home 4 patitas</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
    <script src="https://kit.fontawesome.com/804e7cdc14.js" crossorigin="anonymous"></script>
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

<script>            
(function(b,c){
	var e=document.createElement('link');
	e.rel='stylesheet',e.type='text/css',e.href='https://chatboxlive.blahbox.net/static/css/main.css',document.getElementsByTagName('head')[0].appendChild(e);
	var f=document.createElement('script');
	f.onload=function(){
		var g;
		if(c)g='previewInit';
		else{
			var h=document.createElement('div');
			g='cbinit',h.id='cbinit',document.body.append(h)
			}            
		console.log(document.querySelector('#'+g)),chatbox.initChat(document.querySelector('#'+g),b,c)},f.src='https://chatboxlive.blahbox.net/static/js/chat-lib.js',document.getElementsByTagName('head')[0].appendChild(f)})                ('beff5f1f1df29456967aaa5b273492eb', 0);          
</script>
</head>
<body>
     <div class="wrap">
     		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2">
						<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span> +51 971 893 196</a> 
						<a href="#"><span class="fa fa-paper-plane mr-1"></span> contacto@4patitas.com</a>
					</p>
				</div>
				
				<div id="dropright" class="col-md-6 d-flex justify-content-md-end social-media"  style="position: relative">
				<p class="mb-0 d-flex align-items-center text-light">
				<a href="carrito" target="miFrame" class="d-flex align-items-center justify-content-center"><span class="fa fa-shopping-cart"><i class="sr-only"></i></span></a>
				</p>
				<p class="mb-0 d-flex align-items-center text-light">
				<a href="reser" target="miFrame" class="d-flex align-items-center justify-content-center"><span class="fas fa-bookmark"><i class="sr-only"></i></span></a>
				</p>
					<div class="drop-list">
				    <div id="dropdown" class="dropdown dropright">				    
				   <p class="mb-0 d-flex align-items-center text-light sam-login dropdown-toggle" data-toggle="dropdown">				   
				   <a href="/login" class="d-flex align-items-center justify-content-center"><span class="fa fa-user"><i class="sr-only"></i></span></a>        
				    <span>Bienvenido Sr(a): ${sessionScope.objUsuario.nombreCompleto}</span>
				  </p>
				      <div class="dropdown-menu">
				      <c:forEach var="tipoUsuario" items="${sessionScope.objTipoUsuario}">
				      	
				      	<c:if test="${tipoUsuario.cod_tip_usu == 1}">
             			
				        <a class="dropdown-item" href="logout">Cerrar Sesión</a>
				       
	          		    </c:if> 
				      
			                         
			             <c:if test="${tipoUsuario.cod_tip_usu == 3}">
				         <c:forEach var="e" items="${sessionScope.objInterfaz}">
             			 <c:choose>
             			 
             			<c:when test="${e.cod_int == 10}">     			    
				        <a class="dropdown-item" target="miFrame" href="${e.url_int}">Mi Perfil</a>
				       	</c:when>	
				       	
				       <c:when test="${e.cod_int == 14}">
				        <a class="dropdown-item" target="miFrame" href="${e.url_int}">Mis pedidos</a>
				       </c:when> 
				        
				        <c:when test="${e.cod_int == 15}">
				        <a class="dropdown-item" target="miFrame" href="${e.url_int}">Mis reservas</a>
				        </c:when> 
				        
				        <c:when  test="${e.cod_int == 16}">
				        <a class="dropdown-item" href="${e.url_int}">Cerrar Sesión</a>
				        </c:when>
				        
				        </c:choose>
	          			</c:forEach>
	          		    </c:if>    	       
	         		</c:forEach>			
				    </div>
				</div>
				</div>
			</div>
		</div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
        	
            <a class="navbar-brand" href="/home"><span class="flaticon-pawprint-1 mr-2"></span>4 PATITAS</a>
          
          <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
              <!-- Control de Tipo de Usuario --> 	
              <c:forEach var="tipoUsuario" items="${sessionScope.objTipoUsuario}">
              
              <!-- Tipo de Usuario ==== ADMINISTRADOR --> 	              
              <c:if test="${tipoUsuario.cod_tip_usu == 1}">
              
              <c:forEach var="x" items="${sessionScope.objInterfaz}"> 
              <c:choose>         
              
              <c:when test="${x.cod_int == 1}">            
              <li class="nav-item"><a href="${x.url_int}" class="nav-link">Inicio</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 2}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Productos</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 3}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Servicios</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 4}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Mascotas</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 5}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Usuarios</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 6}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Pedidos</a></li>
              </c:when>
              
              
              
              <c:when test="${x.cod_int == 8}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Reservas</a></li>
              </c:when>
              
              </c:choose>
	          </c:forEach>
	         	
              </c:if>
              <!-- FIN Tipo de Usuario ==== ADMINISTRADOR -->
              
              <!-- Tipo de Usuario ==== EMPLEADO -->
			  <c:if test="${tipoUsuario.cod_tip_usu == 2}">
              
              <c:forEach var="x" items="${sessionScope.objInterfaz}">
              <c:choose>         
              
              <c:when test="${x.cod_int == 17}">            
              <li class="nav-item"><a href="${x.url_int}" class="nav-link">Inicio</a></li>
              </c:when>
              
              
              
              <c:when test="${x.cod_int == 18}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Mascotas</a></li>
              </c:when>
              
          
              
              
              
              <c:when test="${x.cod_int == 19}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Incidencias</a></li>
              </c:when>
                          
              
              </c:choose>
	          </c:forEach>
              
              </c:if>
			  <!-- FIN Tipo de Usuario ==== EMPLEADO --> 
			  
			  <!-- Tipo de Usuario ==== CLIENTE -->
			  <c:if test="${tipoUsuario.cod_tip_usu == 3}">
             	
              <c:forEach var="x" items="${sessionScope.objInterfaz}">
              <c:choose>         
              
              <c:when test="${x.cod_int == 9}">            
              <li class="nav-item"><a href="${x.url_int}" class="nav-link">Inicio</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 11}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Productos</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 12}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Servicios</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 13}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Mascotas</a></li>
              </c:when>
              
              </c:choose>
	          </c:forEach>
             	
              </c:if>    	
              <!-- FIN Tipo de Usuario ==== CLIENTE -->         
	         </c:forEach>
            </ul>
          </div>
        </div>
      </nav>
         
     
      <div>
		<iframe name="miFrame" style="height:100%;width:100%; border:none;">
		</iframe>
	  </div>
		
  
      
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        crossorigin="anonymous"></script>  
    <script src="js/sam.js"></script>    
    
</body>

</html>