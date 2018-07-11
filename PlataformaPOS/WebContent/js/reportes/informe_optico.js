
            function validaBuscar()
            {
           		var cliente = document.getElementById('cliente').value;
           		if(cliente==""){
           			alert("Debe ingresar un identificador de cliente valido");
           			location.reload();
           			return;
           		}else{
           			document.forms[0].submit();
           		}         
                
            }

        	function cargaClientePedido(cliente)
        			{	
        				document.getElementById("cliente").value = cliente[0];
                    	document.getElementById("nombre").value = cliente[2];
                    	
        			} 