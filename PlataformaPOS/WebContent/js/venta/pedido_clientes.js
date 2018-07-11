        
            function Seleccion(tipo)
            {
                document.busquedaClientesForm.tipo.value = tipo;
                document.busquedaClientesForm.submit();
            }
            function seleccionaCliente(agente,fechaPedido,fechaEntrega,anticipo,cdg)
            {               	    
	            returnVal = new Array(agente,fechaPedido,fechaEntrega,anticipo,cdg);
	            window.parent.hidePopWin(true);
            }