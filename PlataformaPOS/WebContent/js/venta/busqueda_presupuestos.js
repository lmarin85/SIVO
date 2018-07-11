function buscarPresupuestos()
{
	var presupuesto = document.busquedaPresupuestosForm.presupuesto.value;
	var cliente = document.busquedaPresupuestosForm.cliente.value;
	var fecha = document.busquedaPresupuestosForm.fecha.value;
	var agente = document.busquedaPresupuestosForm.agente.value;
	
	if ("" != presupuesto) {
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

function seleccionaPresupuesto(agente,fechaPedido,cerrado,cdg)
{            
    returnVal = new Array(agente,fechaPedido,cerrado,cdg);
    window.parent.hidePopWin(true);
}