package cl.gmo.pos.venta.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.forms.BusquedaMedicoForm;
import cl.gmo.pos.venta.web.helper.BusquedaMedicosHelper;

public class BusquedaMedicosActions extends DispatchAction{

	Logger log = Logger.getLogger( this.getClass() );
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) 
	{
		log.info("BusquedaMedicosActions:buscar inicio");
		BusquedaMedicoForm formulario = (BusquedaMedicoForm)form;
		formulario.setNif(formulario.getNif());
		log.info("BusquedaMedicosActions:buscar fin");
		return mapping.findForward(Constantes.STRING_ACTION_BUSCAR_MEDICO);
	}
	
	public ActionForward buscarMedico(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) 
	{
		log.info("BusquedaMedicosActions:buscarMedico inicio");
		BusquedaMedicoForm formulario = (BusquedaMedicoForm)form;
		BusquedaMedicosHelper helper = new BusquedaMedicosHelper();
		formulario.setError(Constantes.STRING_ERROR);
		try{
			
			if(Constantes.STRING_ACTION_BUSQUEDA_MEDICO.equals(formulario.getAccion())){
				if (helper.valida_campos(formulario)) {
					formulario.setListaOftalmologos(helper.traeMedicos(formulario));
				}
				
				
			}			
			
		}catch(Exception ex){
			log.error("BusquedaMedicosActions:buscarMedico error catch",ex);
		}
		
		log.info("BusquedaMedicosActions:buscarMedico fin");
		return mapping.findForward(Constantes.STRING_ACTION_BUSCAR_MEDICO);
	} 
	
}
