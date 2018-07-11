function buscarPedidos()
{
	var encargo = document.busquedaPedidosForm.encargo.value;
	var cliente = document.busquedaPedidosForm.cliente.value;
	var fecha = document.busquedaPedidosForm.fecha.value;
	var agente = document.busquedaPedidosForm.agente.value;
	
	if ("" != encargo) {
		document.forms[0].submit();
	}
	else if ("" != cliente) 
	{
		document.forms[0].submit();
	}
	else if ("" != fecha && "0" != agente) 
	{
		document.forms[0].submit();
	}
	else
	{
		alert("El campo fecha y agente con complementarios, intente nuevamente.");
	}
}

function seleccionaPedido(agente,fechaPedido,fechaEntrega,anticipo,cdg)
{               	    
    returnVal = new Array(agente,fechaPedido,fechaEntrega,anticipo,cdg);
    window.parent.hidePopWin(true);
}