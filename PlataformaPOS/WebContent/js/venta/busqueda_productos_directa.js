
		function pasar_Producto()
            {
            var producto = "";
            var cantidad = "";
            	if(event.keyCode == 13){
            		producto = document.getElementById('producto').value;
            		if(producto == '')
           		 	{
           		 		alert("Debe ingresar un codigo de barras");
           		 	}
           		 	else
           		 	{
			           	cantidad = "1";
			           	returnVal = new Array(producto, cantidad);
			           	window.parent.hidePopWin(true);
		           	}
           		}	
            }