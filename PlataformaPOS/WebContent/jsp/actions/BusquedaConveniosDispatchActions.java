package cl.gmo.pos.venta.web.actions;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.beans.ConvenioBean;
import cl.gmo.pos.venta.web.forms.BusquedaConveniosForm;
import cl.gmo.pos.venta.web.helper.BusquedaConveniosHelper;

public class BusquedaConveniosDispatchActions extends DispatchAction {
	Logger log = Logger.getLogger(this.getClass());
	BusquedaConveniosHelper helper = new BusquedaConveniosHelper();
	public BusquedaConveniosDispatchActions() {
	}

	public ActionForward cargaBusquedaConvenios (ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("BusquedaConveniosDispatchActions:cargaBusquedaConvenios inicio");
		BusquedaConveniosForm formulario = (BusquedaConveniosForm)form;
		
		formulario.cleanForm();
		log.info("BusquedaConveniosDispatchActions:cargaBusquedaConvenios fin");
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA);
	}
	
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("BusquedaConveniosDispatchActions:buscar inicio");
		BusquedaConveniosForm formulario = (BusquedaConveniosForm)form;
		
		if (Constantes.STRING_BUSCAR.equals(formulario.getAccion())) {
			formulario.setLista_convenios(helper.traeConvenios(formulario));
		}
			
		log.info("BusquedaConveniosDispatchActions:buscar fin");
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA);
	}
	
	public ActionForward selecciona_convenio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("BusquedaConveniosDispatchActions:selecciona_convenio inicio");
		BusquedaConveniosForm formulario = (BusquedaConveniosForm)form;
		
		if (Constantes.STRING_DESPLIEGA_FAMILIAS.equals(formulario.getAccion())) {
			helper.traeConveniolnFamilias(formulario);
		}
		else
		{
			String indice = request.getParameter("indice").toString();
			ConvenioBean convenio = formulario.getLista_convenios().get(Integer.parseInt(indice));
			formulario.setSel_convenio(convenio.getId());
			formulario.setSel_convenio_det(convenio.getDescripcion());
			helper.traeDescuentosConvenio(formulario, convenio.getId());
		}
		
		log.info("BusquedaConveniosDispatchActions:selecciona_convenio fin");
		return mapping.findForward(Constantes.FORWARD_SELECCION);
	}
	
	public ActionForward buscarConvenioAjax(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("BusquedaConveniosDispatchActions:buscarConvenioAjax inicio");
		BusquedaConveniosForm formulario = (BusquedaConveniosForm)form;
		String cdg = request.getParameter("convenio");
		
		formulario.setCodigo(cdg);
		formulario.setLista_convenios(helper.traeConvenios(formulario));
		ConvenioBean convenio = null;
		if (null != formulario.getLista_convenios() && formulario.getLista_convenios().size()>0) {
			convenio = formulario.getLista_convenios().get(Constantes.INT_CERO);
		}
		HashMap<String, String> hm = new HashMap<String, String>();
		if (null != convenio) {
			hm.put("descripcion", convenio.getDescripcion().replace("°", " "));
			hm.put("cdg", convenio.getId());
			hm.put("isapre", convenio.getIsapre());
		}
		
		JSONObject obj_convenio = JSONObject.fromObject(hm);
		response.setHeader("X-JSON", obj_convenio.toString());
		
		log.info("BusquedaConveniosDispatchActions:buscarConvenioAjax fin");
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA);
		
		
	}
	
	public ActionForward selecciona_convenio_cdg(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("BusquedaConveniosDispatchActions:selecciona_convenio_cdg inicio inicio");
		BusquedaConveniosForm formulario = (BusquedaConveniosForm)form;

		if (Constantes.STRING_DESPLIEGA_FAMILIAS.equals(formulario.getAccion())) {
			helper.traeConveniolnFamilias(formulario);
		}
		else
		{
			String id = request.getParameter("convenio").toString();
			formulario.setSel_convenio(id);
			helper.traeDescuentosConvenio(formulario, id);
		}

		log.info("BusquedaConveniosDispatchActions:selecciona_convenio_cdg fin");
		return mapping.findForward(Constantes.FORWARD_SELECCION);
	}
	
	
	
	
	
}
