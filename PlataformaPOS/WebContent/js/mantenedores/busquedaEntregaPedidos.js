
            function Seleccion(tipo)
            {
                document.forms[0].accion.value = tipo;
                document.forms[0].submit();
            }
            
            function seleccionaPedido(codigo){
            	returnVal = new Array(codigo);
	            window.parent.hidePopWin(true);
            }
           