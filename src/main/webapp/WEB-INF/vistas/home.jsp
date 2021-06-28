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
    
    
    <!--  -->
    <link rel="icon" type="image/png" href="images/favicon.png">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
    <script src="https://kit.fontawesome.com/804e7cdc14.js" crossorigin="anonymous"></script>
 
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">


    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/sam.css">

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
	          		    
	          		    <c:if test="${tipoUsuario.cod_tip_usu == 2}">
             			
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
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
        	
            <a id="sam-home-nav" class="navbar-brand" href="/home"><span class="flaticon-pawprint-1 mr-2"></span>4 PATITAS</a>
          
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
      
      <!-- contenido dinámico -->
      <div>
		<iframe name="miFrame" style="height:100%;width:100%; border:none;">
		</iframe>
	  </div>
      
      <!-- contenido estático -->
      <div id="home-div-click" class="home-div-click">
      	<section class="ftco-section bg-light">
	      <div class="container">
	        <h2 class="mb-4 pb-4 text-center font-weight-bold">Nuestros Veterinarios Profesionales</h2>
	        <div class="row">
	          <div class="col-md-6 col-lg-3 ftco-animate">
	            <div class="staff">
	              <div class="img-wrap d-flex align-items-stretch">
	                <div class="img align-self-stretch" style="background-image: url(images/medicos/medico1.jpg);"></div>
	              </div>
	              <div class="text pt-3 px-3 pb-4 text-center">
	                <h3>Jorge Contreras</h3>
	                <span class="position mb-2">Medicina General</span>
	                <div class="faded">
	                  <p>Desde niño supe que sería médico veterinario para cuidarlos bien.</p>
	                  <ul class="ftco-social text-center">
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-twitter"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-facebook"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-google"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-instagram"></span></a></li>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          </div>
	          
	          <div class="col-md-6 col-lg-3 ftco-animate">
	            <div class="staff">
	              <div class="img-wrap d-flex align-items-stretch">
	                <div class="img align-self-stretch" style="background-image: url(images/medicos/medico2.jpg);"></div>
	              </div>
	              <div class="text pt-3 px-3 pb-4 text-center">
	                <h3>Karol Guzmán</h3>
	                <span class="position mb-2">Aseo y Cuidado</span>
	                <div class="faded">
	                  <p>El aseo de los animalitos es parte importante de su salud y de su felicidad.</p>
	                  <ul class="ftco-social text-center">
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-twitter"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-facebook"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-google"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-instagram"></span></a></li>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="col-md-6 col-lg-3 ftco-animate">
	            <div class="staff">
	              <div class="img-wrap d-flex align-items-stretch">
	                <div class="img align-self-stretch" style="background-image: url(images/medicos/medico3.jpg);"></div>
	              </div>
	              <div class="text pt-3 px-3 pb-4 text-center">
	                <h3>Airana Pau</h3>
	                <span class="position mb-2">Radiografías</span>
	                <div class="faded">
	                  <p>Es importante detectar a tiempo las enfermedades para poder tratarlas.</p>
	                  <ul class="ftco-social text-center">
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-twitter"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-facebook"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-google"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-instagram"></span></a></li>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="col-md-6 col-lg-3 ftco-animate">
	            <div class="staff">
	              <div class="img-wrap d-flex align-items-stretch">
	                <div class="img align-self-stretch" style="background-image: url(images/medicos/medico4.jpg);"></div>
	              </div>
	              <div class="text pt-3 px-3 pb-4 text-center">
	                <h3>Hans Tenazoa</h3>
	                <span class="position mb-2">Medicina General</span>
	                <div class="faded">
	                  <p>Me enorgullezco de mi profesión y me dedico a ello con mucho amor.</p>
	                  <ul class="ftco-social text-center">
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-twitter"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-facebook"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-google"></span></a></li>
	                    <li class="ftco-animate"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fab fa-instagram"></span></a></li>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section> 
     
     <div id="fw-containers2" class="fw-container-crudmascota">
	<section class="ftco-section ftco-faqs">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 order-md-last">
    				<div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" style="background-image:url(images/about.jpg);">
    					<a href="https://vimeo.com/554967460" class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
    						<span class="fa fa-play"></span>
    					</a>
    				</div>
    				<div class="d-flex mt-3">
    					<div class="img img-2 mr-md-2" style="background-image:url(images/about-2.jpg);"></div>
    					<div class="img img-2 ml-md-2" style="background-image:url(images/about-3.jpg);"></div>
    				</div>
    			</div>

    			<div class="col-lg-6">
    				<div class="heading-section mb-5 mt-5 mt-lg-0">
	            <h2 class="mb-3">Preguntas Más Frecuentes</h2>
	            <p>Sigue estos consejos para que tu familia y tus mascotitas tengan la convivencia más armoniosa <i class="fas fa-heart text-danger"></i></p>
    				</div>
    				<div id="accordion" class="myaccordion w-100" aria-multiselectable="true">
						  <div class="card">
						    <div class="card-header p-0" id="headingOne">
						      <h2 class="mb-0">
						        <button href="#collapseOne" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="true" aria-controls="collapseOne">
						        	<p class="mb-0">¿Cómo entrenar a mi mascota?</p>
						          <i class="fa" aria-hidden="true"></i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse show" id="collapseOne" role="tabpanel" aria-labelledby="headingOne">
						      <div class="card-body py-3 px-0 pr-2">
						      	<ol>
						      		<li>Consigue un <b>libro digital</b> en Amazon.com, son económicos y puedes ver las calificaciones antes de elegir el adecuado.</li>
						      		<li>Busca videos en YouTube sobre <b>adiestramiento en positivo</b>. Evita a toda costa el maltrato como método de adiestramiento.</li>
						      		<li>Busca <b>ayuda de expertos</b> en redes sociales cada que tengas una duda. Recuerda que la educación influirá permanentemente en tu mascota.</li>
						      	</ol>
						      </div>
						    </div>
						  </div>

						  <div class="card">
						    <div class="card-header p-0" id="headingTwo" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseTwo" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseTwo">
						        	<p class="mb-0">¿Cuántas mascotas debo tener?</p>
						          <i class="fa" aria-hidden="true"></i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="card-body py-3 px-0">
						      	<ol>
						      		<li>Antes que nada, recuerda siempre adoptar.</li>
						      		<li>Considera el espacio en tu hogar, debes tener un espacio dedicado a ellos.</li>
						      		<li>Asigna a un responsable para no olvidarte del cuidado ninguno.</li>
						      		<li>Cada animalito requiere unas condiciones de hábitat distintos.</li>
						      	</ol>
						      </div>
						    </div>
						  </div>

						  <div class="card">
						    <div class="card-header p-0" id="headingThree" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseThree" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseThree">
						        	<p class="mb-0">¿Cuál elegir: gato o perro?</p>
						          <i class="fa" aria-hidden="true"></i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseThree" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="card-body py-3 px-0">
						      	<ol>
						      		<li>Aunque parezca solo una cuestión de gustos, cada uno tiene diferentes necesidades.</li>
						      		<li>Los gatos son más independientes y no requieren que los ejercites.</li>
						      		<li>Las razas de perros grandes necesitan gastar su energía o sufrirán de estrés.</li>
						      		<li>Los mininos utilizan poco espacio en el hogar.</li>
						      		<li>Los caninos son muy protectores y estarán siempre alerta.</li>
						      	</ol>
						      </div>
						    </div>
						  </div>
						</div>
	        </div>
        </div>
    	</div>
    </section>
	
</div>

<div id="fw-container" class="fw-container container-crudservicio bg-light">
	<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="text-dark">Conoce Nuestros Planes</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-4 ftco-animate">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(images/pricing-1.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">Básico</span>
	            	<span class="price"><sup>S/</sup> <span class="number">90</span> <sub>/mes</sub></span>
	            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>1 baño medicinal</li>
		              <li><span class="fa fa-check mr-2"></span>1 corte de uñas</li>
		              <li><span class="fa fa-check mr-2"></span>1 examen veterinario</li>
		            </ul>

	            	<a href="#" class="btn btn-primary d-block px-2 py-3">Lo Quiero</a>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 ftco-animate">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(images/pricing-2.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">Completo</span>
		            <span class="price"><sup>S/</sup> <span class="number">180</span> <sub>/mes</sub></span>
		            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>2 baños medicinales</li>
		              <li><span class="fa fa-check mr-2"></span>2 cortes de uñas</li>
		              <li><span class="fa fa-check mr-2"></span>1 examen veterinario</li>
		              <li><span class="fa fa-check mr-2"></span>1 cepillado</li>
		              <li><span class="fa fa-check mr-2"></span>1 higiene buco dental</li>
		            </ul>

		            <a href="#" class="btn btn-primary d-block px-2 py-3">Lo Quiero</a>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 ftco-animate">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(images/pricing-3.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">Especial</span>
		            <span class="price"><sup>S/</sup> <span class="number">270</span> <sub>/mes</sub></span>
		            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>2 baños medicinales</li>
		              <li><span class="fa fa-check mr-2"></span>2 cortes de uñas</li>
		              <li><span class="fa fa-check mr-2"></span>2 exámenes veterinario</li>
		              <li><span class="fa fa-check mr-2"></span>2 cepillados</li>
		              <li><span class="fa fa-check mr-2"></span>1 higiene buco dental</li>
		              <li><span class="fa fa-check mr-2"></span>2 sesiones de masajes</li>>
		            </ul>

		            <a href="#" class="btn btn-primary d-block px-2 py-3">Lo Quiero</a>
	            </div>
	          </div>
	        </div>
	      </div>
    	</div>
    </section>	
	
</div>

<div id="fw-container" class="fw-container container-crudproducto">

	<section class="ftco-section testimony-section mt-4">
      <!-- <div class="overlay"></div> -->
      <div class="container">
        <div class="row justify-content-center pb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="text-light">Qué Dicen Nuestros Clientes</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Adoro a las aves, tengo un loro, y me gusta saber que los veterinarios también aman a mi pequeño Jack.</p>
                    <div class="d-flex align-items-center">
                      <div class="user-img" style="background-image: url(images/clientes/cliente1.jpg)"></div>
                      <div class="pl-3">
                        <p class="name">Rosa María</p>
                        <span class="position">Dueña de un lorito <i class="fas fa-feather-alt text-success"></i></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Mi mejor amigo requiere de mucho cuidado por su obesidad natural, es un gran bulldog inglés.</p>
                    <div class="d-flex align-items-center">
                      <div class="user-img" style="background-image: url(images/clientes/cliente2.jpg)"></div>
                      <div class="pl-3">
                        <p class="name">Juan Calderón</p>
                        <span class="position">Dueño de un perrito <i class="fas fa-bone text-secondary"></i></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Los peces llenan me recuerdan la variedad de la vida. En esta tienda puedo encontrar todos sus alimentos.</p>
                    <div class="d-flex align-items-center">
                      <div class="user-img" style="background-image: url(images/clientes/cliente3.jpg)"></div>
                      <div class="pl-3">
                        <p class="name">Julia Carbajal</p>
                        <span class="position">Dueña de un pecesito <i class="fas fa-fish text-info"></i></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Desde que Bob era cachorro, pude confiar en que todas sus vacunas estarían bien controladas aquí.</p>
                    <div class="d-flex align-items-center">
                      <div class="user-img" style="background-image: url(images/clientes/cliente4.jpg)"></div>
                      <div class="pl-3">
                        <p class="name">Mario Ovalle</p>
                        <span class="position">Dueño de un perrito <i class="fas fa-bone text-secondary"></i></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                  <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Mi engreida tiene miles de juguetitos y aún así puedo conseguirle más novedades en la tienda Patitas.</p>
                    <div class="d-flex align-items-center">
                      <div class="user-img" style="background-image: url(images/clientes/cliente5.jpg)"></div>
                      <div class="pl-3">
                        <p class="name">Karen Galindo</p>
                        <span class="position">Dueña de una gatita <i class="fas fa-cat text-dark"></i></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	
</div>


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
    
    <!-- -->
    <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <script src="js/sam.js"></script>
    
</body>

</html>