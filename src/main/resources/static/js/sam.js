$(document).ready(function() {
	$("#sam-login").click(function(){
		document.location.href = "./login";
	});
	$("#sam-login-tab").click(function(){
		document.getElementById("fw-container").style.backgroundImage="url(./images/bg_4.png)";
	});
	$("#sam-signup-tab").click(function(){
		document.getElementById("fw-container").style.backgroundImage="url(./images/bg_5.png)";
	});
	
	$("#left-lout").mouseenter(function(){
		document.getElementById("option-lout").style.visibility="visible";
	});
	$("#left-lout").mouseleave(function(){
		setTimeout(function(){ document.getElementById("option-lout").style.visibility="hidden"; }, 2000);
		
	});
});
