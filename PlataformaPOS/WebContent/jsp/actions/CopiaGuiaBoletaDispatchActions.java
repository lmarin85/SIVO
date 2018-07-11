package cl.gmo.pos.venta.web.actions;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.beans.BoletaBean;
import cl.gmo.pos.venta.web.facade.PosSeleccionPagoFacade;
import cl.gmo.pos.venta.web.forms.CopiaGuiaBoletaForm;
import cl.gmo.pos.venta.web.helper.CreaCopiaGuiaBoletaHelper;

import cl.gmo.pos.venta.web.helper.SeleccionPagoHelper;

public class CopiaGuiaBoletaDispatchActions extends DispatchAction {

	Logger log = Logger.getLogger( this.getClass() );
	CreaCopiaGuiaBoletaHelper helper = new CreaCopiaGuiaBoletaHelper();
	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		
		log.info("CopiaGuiaBoletaDispatchActions:cargaFormulario inicio");
		CopiaGuiaBoletaForm formulario = (CopiaGuiaBoletaForm)form;
		formulario.setNumeroBoleta(Constantes.STRING_CERO);
		log.info("CopiaGuiaBoletaDispatchActions:cargaFormulario fin");
		return mapping.findForward(Constantes.STRING_ACTION_COPIA_GUIA_BOLETA);
	
	}
	
	public ActionForward validaDocuento(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		log.info("CopiaGuiaBoletaDispatchActions:validaDocuento inicio");
		CopiaGuiaBoletaForm formulario = (CopiaGuiaBoletaForm)form;
		String numero = request.getParameter("numeroBoleta").toString();
		String tipo = request.getParameter("tipo").toString();
		HttpSession session = request.getSession(true);
		ArrayList<BoletaBean> boleta= new ArrayList<BoletaBean>();
		String numerotipodoc="";
		
	
		formulario.setNumeroBoleta(numero);
		formulario.setDocumento(tipo);
		System.out.println("tipo doc  ==> "+tipo);
		boleta = PosSeleccionPagoFacade.reimpresionBoletaelec(tipo, numero,session.getAttribute(Constantes.STRING_SUCURSAL).toString());
		if(tipo.equals("B")){
			numerotipodoc ="39";
		}else if(tipo.equals("N")){
			numerotipodoc ="NC/61";
		}		
		System.out.println("numerotipodoc ==> "+numerotipodoc);
		for(BoletaBean b : boleta){			
			  System.out.println("Copia de guias y boletas ===>"+numerotipodoc+" "+b.getNif()+"-"+b.getDv()+" "+b.getNumero());
			  response.getWriter().print(numerotipodoc+" "+b.getNif()+"-"+b.getDv()+" "+b.getNumero());		
	    }
		log.info("CopiaGuiaBoletaDispatchActions:validaDocuento fin");
		return null;
		
		
				
	}
}
