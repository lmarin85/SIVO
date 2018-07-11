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
import cl.gmo.pos.venta.web.forms.ListadoTrabajosPendientesForm;
import cl.gmo.pos.venta.web.helper.ListadoTrabajosPendientesHelper;

public class ListadoTrabajosPendientesDispatchActions extends DispatchAction {
	
	ListadoTrabajosPendientesHelper helper = new ListadoTrabajosPendientesHelper();
	Logger log = Logger.getLogger( this.getClass() );
	public void cargaInicial(ListadoTrabajosPendientesForm formulario, HttpSession session)
	{
		log.info("ListadoTrabajosPendientesDispatchActions:cargaInicial  inicio");

		log.info("ListadoTrabajosPendientesDispatchActions:cargaInicial  fin");
		helper.cargaInicial(formulario, session);
	}
	public void Limpia(ListadoTrabajosPendientesForm formulario)
	{
		formulario.setDivisa(Constantes.STRING_CERO);
		formulario.setLocal(Constantes.STRING_CERO);
	}
	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoTrabajosPendientesDispatchActions:Limpia  inicio");
		ListadoTrabajosPendientesForm formulario = (ListadoTrabajosPendientesForm)form;
		HttpSession session = request.getSession(true);
		this.cargaInicial(formulario, session);
		this.Limpia(formulario);
		log.info("ListadoTrabajosPendientesDispatchActions:Limpia  fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_TRABAJOS_PENDIENTES);
	}
	
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoTrabajosPendientesDispatchActions:buscar  inicio");
		HttpSession session =request.getSession();
		String sucursal = (String)session.getAttribute(Constantes.STRING_SUCURSAL);
		ListadoTrabajosPendientesForm formulario = (ListadoTrabajosPendientesForm)form;
		helper.cargaListadosTrabajosPendientes(formulario, sucursal);
		this.cargaInicial(formulario, session);
		this.Limpia(formulario);
		session.setAttribute(Constantes.STRING_ACTION_LISTA_FECHA_BUSQUEDA, formulario.getFechaPedidoIni()+" - "+formulario.getFechaPedidoTer());
		session.setAttribute(Constantes.STRING_CERRADO, formulario.getCerrado());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_PENDIENTES, formulario.getListaPendientes());
		log.info("ListadoTrabajosPendientesDispatchActions:buscar  fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_TRABAJOS_PENDIENTES);
	}
}
