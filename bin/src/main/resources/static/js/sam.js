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
	
	$('#dropright #dropdown').hover(function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp(105)
    });
	
});
