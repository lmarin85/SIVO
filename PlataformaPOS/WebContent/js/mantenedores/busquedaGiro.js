			function Seleccion(tipo)
            {
                document.getElementById("tipo").value = tipo;
                document.forms[0].submit();
            }
            function seleccionaGiro(giro, descripcion)
            {               	    
	            returnVal = new Array(giro, descripcion);
	            window.parent.hidePopWin(true);
            }