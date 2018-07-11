            function Seleccion(tipo)
            {
            	document.getElementById('tipo').value = tipo;
            	document.forms[0].submit();
            }
            
            function seleccionaMedico(codigo, nif, lnif,nombre,apelli)
            {
            	returnVal = new Array(codigo, nif, lnif, nombre, apelli);
	            window.parent.hidePopWin(true);
            }
            function estado(error)
			{
				if (error != 'error') {
					alert(error);
				}
			}