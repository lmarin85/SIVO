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
import cl.gmo.pos.venta.web.forms.UsuarioForm;
import cl.gmo.pos.venta.web.helper.LoginHelper;


public class LoginActions extends DispatchAction{

	LoginHelper loginHelper = new LoginHelper();
	HttpSession session;
	Logger log = Logger.getLogger( this.getClass() );
	public LoginActions() {
	}
	public ActionForward cargaLogin(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
		log.info("LoginActions:cargaLogin  inicio");

		log.info("LoginActions:cargaLogin  fin");
		return mapping.findForward(Constantes.FORWARD_CARGA);

	}
	public ActionForward validaLogin(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		log.info("LoginActions:validaLogin  inicio");
		UsuarioForm usuario = (UsuarioForm)form;
		String caso=Constantes.STRING_FALLA;
		if(request.getSession(false)==null || !request.getSession(false).isNew()){
			this.session = request.getSession(false);
		}else{
			System.out.println("Session valida");
			this.session = request.getSession(true);
		} 
		
		int validaEstadoUsuario = loginHelper.validaUsuario(usuario);

		if((validaEstadoUsuario)==1){
			session.setAttribute(Constantes.STRING_ERROR, Constantes.STRING_FALLA);
			caso=Constantes.STRING_FALLA;
		}
		if((validaEstadoUsuario)==2){
			session.setAttribute(Constantes.STRING_DESC_USUARIO, usuario.getDescNombreUsuario().toUpperCase());
			session.setAttribute(Constantes.STRING_USUARIO, usuario.getNombreUsuario().toUpperCase());
			session.removeAttribute(Constantes.STRING_ERROR);
			session.setMaxInactiveInterval(3600);
			caso=Constantes.STRING_SELECT_SUCURSAL;
		}
		if((validaEstadoUsuario)==3){
			session.setAttribute(Constantes.STRING_DESC_USUARIO, usuario.getDescNombreUsuario().toUpperCase());
			session.setAttribute(Constantes.STRING_USUARIO, usuario.getNombreUsuario().toUpperCase());
			session.removeAttribute(Constantes.STRING_ERROR);
			session.setMaxInactiveInterval(3600);
			caso=Constantes.STRING_SELECT_SUCURSAL;
		}
		log.info("LoginActions:validaLogin  fin");
		return mapping.findForward(caso);
	}
}
