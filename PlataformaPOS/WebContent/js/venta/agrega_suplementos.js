			var returnVal = "";
            function eliminarSuplemento(index)
            {
            		document.suplementosForm.suplemento_desc.value = index;
            		document.suplementosForm.accion.value = "eliminarProducto";
          			document.suplementosForm.submit();
            }
            function recupera_suplemento(combo)
            {
            	if(combo.options[combo.selectedIndex].text != "Seleccionar")
            	{
            		document.suplementosForm.suplemento_desc.value = combo.options[combo.selectedIndex].text;
            		document.suplementosForm.accion.value = "carga_valores";
          			document.suplementosForm.submit();
            	}
            }
            function enviar()
            {
            	try{ 
            	if (document.suplementosForm.suplemento.value != 0) {
            		if(document.suplementosForm.valor.value != "")
	            	{
	            		document.suplementosForm.accion.value = "agregar";
	            		document.suplementosForm.submit();
	            	}
	            	else
	            	{
	            		alert("Debe ingresar un valor");	
	            	}
				}
				else
				{
					alert("Debe seleccionar un suplemento");
				}
            	}catch(err){
            		alert("Artículo no permite suplementos");
            	}
					
            }
          function valida_error(error)
          {
         		if (error == "cierre_ok")
				{
					returnVal = "con_suplementos";
					window.parent.hidePopWin(true);
				}else
				{
					if (error != "sin_error") 
					{
						alert(error);
					}
				}
          }
          function cerrar()
          {
          		document.suplementosForm.accion.value = "cerrar";
          		document.suplementosForm.submit();
          }