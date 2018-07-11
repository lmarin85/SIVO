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
import cl.gmo.pos.venta.web.forms.ListadoBoletasForm;
import cl.gmo.pos.venta.web.helper.ListadoBoletasHelper;

public class ListadoBoletasDispatchActions extends DispatchAction {
	Logger log = Logger.getLogger( this.getClass() );
	ListadoBoletasHelper helper = new ListadoBoletasHelper();
	
	public ListadoBoletasDispatchActions() {
	}
	
	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoBoletasDispatchActions:cargaFormulario  inicio");
		log.info("ListadoBoletasDispatchActions:cargaFormulario Inicial fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_BOLETAS);
	}
	
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoBoletasDispatchActions:cargaFormulario  inicio");
		HttpSession session =request.getSession();
		String sucursal = (String)session.getAttribute(Constantes.STRING_SUCURSAL);
		ListadoBoletasForm formulario = (ListadoBoletasForm)form;
		session.setAttribute(Constantes.STRING_ACTION_FECHA_BUSQUEDA_BOLETAS, formulario.getFecha_inicio());
		helper.cargaListadoBoletas(formulario,sucursal);
		session.setAttribute(Constantes.STRING_ACTION_LISTA_BOLETAS, formulario.getListaBoletas());
		log.info("ListadoBoletasDispatchActions:cargaFormulario  fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_BOLETAS);
	}

}
