/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.gmo.pos.venta.web.actions;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.ibm.mq.internal.MQCommonServices.Helper;
import com.ibm.ws.client.ccrct.HelpButtonListener;
import com.ibm.xtq.bcel.generic.IF_ACMPEQ;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.utils.Utils;
import cl.gmo.pos.venta.web.beans.ClienteBean;
import cl.gmo.pos.venta.web.beans.PagoBean;
import cl.gmo.pos.venta.web.beans.ProductosBean;
import cl.gmo.pos.venta.web.beans.TipoFamiliaBean;
import cl.gmo.pos.venta.web.facade.PosVentaFacade;
import cl.gmo.pos.venta.web.forms.SeleccionPagoForm;
import cl.gmo.pos.venta.web.forms.VentaDirectaForm;
import cl.gmo.pos.venta.web.helper.BusquedaProductosHelper;
import cl.gmo.pos.venta.web.helper.VentaDirectaHelper;

/**
 *
 * @author Advice70
 */
public class VentaDirectaDispatchActions extends DispatchAction{
	Logger log = Logger.getLogger( this.getClass() );
	VentaDirectaHelper ventaHelper = new VentaDirectaHelper();
    public VentaDirectaDispatchActions(){}
    
  
    public ActionForward cargaCaja(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
    	log.info("VentaDirectaDispatchActions:cargaCaja  inicio");
    	HttpSession session = request.getSession();
    	String sucursal = session.getAttribute(Constantes.STRING_SUCURSAL).toString();
    	String usuario = session.getAttribute(Constantes.STRING_USUARIO).toString();
    	VentaDirectaForm ventaDirectaForm = (VentaDirectaForm)form;
    	ventaDirectaForm = ventaHelper.traeNumerosCaja(ventaDirectaForm, sucursal);
    	ventaDirectaForm = ventaHelper.traeListaAgentes(ventaDirectaForm, sucursal);
    	ventaDirectaForm.setNombreCajero("0");
    	
    	log.info("VentaDirectaDispatchActions:cargaCaja  fin");
        return mapping.findForward(Constantes.FORWARD_CARGA_CAJA);
    }
    public ActionForward carga(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {  	
    	log.info("VentaDirectaDispatchActions:carga  inicio");
    	HttpSession session = request.getSession();
    	String local = session.getAttribute(Constantes.STRING_SUCURSAL).toString();
    	VentaDirectaForm ventaDirectaForm = (VentaDirectaForm)form;
    	ventaDirectaForm.setEstaGrabado(2);
    	
    	ventaDirectaForm.setEstado(Constantes.STRING_INICIO);
    	session.removeAttribute(Constantes.STRING_LISTA_PRODUCTOS);
    	session.removeAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS);
    	session.removeAttribute(Constantes.STRING_LISTA_MULTIOFERTAS);
    	session.removeAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS_AUX);
    	session.removeAttribute(Constantes.STRING_LISTA_PRODUCTOS_ADICIONALES);
    	session.removeAttribute(Constantes.STRING_TOTAL);
    	session.removeAttribute(Constantes.STRING_LISTA_PAGOS);
    	session.removeAttribute(Constantes.STRING_PRECARGA_BUSQUEDA_OPTICO);
    	ventaDirectaForm.cleanForm();
    	ventaDirectaForm = ventaHelper.traeVenta(ventaDirectaForm, session);     	
    	//comentado debido a que se guardara al momento de presionar en el ticket
    	
    	/*Comentado por lmarin 20141021*/
    	ventaDirectaForm.setNumero_ticket(Constantes.STRING_BLANCO);
    	ventaDirectaForm.setEstado_boleta("-1");
    	ventaDirectaForm.setDivisa("PESO");
    	ventaDirectaForm.setTipoAlbaran("N");

    	
    	//ventaHelper.ingresaVenta(ventaDirectaForm, local, null);
    	log.info("VentaDirectaDispatchActions:carga  fin");
    	
    	return mapping.findForward(Constantes.FORWARD_CARGA);
    }
    
    
    
	public ActionForward IngresaVentaDirecta(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception
    {
		log.info("VentaDirectaDispatchActions:IngresaVentaDirecta  inicio");
       	VentaDirectaForm formulario = (VentaDirectaForm)form;
		HttpSession session = request.getSession(true);
		String local = session.getAttribute(Constantes.STRING_SUCURSAL).toString().trim();
		formulario.setEstado(Constantes.STRING_FORMULARIO);
		formulario.setEstaGrabado(2);
		
		//String nticket = formulario.getEncabezado_ticket() + "/" + numero_ticket_alb;
		//System.out.println("Numero de Ticket=>" +nticket);
		if (Constantes.STRING_AGREGAR_PRODUCTOS.equals(formulario.getAccion())) {
			formulario.setListaProductos((ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS));
			ventaHelper.actualizaProductos(formulario, local, Constantes.STRING_DIRECTA, session);
			if (!formulario.getEstado().equals(Constantes.STRING_PRODUCTOS_NO_ENCONTRADO))
			{
				formulario.setSumaTotal(ventaHelper.sumaTotalValorProductos(formulario));
			}
			session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS, formulario.getListaProductos());
						
			
		}
		if (Constantes.STRING_APLICA_PRECIO_ESPECIAL.equals(formulario.getAccion()))
		{
			int indice = Integer.parseInt(session.getAttribute(Constantes.STRING_PRODUCTO).toString());
			formulario.setListaProductos((ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS));
			ProductosBean producto = formulario.getListaProductos().get(indice);
			formulario.getListaProductos().set(indice, ventaHelper.aplicaPrecioEspecial(producto, formulario.getFecha()));
			
			//se actualiza la tarificacion para las ventas directas 20170508 LMARIN
			formulario.setSumaTotal(ventaHelper.sumaTotalValorProductos(formulario));
			
		}
		if (Constantes.STRING_AGREGAR_CLIENTES.equals(formulario.getAccion())) {
			
			session.setAttribute(Constantes.STRING_CLIENTE, formulario.getCodigo_cliente());
		}
		if (Constantes.STRING_CANTIDAD.equals(formulario.getAccion())) {
			int index = Integer.parseInt(formulario.getAddProducto());
			int cantidad = formulario.getCantidad();
			
			ventaHelper.modificaCantidad(formulario, index, cantidad);
			formulario.setSumaTotal(ventaHelper.sumaTotalValorProductos(formulario));
			session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS, formulario.getListaProductos());
			
			//comprueba si tiene precio especial
				Utils util = new Utils();
				
				if (util.verificaPrecioEspecial(formulario.getListaProductos().get(index), formulario.getFecha())) 
				{
					session.setAttribute(Constantes.STRING_PRODUCTO, index);
					formulario.setEstado(Constantes.STRING_PRODUCTO_PRECIO_ESPECIAL);
				}
				else
				{
					formulario.getListaProductos().set(index, util.eliminaPrecioEspecial(formulario.getListaProductos().get(index)));
				}
		}
		if (Constantes.STRING_ELIMINAR_PRODUCTO.equals(formulario.getAccion()))
		{
			/*
			formulario.setListaProductos((ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_MULTIOFERTAS));
			formulario.setListaProductos(ventaHelper.eliminarProducto(formulario.getAddProducto(), formulario.getListaProductos()));
			session.setAttribute(Constantes.STRING_LISTA_MULTIOFERTAS, formulario.getListaProductos());
			
			formulario.setListaProductos((ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS));
			formulario.setListaProductos(ventaHelper.eliminarProductoMultiofertas(formulario.getAddProducto(), formulario.getListaProductos()));
			session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS , formulario.getListaProductos());
			*/
			
			
			formulario.setListaProductos((ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS));
			formulario.setSumaTotal(ventaHelper.restaTotalValorProductos(formulario));
			formulario.setListaProductos(ventaHelper.eliminarProducto(formulario.getAddProducto(), formulario.getListaProductos()));
			session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS, formulario.getListaProductos());
			
		}
		if(Constantes.STRING_ELIMINAR_PRODUCTO_MULTIOFERTA.equals(formulario.getAccion())){
			
			String codigo_multi_eliminar = formulario.getAddProducto();
			int index_multioferta_eliminar = formulario.getIndex_multi_eliminar();
			
			//Elimina la multioferta de la listaMultiofertas session.
			ArrayList<ProductosBean> lista_multiofertas = (ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_MULTIOFERTAS);
			lista_multiofertas = ventaHelper.eliminarMultioferta(codigo_multi_eliminar, index_multioferta_eliminar,lista_multiofertas);
			session.setAttribute(Constantes.STRING_LISTA_MULTIOFERTAS, lista_multiofertas);
			lista_multiofertas = null;
			
			ArrayList<ProductosBean> lista_productos_multiofertas = (ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS);			
			lista_productos_multiofertas = ventaHelper.eliminarProductoMultioferta(codigo_multi_eliminar, index_multioferta_eliminar, lista_productos_multiofertas);
			session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS , lista_productos_multiofertas);
			lista_productos_multiofertas = null;
			
			formulario.setListaProductos((ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS));
			formulario.setSumaTotal(ventaHelper.restaTotalValorProductos(formulario));
			formulario.setListaProductos(ventaHelper.eliminarProducto(codigo_multi_eliminar, index_multioferta_eliminar,formulario.getListaProductos()));
			session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS, formulario.getListaProductos());
			
			
		}
		if ("valida_venta_directa".equals(formulario.getAccion())) {	
			if (!ventaHelper.validaProductosMultiofertaBD(formulario.getListaProductos(), formulario.getEncabezado_ticket() + "/"+ formulario.getNumero_ticket(), "A"))
	    	{
	    		formulario.setEstado("ERROR_VALIDACION_MULTIOFERTA");
	    	}
			else
			{
				formulario.setEstado("VALIDACION_MULTIOFERTA_OK");
			}
		}
		/*AQUI PASA LA VENTA DIRECTA*/
		if(Constantes.STRING_AGREGAR_VENTA_DIRECTA.equals(formulario.getAccion()))
		{
			//String numero_ticket_alb = String.valueOf(PosVentaFacade.traeNumeroTicket(local));
			//formulario.setNumero_ticket(numero_ticket_alb);
			ventaHelper.ingresaVenta(formulario, local, null);
			boolean hay_multioferta = false;
			hay_multioferta = ventaHelper.ingresaDetalle(formulario.getListaProductos(), formulario.getEncabezado_ticket() + Constantes.STRING_SLASH + formulario.getNumero_ticket(), local, formulario);
			
			if (hay_multioferta)
			{
				if (!formulario.getEstado().equals("ERROR_GUARDADO")) {
				ArrayList<ProductosBean> listaProdMultiOferta = (ArrayList<ProductosBean>)session.getAttribute("listaProductosMultiofertas");
				ventaHelper.ingresaDetalleMultiofertas(formulario.getListaProductos(), local, formulario, listaProdMultiOferta);
				}
			}
			if (!formulario.getEstado().equals("ERROR_GUARDADO")) {
				formulario.setEstaGrabado(2);
			}
		}
		if (Constantes.STRING_PAGO_EXITOSO.equals(formulario.getAccion()))
		{
			ArrayList<ProductosBean> listaProductosAdicionales = new ArrayList<ProductosBean>();
			
			ventaHelper.ingresaVenta(formulario, local, session.getAttribute(Constantes.STRING_TIPO_DOCUMENTO).toString());
			listaProductosAdicionales =	(ArrayList<ProductosBean>) session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS_ADICIONALES);
			formulario.setListaProductos(ventaHelper.agregaProductosGratuitos(listaProductosAdicionales, formulario.getListaProductos()));
			boolean hay_multioferta = false;
			hay_multioferta = ventaHelper.ingresaDetalle(formulario.getListaProductos(), session.getAttribute(Constantes.STRING_TICKET).toString(), local, formulario);
			
			if (hay_multioferta)
			{
				if (!formulario.getEstado().equals("ERROR_GUARDADO")) {
				ArrayList<ProductosBean> listaProdMultiOferta = (ArrayList<ProductosBean>)session.getAttribute("listaProductosMultiofertas");
				ventaHelper.ingresaDetalleMultiofertas(formulario.getListaProductos(), local, formulario, listaProdMultiOferta);
				}
			}
			if (!formulario.getEstado().equals("ERROR_GUARDADO")) {
				ArrayList<PagoBean> listaPagos = new ArrayList<PagoBean>();
				listaPagos = (ArrayList<PagoBean>)session.getAttribute(Constantes.STRING_LISTA_PAGOS);
				String agenteTemporal = session.getAttribute(Constantes.STRING_USUARIO).toString();
				session.setAttribute(Constantes.STRING_USUARIO,formulario.getCajero());
				
				
				
				
				
				
				session.setAttribute(Constantes.STRING_USUARIO,agenteTemporal);
				
				
				//LMARIN BOLETA VENTA DIRECTA 20150601
				String resb="",out2="";
				//calcula los pagos
				formulario.setSumaTotal(Constantes.INT_CERO);
				for (PagoBean pagoBean : listaPagos) {
					formulario.setSumaTotal(formulario.getSumaTotal() + pagoBean.getCantidad());
				}
	
				String idoc = ventaHelper.ingresaDocumento(session.getAttribute(Constantes.STRING_TICKET).toString(),
						Integer.parseInt(session.getAttribute(Constantes.STRING_DOCUMENTO).toString()),
						session.getAttribute(Constantes.STRING_TIPO_DOCUMENTO).toString(),
						formulario.getSumaTotal(), ventaHelper.formatoFecha(ventaHelper.traeFecha()),local);
				String [] folio = idoc.split("_");
				System.out.println("idoc ==> "+idoc);
				//GENERA BOLETA
				SeleccionPagoForm spagoform = (SeleccionPagoForm)session.getAttribute("SeleccionPagoForm");
				System.out.println("GENERA BOLETA =>"+spagoform.getSerie()+"<=>"+spagoform.getBoleta_cliente()+"<=>Nif() =>"+spagoform.getNif()+"<=> Nombre_cliente() =>"+spagoform.getNombre_cliente()+"<=> Boleta_fecha_ent()=>"+spagoform.getBoleta_fecha_ent()+"<=>FECHA =>"+spagoform.getFecha()+"<=> FPAGO =>"+spagoform.getFech_pago());
				
				Utils utils = new Utils();
				
				//INGRESA DETALLE BOLETA ALBARAN
				ventaHelper.ingresaPago(listaPagos, session, formulario);
				
				if(local.equals("S035") || local.equals("S064")){
					try {
						utils.generaXMLAeropuerto(spagoform, folio[1], session);
						
					    log.warn("generaXMLAeropuerto DIRECTA ==> "+local);

					}catch(Exception e) {
		            	log.error("generaXMLAeropuerto error", e);
					}
				}
				
			    //if(folio[0].equals("1")){
			    	
			    spagoform.setNumero_boleta(Integer.parseInt(folio[1]));			    	
			    out2 = ventaHelper.genera_datos_belec("BOLETA-1", spagoform, folio[1], session);
			    	
				//}
			    resb = idoc +"_"+out2;
				formulario.setEstado_boleta(resb);
							
				/*String idoc = ventaHelper.ingresaDocumento(session.getAttribute(Constantes.STRING_TICKET).toString(),
						Integer.parseInt(session.getAttribute(Constantes.STRING_DOCUMENTO).toString()),
						session.getAttribute(Constantes.STRING_TIPO_DOCUMENTO).toString(),
						formulario.getSumaTotal(), ventaHelper.formatoFecha(ventaHelper.traeFecha()));
				
				formulario.setEstado(Constantes.STRING_FIN);*/
			}
										
			
		}
		ventaHelper.cuentaProductos(formulario);
		log.info("VentaDirectaDispatchActions:IngresaVentaDirecta  fin");
		return mapping.findForward(Constantes.FORWARD_DIRECTA);
    }
    
    public ActionForward generaVentaDirecta(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {  	
    	
    	log.info("VentaDirectaDispatchActions:generaVentaDirecta  inicio");
    	VentaDirectaForm formulario = (VentaDirectaForm)form;
    	formulario.setEstaGrabado(2);
    	formulario.setSumaTotalFinal(formulario.getSumaTotal());
    	HttpSession session = request.getSession(true);
    	session.setAttribute(Constantes.STRING_TOTAL, formulario.getSumaTotalFinal());
    	//session.setAttribute(Constantes.STRING_CLIENTE, formulario.getCliente());
    	//session.setAttribute(Constantes.STRING_CLIENTE_VENTA, formulario.getCliente());
    	
    	System.out.println("Numero de Ticket => "+formulario.getNumero_ticket());
    	
    	session.setAttribute(Constantes.STRING_TICKET, formulario.getEncabezado_ticket() + "/" + formulario.getNumero_ticket());
    	session.setAttribute(Constantes.STRING_DIVISA, formulario.getDivisa()); 
		session.setAttribute(Constantes.STRING_CAMBIO, formulario.getCambio());
		session.setAttribute(Constantes.STRING_CAJA, formulario.getNumero_caja()); 
		session.setAttribute(Constantes.STRING_TIPO_ALBARAN, formulario.getTipoAlbaran());
		session.setAttribute(Constantes.STRING_ORIGEN, Constantes.STRING_DIRECTA);
		session.setAttribute(Constantes.STRING_ESTADO_FORM, Constantes.STRING_BLANCO);
		session.setAttribute(Constantes.STRING_LISTA_PAGOS, null);
		session.setAttribute(Constantes.STRING_FECHA, formulario.getFecha());
		session.setAttribute(Constantes.STRING_AGENTE, ventaHelper.traeNombreAgente(formulario.getAgente(), formulario.getListaAgentes()));
    	
    	ArrayList<ProductosBean> lista = new ArrayList<ProductosBean>();
    	lista = formulario.getListaProductos();
    	session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS_ADICIONALES, ventaHelper.traeProductosGratuitos(lista , session.getAttribute(Constantes.STRING_NOMBRE_SUCURSAL).toString(), session.getAttribute(Constantes.STRING_SUCURSAL).toString()));
    	log.info("VentaDirectaDispatchActions:generaVentaDirecta  fin");
    	
    	return mapping.findForward(Constantes.FORWARD_GENERA_VENTA);
        
    	
    }
    
    public ActionForward validaCantidadProductosMultiofertas(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
    	HttpSession session = request.getSession(true);
    	BusquedaProductosHelper helper = new BusquedaProductosHelper();
    	HashMap hm = new HashMap();
    	boolean estado = true;
    	try{
    		
    		ArrayList<ProductosBean> listaMultiofertas = new ArrayList<ProductosBean>();
    		listaMultiofertas = (ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_MULTIOFERTAS);
    		
    		ArrayList<ProductosBean> listaProductosMultioferta = new ArrayList<ProductosBean>();
    		if(null != (ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS)){
    			listaProductosMultioferta.addAll((ArrayList<ProductosBean>)session.getAttribute(Constantes.STRING_LISTA_PRODUCTOS_MULTIOFERTAS));
    		}
        	
        	int contador =0;
        	 if(null != listaMultiofertas){
        		
        		 for (ProductosBean multi : listaMultiofertas){
        			 contador=0;
        			 ArrayList<TipoFamiliaBean> listaTipo_familias = helper.traeTipoFamilias("", multi.getCodigo());   
        			 for(TipoFamiliaBean tfam : listaTipo_familias){
	        			 if(null != listaProductosMultioferta){
	        				 for (ProductosBean prodmulti : listaProductosMultioferta){
	        					 if(prodmulti.getCodigoMultioferta().equals(multi.getCodigo()) && prodmulti.getIndexRelMulti() == multi.getIndexMulti()){
	        						
	        						 if(tfam.getCodigo().equals(prodmulti.getTipoFamilia())){
	        		        				contador++;
	        		        		 }  
	 		        			}
	        				 }
	        			 }  
	        			 //validar si la contador es menor a la cantidad permitida de prodcutos segun la multioferta.
	        			 if(contador < tfam.getCantidad()){
	        				 hm.put("cantidad", "menor");
	        				 hm.put("codigoMulti", multi.getCodigo());
	        				 estado = false;
	        				 break;
	        			 }
        			 
        			 }
        		 }
        		 
        	 } 
        	 if(estado){
	        	 hm.put("cantidad", "ok");
				 hm.put("codigoMulti", "");
        	 }   	
        	
    	}catch(Exception ex){
    		ex.printStackTrace();    		
    	}
    	JSONObject json = JSONObject.fromObject(hm);
		response.setHeader("X-JSON", json.toString());
    	return mapping.findForward(Constantes.FORWARD_DIRECTA);
    }
  	/*
	 * Metodo que trae los datos del cliente mediante ajax
	 * @return json
    */
	  
	public ActionForward  traeClienteDirecta(ActionMapping mapping,
	            ActionForm form,
	            HttpServletRequest request,
	            HttpServletResponse response) throws Exception
	{
		  
		  HttpSession session = request.getSession(true);
		  
		  VentaDirectaForm formulario = (VentaDirectaForm)form;
		  String usuario = request.getParameter("nif").toString();
		  ClienteBean cliente = ventaHelper.traeCliente(usuario,null);
		  HashMap hm = new HashMap();
		  
		  if(null != cliente){
			  
			  	session.setAttribute("nombre_cliente",cliente.getNombre() + " " + cliente.getApellido());
			  	System.out.println("cliente nif ==>"+ cliente.getNif());
	    		hm.put("nif", cliente.getNif());    		
	    		hm.put("nombre_cliente",cliente.getNombre() + " " + cliente.getApellido());
	    		hm.put("dvnif", cliente.getDvnif());
	    		hm.put("codigo_cliente", cliente.getCodigo());
	    		hm.put("fecha_nac", cliente.getFecha_nac());
	    		hm.put("nombre", cliente.getNombre());
	    		hm.put("apellido", cliente.getApellido());
	    		
	    	    formulario.setCodigo_cliente(cliente.getCodigo());
	    
	    	    //SETEO LOS VALORES DEL CLIENTE 20140820
	    	    session.setAttribute(Constantes.STRING_CLIENTE, cliente.getCodigo());
	        	session.setAttribute(Constantes.STRING_CLIENTE_VENTA, cliente.getCodigo());	        	
	        	session.setAttribute("NOMBRE_CLIENTE",cliente.getNombre() + " " + cliente.getApellido());

	        	formulario.setNombreCliente(cliente.getApellido());
	        	
	    	    session.setAttribute(Constantes.STRING_TIPO_ALBARAN, formulario.getTipoAlbaran());
	   
	    		
	    	}else{
	    		hm.put("nif", "");    		
	    		hm.put("nombre_cliente", "");
	    		hm.put("dvFactura", "");
	    		hm.put("codigo_cliente", "");
	    		hm.put("fecha_nac", "");
	    		formulario.setCodigo_cliente("");
	    	}
		  JSONObject json = JSONObject.fromObject(hm);
		  //response.setHeader("X-JSON", json.toString());
		  response.getWriter().print(json.toString());	
			
		  return null;
    }
    
      
}
