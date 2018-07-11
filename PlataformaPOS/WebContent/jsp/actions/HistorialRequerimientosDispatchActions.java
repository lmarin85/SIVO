package cl.gmo.pos.venta.web.actions;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.beans.FamiliaBean;
import cl.gmo.pos.venta.web.forms.HistorialRequerimientosForm;
import cl.gmo.pos.venta.web.helper.HistorialRequerimientosHelper;



public class HistorialRequerimientosDispatchActions extends DispatchAction {
	
		Logger log = Logger.getLogger(this.getClass());
	    String form_origen = Constantes.STRING_BLANCO;
	    HistorialRequerimientosHelper helper = new HistorialRequerimientosHelper();
	
		public ActionForward cargaFormulario(ActionMapping mapping, ActionForm form,
	            HttpServletRequest request, HttpServletResponse response)
	            throws Exception{
			log.info("HistorialRequerimientosDispatchActions:cargaFormulario Inicial inicio");
			log.info("HistorialRequerimientosDispatchActions:cargaFormulario Inicial fin");
			
			try{
				
				
				HistorialRequerimientosForm formulario  = (HistorialRequerimientosForm)form;
				formulario.setListaFamilias(helper.traeFamilias("CRISTALES"));
				String familia = request.getParameter("familia").toString();
				String grupo = request.getParameter("subFamilia").toString();
				formulario.setListaSubFamilias(helper.traeSubFamilias(familia));
				formulario.setListaGruposFamilias(helper.traeGrupoFamilias(familia,grupo));
				
			}catch(Exception e){
				System.out.println("HORROR=>"+e.getMessage());
			}
			return mapping.findForward(Constantes.FORWARD_LISTADO_HISTORIAL_REQUERIMIENTOS);
			
		}
		public ActionForward guardaHistorialReq(ActionMapping mapping, ActionForm form,
	            HttpServletRequest request, HttpServletResponse response)
	            throws Exception{
			
			
			return mapping.findForward(Constantes.FORWARD_LISTADO_HISTORIAL_REQUERIMIENTOS);
		}
	
}
