userAgentVar = navigator.userAgent;  
	navegador_ok = "true";
	if (userAgentVar.indexOf ("MSIE 7.0")== "-1" && userAgentVar.indexOf ("MSIE 8.0")== "-1")
	{
		navegador_ok = "false";
		alert("Este sitio web, fue diseñado para Internet Explorer versiones 7 y 8, su navegador no es compatible");
	}


function validar(){

	if (navegador_ok == "false") {
		alert("Navegador no compatible, no es posible continuar");
		return false;
	}
	else
	{
	if(usuarioForm.nombreUsuario.value=="" || usuarioForm.claveUsuario.value==""){
		alert("Los campos User y Password son requeridos");
		return false;
	}else{
	 return true;
	}
	}
}