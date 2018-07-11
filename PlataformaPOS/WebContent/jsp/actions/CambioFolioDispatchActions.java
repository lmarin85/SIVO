package cl.gmo.pos.venta.web.actions;

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

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.beans.FolioBean;
import cl.gmo.pos.venta.web.forms.CambioFolioForm;
import cl.gmo.pos.venta.web.forms.MenuForm;
import cl.gmo.pos.venta.web.helper.CambioFolioHelper;

public class CambioFolioDispatchActions extends DispatchAction {
	
	Logger log = Logger.getLogger( this.getClass() );
	
	
	public ActionForward cargarPagina(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
    		log.info("CambioFolioDispatchActions:cargarPagina  inicio");
    		HttpSession session = request.getSession(true);    	
    		String local = String.valueOf(session.getAttribute(Constantes.STRING_SUCURSAL));
    		CambioFolioHelper helper = new CambioFolioHelper();
    		
    		CambioFolioForm formulario = (CambioFolioForm)form;
    		formulario.setEstaGrabado(0);
    		formulario = helper.cargarPagina(formulario, local);  		
    		
            return mapping.findForward(Constantes.FORWARD_CAMBIO_FOLIO_CARGAR_PAGINA);
    }
	
	
	public ActionForward cambioFolio(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
    		log.info("CambioFolioDispatchActions:cambioFolio  inicio");
    		HttpSession session = request.getSession(true);    	
    		CambioFolioHelper helper = new CambioFolioHelper();
    		CambioFolioForm formulario = (CambioFolioForm)form;
    		formulario.setEstaGrabado(1);
    		String local = String.valueOf(session.getAttribute(Constantes.STRING_SUCURSAL));
    		
    		//valida guias
    		String respuesta = helper.valida(formulario.getDesdeGuia(), formulario.getHastaGuia(), "Guia", local);
    		if("exito".equalsIgnoreCase(respuesta)){     			
    			//valida boletas
        		respuesta = helper.valida(formulario.getDesdeBoleta(), formulario.getHastaBoleta(), "Boletas", local);
        		
        		if("exito".equalsIgnoreCase(respuesta)){
        			//valida notas
            		respuesta = helper.valida(formulario.getDesdeNota(), formulario.getHastaNota(), "Notas", local);
            		if(!"exito".equalsIgnoreCase(respuesta)){
            			formulario = helper.cargarPagina(formulario, local);
            			formulario.setRetornoMOdificacion("error_diferencia");
            			formulario.setMensaje(respuesta);
            			return mapping.findForward(Constantes.FORWARD_CAMBIO_FOLIO_CARGAR_PAGINA);
            		}
        		}else{
        			formulario = helper.cargarPagina(formulario, local);
        			formulario.setRetornoMOdificacion("error_diferencia");
        			formulario.setMensaje(respuesta);
        			return mapping.findForward(Constantes.FORWARD_CAMBIO_FOLIO_CARGAR_PAGINA);
        		}
    			
    		}else{
    			formulario = helper.cargarPagina(formulario, local);
    			formulario.setRetornoMOdificacion("error_diferencia");
    			formulario.setMensaje(respuesta);
    			return mapping.findForward(Constantes.FORWARD_CAMBIO_FOLIO_CARGAR_PAGINA);
    		}  		
    		
    		
    		FolioBean retorno = helper.modificarFolio(formulario, local);
    		
    		if(!("exito".equals(retorno.getRespuesta()))){
    			
    			formulario = helper.cargarPagina(formulario, local);
    		}
    		System.out.println("folio ==>"+retorno.getLocalErrorFolio());
    		formulario.setRetornoMOdificacion(retorno.getRespuesta());
    		formulario.setLocalErrorFolio(retorno.getLocalErrorFolio());
    		
    		
    		
            return mapping.findForward(Constantes.FORWARD_CAMBIO_FOLIO_CARGAR_PAGINA);
    }

	public ActionForward ejemploAjax(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
		try{	
			String codpostal=request.getParameter("codpostal");
			String poblacion=request.getParameter("poblacion");
			poblacion = "esta es la poblacion";
			String provincia = "esta es la provincia";
			
			//JSONObject hm = new JSONObject();
			HashMap hm = new HashMap();
			hm.put("poblacion",poblacion);
			hm.put("provincia",provincia);
			 
			JSONObject json = JSONObject.fromObject(hm);
			response.setHeader("X-JSON", json.toString());
			
		}catch(Exception e){
			System.out.println(e);
		}
		return mapping.findForward("ejemploAjax");
    }
	
	public ActionForward ejemplo(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
		
		
		return mapping.findForward("ejemplo");
    }
	
}
