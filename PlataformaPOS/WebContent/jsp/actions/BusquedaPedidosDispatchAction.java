package cl.gmo.pos.venta.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import sun.management.resources.agent;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.beans.AgenteBean;
import cl.gmo.pos.venta.web.forms.BusquedaPedidosForm;
import cl.gmo.pos.venta.web.forms.VentaPedidoForm;
import cl.gmo.pos.venta.web.helper.BusquedaPedidosHelper;

public class BusquedaPedidosDispatchAction extends DispatchAction {
	
	BusquedaPedidosHelper helper = new BusquedaPedidosHelper();
	Logger log = Logger.getLogger(this.getClass());

	public BusquedaPedidosDispatchAction() {
	}
	
	private void carga_inicial(BusquedaPedidosForm formulario, HttpSession session)
	{
		String local = session.getAttribute(Constantes.STRING_SUCURSAL).toString();
		formulario.setLista_agentes(helper.traeAgentes_Local(local));
	}
	
	public ActionForward carga_formulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
		log.info("BusquedaPedidosDispatchAction:carga_formulario inicio");
		BusquedaPedidosForm  formulario = (BusquedaPedidosForm)form;
		HttpSession session = request.getSession(true);
		this.carga_inicial(formulario, session);
		String flujo = request.getParameter("flujo");
		if (!flujo.equals("nuevo")) {
			ArrayList<AgenteBean> agentes = new ArrayList<AgenteBean>();
			AgenteBean agent = new AgenteBean();
			agent.setUsuario(session.getAttribute(Constantes.STRING_USUARIO).toString());
			agent.setNombre_completo(session.getAttribute(Constantes.STRING_USUARIO).toString());
			agentes.add(agent);
			formulario.setLista_agentes(agentes);
		}
		session.setAttribute(Constantes.STRING_LISTA_PRODUCTOS_ESTADO, Constantes.STRING_BLANCO);
		log.info("BusquedaPedidosDispatchAction:carga_formulario fin");
		return mapping.findForward(Constantes.STRING_ACTION_BUSQUEDA_PEDIDO); 
	}
	
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
				
		log.info("BusquedaPedidosDispatchAction:buscar inicio");
		BusquedaPedidosForm  formulario = (BusquedaPedidosForm)form;
		HttpSession session = request.getSession(true);
		
		this.carga_inicial(formulario, session);
		String local = session.getAttribute(Constantes.STRING_SUCURSAL).toString();
		helper.traePedidos(formulario, local, session);
		log.info("BusquedaPedidosDispatchAction:buscar  fin");
		return mapping.findForward(Constantes.STRING_ACTION_BUSQUEDA_PEDIDO); 
	}

}
