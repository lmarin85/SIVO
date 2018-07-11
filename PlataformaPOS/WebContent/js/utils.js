function load(){
	var $j = jQuery.noConflict();
	$j(window).load(function(){
	$j.fn.LoadingMessage = function (a){
			   var attr, loading,href;
			$j(this).click(function(event){
			var href=$j(this).attr('href');
			   loading = '<div id="'+a.css+'"><img src="images/cargando.gif" title="cargando" /><\/div>'; 
				$j('body').prepend(loading);	
			  });
	       return false; 
	    };
		
		$j('#enviar').LoadingMessage({
			 css:'loading'
	    }); 
	
	});
}

function soloLetras(e){
	 key = e.keyCode || e.which;
	 tecla = String.fromCharCode(key).toLowerCase();
	 letras = " �����abcdefghijklmn�opqrstuvwxyz";
	 especiales = [8,180,46,32];

	 tecla_especial = false;
	 
	 for(var i in especiales)
	 {
	     if(key == especiales[i])
	     {
	    	 tecla_especial = true;
	    	 break;
	     } 
	 }
	 
	 if(letras.indexOf(tecla)==-1 && !tecla_especial)
	 return false;
}


function validar_numerico(e) 
{
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true; //Tecla de retroceso (para poder borrar)
    patron = /\d/;
    te = String.fromCharCode(tecla);
    return patron.test(te); 
}

function validar_numerico_decimal(e) 
{
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true; //Tecla de retroceso (para poder borrar)
    if (tecla==46) return true; //Tecla de .
    patron = /\d/;
    te = String.fromCharCode(tecla);
    return patron.test(te); 
}


function trim(s){
	s = s.replace(/\s+/gi, ''); //sacar espacios repetidos dejando solo uno
	s = s.replace(/^\s+|\s+$/gi, ''); //sacar espacios blanco principio y final
	return s;
}

function calculaEdad()
{
	var fecha = document.getElementById('fnacimiento').value;
	var respuesta  = calcular_edad(fecha);
	if(respuesta == false){
		alert("Fecha Incorrecta");
		document.getElementById('edad').value = 0;
	}else{
		if(respuesta == -2)
			document.getElementById('edad').value = 0;
		else
			document.getElementById('edad').value = respuesta;
	}
}

function calcular_edad(fecha)
{ 				
   	//calculo la fecha de hoy 
   	var hoy=new Date(); 
   	//alert(hoy) 
  
   	//calculo la fecha que recibo 
   	//La descompongo en un array 
   	var array_fecha = fecha.split("/");
   	//si el array no tiene tres partes, la fecha es incorrecta 
   	if (array_fecha.length!=3) 
      	 return false; 

   	//compruebo que los ano, mes, dia son correctos 
   	var ano;    	
   	ano = parseInt(array_fecha[2]);
   	
   	if (isNaN(ano)) 
      	 return false; 

   	var mes;	
   	mes = parseInt(array_fecha[1]);
   	
   	if (isNaN(mes)) 
      	 return false; 

   	var dia;	
   	dia = parseInt(array_fecha[0]);
   	
   	if (isNaN(dia)) 
      	 return false; 

   	//si el a�o de la fecha que recibo solo tiene 2 cifras hay que cambiarlo a 4 
   	if (ano<=99) 
      	 ano +=1900; 
   
   	//resto los a�os de las dos fechas 
   	edad=hoy.getYear()- ano - 1; //-1 porque no se si ha cumplido a�os ya este a�o 
   	
   	if(edad >= 0){
   		
	   	//si resto los meses y me da menor que 0 entonces no ha cumplido a�os. Si da mayor si ha cumplido 
	   	if (hoy.getMonth() + 1 - mes < 0) //+ 1 porque los meses empiezan en 0 
	      	 return edad; 
	   	if (hoy.getMonth() + 1 - mes > 0) 
	      	 return edad+1;    	
	   	//entonces es que eran iguales. miro los dias 
	   	//si resto los dias y me da menor que 0 entonces no ha cumplido a�os. Si da mayor o igual si ha cumplido 
	   	if (hoy.getUTCDate() - dia >= 0) 
	      	 return edad + 1; 	   	
   	}
   	else{
   		return -2;
   	}
   	return edad; 
} 

function getAbsoluteElementPosition(element) {	 
	  var y = 0;
	  var x = 0;
	  while (element.offsetParent) {
	    x += element.offsetLeft;
	    y += element.offsetTop;
	    element = element.offsetParent;
	  }
	  return {top:y,left:x};
}

function validarRut(numero,dv) {
	alert(numero);
    if(!isNaN(numero) || numero.length == 0 || numero.length > 8 ) {

        return false;

    } else {

        if(getDV(numero) == dv) return true;

    }

    return false;

}

function getDV(numero) {
    nuevo_numero = numero.toString().split("").reverse().join("");

    for(i=0,j=2,suma=0; i < nuevo_numero.length; i++, ((j==7) ? j=2 : j++)) {

        suma += (parseInt(nuevo_numero.charAt(i)) * j);

    }

    n_dv = 11 - (suma % 11);

    return ((n_dv == 11) ? 0 : ((n_dv == 10) ? "K" : n_dv));

}

function esFechaValida(fecha, texto){
    if (fecha != undefined && fecha.value != "" ){
        if (!/^\d{2}\/\d{2}\/\d{4}$/.test(fecha.value)){
            alert("formato de fecha no valido (dd/mm/aaaa)");
            return false;
        }
        var dia  =  parseInt(fecha.value.substring(0,2),10);
        var mes  =  parseInt(fecha.value.substring(3,5),10);
        var anio =  parseInt(fecha.value.substring(6),10);
 
    switch(mes){
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            numDias=31;
            break;
        case 4: case 6: case 9: case 11:
            numDias=30;
            break;
        case 2:
            if (comprobarSiBisisesto(anio)){ numDias=29; }else{ numDias=28;};
            break;
        default:
            alert("Fecha introducida erronea");
            return false;
    }
 
        if (dia>numDias || dia==0){
            alert("Fecha introducida erronea");
            return false;
        }
        return true;
    }else{
    	alert("Debe ingresar fecha "+texto);
    }
}

function comprobarSiBisisesto(anio){
	if ( ( anio % 100 != 0) && ((anio % 4 == 0) || (anio % 400 == 0))) {
	    return true;
	    }
	else {
	    return false;
	    }
}

function colordeTabla(tabla)
	{
		try{
			var rows = tabla.getElementsByTagName("tr");
			
			for( i=0; i < rows.length; i++)
			{
				rows[i].style.background = '#c1c1c1';
			}
		}catch(Error){}
	}

function cambiaEstadoNOGrabado(){
	
	document.getElementById("estaGrabado").value=0;
	
}

Array.prototype.clean = function(deleteValue) {
	  for (var i = 0; i < this.length; i++) {
	    if (this[i] == deleteValue) {         
	      this.splice(i, 1);
	      i--;
	    }
	  }
	  return this;
};

