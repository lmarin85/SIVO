
			
			function trim_trabajos_pendientes(s){
				s = s.replace(/\s+/gi, ''); //sacar espacios repetidos dejando solo uno
				s = s.replace(/^\s+|\s+$/gi, ''); //sacar espacios blanco principio y final
				return s;
			}
			function cargaClientePedido(cliente)
				{			
					document.getElementById("cliente").value = cliente[0];
	            	document.getElementById("nombre").value = cliente[2] + " " + cliente[3];
				}
		
			
            