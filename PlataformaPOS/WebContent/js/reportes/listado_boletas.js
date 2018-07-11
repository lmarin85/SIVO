function trimBoletas(s){
	s = s.replace(/\s+/gi, ''); //sacar espacios repetidos dejando solo uno
	s = s.replace(/^\s+|\s+$/gi, ''); //sacar espacios blanco principio y final
	return s;
}
            function validaBuscar(tipo)
            {
            	var popupDatepicker = document.getElementById('popupDatepicker').value;
            	var numero_boleta = document.getElementById('numero_boleta').value;
            	numero_boleta = trimBoletas(numero_boleta);
            	if(""==popupDatepicker &&  "" == numero_boleta){
            		alert("Debe ingresar un fecha o número de boleta para realizar la busqueda");
            	}else{
            		document.forms[0].submit();
            	}
            	
            }