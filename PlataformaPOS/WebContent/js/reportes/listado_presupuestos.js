
			
            function validaBuscar(tipo)
            {
            	var cliente = document.getElementById("cliente").value;
            	var codigo = document.getElementById("codigo").value;
            	var fecha_inicio = document.getElementById("popupDatepicker").value;
            	var fecha_fin = document.getElementById("popupDatepicker2").value;
            	
            	if(""==cliente && ""==codigo && ""== fecha_inicio ){
            		alert("Debe ingresar al menos un cliente, código de presupuesto o fecha inicio para realizar la busqueda");
            		location.reload();
            	}else{
            		
            		if(fecha_inicio !=  "" && fecha_fin==""){
            			document.getElementById("popupDatepicker2").value = fecha_inicio;
            		}            		
            		document.forms[0].submit();
            	}           	
                
            }
            
    		function cargaClientePedido(cliente)
			{			
				document.getElementById("cliente").value = cliente[0];
            	document.getElementById("nombre").value = cliente[2] + " " + cliente[3];
			} 