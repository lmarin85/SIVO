var micierre = false;
function ConfirmarCierre()
{
if (event.clientY < 0)
{
event.returnValue = "Se perderan todos los datos que no han sido almacenados";
setTimeout('micierre = false', 100);
micierre = true;
}
}
 
function carga_url_padre(url)
{	
	document.location=url;
}	
function Seleccion(tipo)
            {   
				var cambiarPagina = true;
				
				try{ 
		 			var fr = frames.menu_principal.document.getElementById('estaGrabado');
		 			if(null !=  fr){
		 				var valor = fr.value;
		 				if(valor == 2){
		 					cambiarPagina = confirm("Desea salir de la p�gina actual sin guardar?");
		 				}
		 			}
            	}catch(err){
            		
            	}
				
            	if(cambiarPagina){
					document.menuForm.seleccion.value = tipo;
	                document.menuForm.submit();
            	}
                
            }
function cerrar_session(){
	
	var cambiarPagina = false;
	var valor = -1;
	try{ 
			var fr = frames.menu_principal.document.getElementById('estaGrabado');
			if(null !=  fr){
				valor = fr.value;
				if(valor == 0){
					cambiarPagina = confirm("�Desea cerrar su Sesi\u00F3n actual sin guardar?");
				}
			}
	}catch(err){
		
	}
	
	if(cambiarPagina){
		
		document.menuForm.seleccion.value = 'cerrar';
    	document.menuForm.submit();
    	
	}else if(valor == -1){
		if(confirm("Desea Cerrar su Sesi\u00F3n, presione ACEPTAR, si no presione CANCELAR")){
			
			document.menuForm.seleccion.value = 'cerrar';
	    	document.menuForm.submit();
	    }
	}
}

function mainmenu(){

$(" #nav ul ").css({display: "none"});

$(" #nav li").hover(function(){

	$(this).find('ul:first:hidden').css({visibility: "visible",display: "none"}).slideDown(400);

	},function(){

		$(this).find('ul:first').slideUp(400);

	});

}

$(document).ready(function(){

	mainmenu();

});