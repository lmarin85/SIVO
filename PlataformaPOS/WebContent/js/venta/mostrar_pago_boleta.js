 

function eliminar_pago_boleta(forma_pago, fecha_pago,ruta){
	
	showPopWin(ruta+'/SeleccionPago.do?method=valida_des_forma_pago',440, 137,null,false);	 
	
	//MODIFICADO PARA SOLICITAR PERMISO PARA BORRAR LAS BOLETAS
	$j('#accion').val("eliminarFormaPagoBoleta");
	$j('#f_pago').val(forma_pago);	
	$j('#fech_pago').val(fecha_pago);
	//document.seleccionPagoForm.submit();*/				
}

function eliminar_pago_boleta_albaranes(forma_pago, fecha_pago,ruta){
	document.getElementById('f_pago').value=forma_pago;	
	document.getElementById('fech_pago').value=fecha_pago;
	document.seleccionPagoForm.submit();
}