

			function estado(error)
			{
				if (error != 'error') {
					alert(error);
				}
			}
			
            function Seleccion(tipo)
            {
            	var val_rut = /^[0-9]{7,8}$/; 
            	var nif= document.getElementById('nif').value;  
              
	            if(nif != ""){
	        	 	if(val_rut.test(nif) != false ){
	            		document.busquedaClientesForm.tipo.value = tipo;
	            		document.busquedaClientesForm.submit();
	            	}else{
	            		alert("Debe ingresar un rut de cliente válido");
	            	}
            	}
            }
            function seleccionaCliente(codigo, nif, nombre, apellido,dvnif)
            {               	    
	            returnVal = new Array(codigo, nif, nombre, apellido, dvnif);
	            window.parent.hidePopWin(true);
            }