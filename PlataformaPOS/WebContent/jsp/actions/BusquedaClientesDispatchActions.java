package cl.gmo.pos.venta.web.actions;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.beans.ClienteBean;
import cl.gmo.pos.venta.web.beans.GraduacionesBean;
import cl.gmo.pos.venta.web.forms.BusquedaClientesForm;
import cl.gmo.pos.venta.web.helper.BusquedaClientesHelper;

public class BusquedaClientesDispatchActions extends DispatchAction {

	BusquedaClientesHelper helper = new BusquedaClientesHelper();
	Logger log = Logger.getLogger(this.getClass());

	public BusquedaClientesDispatchActions() {
	}

	public ActionForward cargaBusquedaClientes(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("BusquedaClientesDispatchActions:cargaBusquedaClientes inicio");
		log.info("BusquedaClientesDispatchActions:cargaBusquedaClientes fin");
		
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		log.info("BusquedaClientesDispatchActions:buscar inicio");
		BusquedaClientesForm formulario = (BusquedaClientesForm) form;
		String accion = Constantes.STRING_BLANCO;
		accion = formulario.getAccion();
		formulario.setError(Constantes.STRING_ERROR);
		if (Constantes.STRING_BUSQUEDA.equals(accion)) {
			if (helper.valida_campos(formulario)) {
				formulario.setListaClientes(helper.traeClientes(
						formulario.getNif(), formulario.getNombre(),
						formulario.getApellido(), formulario.getCodigo()));
			}
			
		}
		log.info("BusquedaClientesDispatchActions:buscar fin");
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA);
	}

	
	public ActionForward buscarClienteAjax(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		log.info("BusquedaClientesDispatchActions:buscar inicio");
		BusquedaClientesForm formulario = (BusquedaClientesForm) form;

		String nif=request.getParameter("nif");
		String pagina = request.getParameter("pagina");
		
		ClienteBean cliente = helper.traeClienteSeleccionado(nif,null);
		
		
		
		String nombre = cliente.getNombre();
		String apellido = cliente.getApellido();
		
    	HashMap hm = new HashMap();
    	
    	System.out.println("buscarClienteAjax() ==>" + cliente.getNif() + "<==>"+cliente.getCodigo());
    	
    	if(null != cliente){
    		
    		hm.put("nif", cliente.getNif());    		
    		hm.put("nombre_cliente", nombre.replace("Ñ", "N") + " " + apellido.replace("Ñ", "N"));
    		hm.put("dvnif", cliente.getDvnif());
    		hm.put("codigo_cliente", cliente.getCodigo());
    		hm.put("fecha_nac", cliente.getFecha_nac());
    		hm.put("nombre", nombre.replace("Ñ", "N"));
    		hm.put("apellido", apellido.replace("Ñ", "N"));
    		//GraduacionesBean graduacion = helper.traeUltimaGraduacionCliente(cliente.getCodigo());
    		
    		/*if(null != graduacion){
    			
    			hm.put("fecha_graduacion", graduacion.getFecha());
    			hm.put("OD_esfera", graduacion.getOD_esfera());
    			hm.put("OD_cilindro", graduacion.getOD_cilindro());    			
    			hm.put("OD_eje", graduacion.getOD_eje());
    			hm.put("OD_adicion", graduacion.getOD_adicion());
    			hm.put("OD_esfera_cerca", graduacion.getOD_esfera_cerca());
    			hm.put("OD_n", graduacion.getOD_n());
    			hm.put("OD_p", graduacion.getOD_p());
    			
    			hm.put("doctor", graduacion.getDoctor());
    			
    			hm.put("OI_esfera", graduacion.getOI_esfera());
    			hm.put("OI_cilindro", graduacion.getOI_cilindro());
    			hm.put("OI_eje", graduacion.getOI_eje());
    			hm.put("OI_adicion", graduacion.getOI_adicion());
    			hm.put("OI_esfera_cerca", graduacion.getOI_esfera_cerca());
    			hm.put("OI_n", graduacion.getOI_n());
    			hm.put("OI_p", graduacion.getOI_p());   		
    			
    		}else{
    			hm.put("fecha_graduacion", Constantes.STRING_BLANCO);
    			hm.put("OD_esfera", Constantes.STRING_BLANCO);
    			hm.put("OD_eje", Constantes.STRING_BLANCO);
    			hm.put("OD_adicion", Constantes.STRING_BLANCO);
    			hm.put("OD_esfera_cerca", Constantes.STRING_BLANCO);
    			hm.put("OD_n", Constantes.STRING_BLANCO);
    			hm.put("OD_p", Constantes.STRING_BLANCO);
    			
    			hm.put("doctor", Constantes.STRING_BLANCO);
    			
    			hm.put("OI_esfera", Constantes.STRING_BLANCO);
    			hm.put("OI_cilindro", Constantes.STRING_BLANCO);
    			hm.put("OI_eje", Constantes.STRING_BLANCO);
    			hm.put("OI_adicion", Constantes.STRING_BLANCO);
    			hm.put("OI_esfera_cerca", Constantes.STRING_BLANCO);
    			hm.put("OI_n", Constantes.STRING_BLANCO);
    			hm.put("OI_p", Constantes.STRING_BLANCO);
    		}*/
    		
    	}else{
    		hm.put("nif", "");    		
    		hm.put("nombre_cliente", "");
    		hm.put("dvFactura", "");
    		hm.put("codigo_cliente", "");
    		hm.put("fecha_nac", "");
    	}
    	
    	JSONObject json = JSONObject.fromObject(hm);
    	response.setContentType("application/x-json;charset=UTF-8");
		response.setHeader("X-JSON", json.toString());
		
		log.info("BusquedaClientesDispatchActions:buscar fin");
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA);
	}

}
