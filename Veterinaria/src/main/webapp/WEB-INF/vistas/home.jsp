<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Home 4 patitas</title>
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
                    <div class="col-md-6 d-flex justify-content-md-end">
                        <div class="social-media">
                        <p id="sam-login" class="mb-0 d-flex align-items-center text-light sam-login">
                <a href="login.html" class="d-flex align-items-center justify-content-center"><span class="fa fa-user"><i class="sr-only"></i></span></a>
                <span>Bienvenido Sr(a): ${sessionScope.objUsuario.nombreCompleto}</span>
                        </p>
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
              
              <c:when test="${x.cod_int == 7}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Incidencias</a></li>
              </c:when>
              
              </c:choose>
	          </c:forEach>
	         	
              </c:if>
              <!-- FIN Tipo de Usuario ==== ADMINISTRADOR -->
              
              <!-- Tipo de Usuario ==== EMPLEADO -->
			  <c:if test="${tipoUsuario.cod_tip_usu == 2}">
              
              </c:if>
			  <!-- FIN Tipo de Usuario ==== EMPLEADO -->
			  
			  <!-- Tipo de Usuario ==== CLIENTE -->
			  <c:if test="${tipoUsuario.cod_tip_usu == 3}">
             	
              <c:forEach var="x" items="${sessionScope.objInterfaz}">
              <c:choose>         
              
              <c:when test="${x.cod_int == 8}">            
              <li class="nav-item"><a href="${x.url_int}" class="nav-link">Inicio</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 9}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Productos</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 10}">
              <li class="nav-item"><a href="${x.url_int}" class="nav-link" target="miFrame">Servicios</a></li>
              </c:when>
              
              <c:when test="${x.cod_int == 11}">
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
		
         <!-- <h3>BCP</h3>
		<h4>Bienvenido Sr(a): ${sessionScope.objUsuario.nombreCompleto}</h4>                
		<h4>DNI : ${sessionScope.objUsuario.dni_usu}</h4>
		<h4>Interfaz 	</h4>
			<ul>
		        <c:forEach var="x" items="${sessionScope.objInterfaz}">
		            <li>
		                   ${x.cod_int} 
		            </li>
		        </c:forEach>
		    </ul>
		 <h4>Tipo de Usuario 	</h4>
			<ul>
		        <c:forEach var="y" items="${sessionScope.objTipoUsuario}">
		            <li>
		                   ${y.nom_tip_usu} 
		            </li>
		        </c:forEach>
		    </ul> 
	 </div>-->

		
      
      
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
</body>

</html>