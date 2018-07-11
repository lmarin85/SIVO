package cl.gmo.pos.venta.web.wscl;

import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.transform.Source;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.Dispatch;
import javax.xml.ws.Service;
import javax.xml.ws.soap.SOAPBinding;

public class CoreSoap12Proxy{

    protected Descriptor _descriptor;

    public class Descriptor {
        private cl.gmo.pos.venta.web.wscl.Core _service = null;
        private cl.gmo.pos.venta.web.wscl.CoreSoap _proxy = null;
        private Dispatch<Source> _dispatch = null;

        public Descriptor() {
            init();
        }

        public Descriptor(URL wsdlLocation, QName serviceName) {
            _service = new cl.gmo.pos.venta.web.wscl.Core(wsdlLocation, serviceName);
            initCommon();
        }

        public void init() {
            _service = null;
            _proxy = null;
            _dispatch = null;
            _service = new cl.gmo.pos.venta.web.wscl.Core();
            initCommon();
        }

        private void initCommon() {
            _proxy = _service.getCoreSoap12();
        }

        public cl.gmo.pos.venta.web.wscl.CoreSoap getProxy() {
            return _proxy;
        }

        public Dispatch<Source> getDispatch() {
            if (_dispatch == null ) {
                QName portQName = new QName("", "CoreSoap12");
                _dispatch = _service.createDispatch(portQName, Source.class, Service.Mode.MESSAGE);

                String proxyEndpointUrl = getEndpoint();
                BindingProvider bp = (BindingProvider) _dispatch;
                String dispatchEndpointUrl = (String) bp.getRequestContext().get(BindingProvider.ENDPOINT_ADDRESS_PROPERTY);
                if (!dispatchEndpointUrl.equals(proxyEndpointUrl))
                    bp.getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, proxyEndpointUrl);
            }
            return _dispatch;
        }

        public String getEndpoint() {
            BindingProvider bp = (BindingProvider) _proxy;
            return (String) bp.getRequestContext().get(BindingProvider.ENDPOINT_ADDRESS_PROPERTY);
        }

        public void setEndpoint(String endpointUrl) {
            BindingProvider bp = (BindingProvider) _proxy;
            bp.getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, endpointUrl);

            if (_dispatch != null ) {
                bp = (BindingProvider) _dispatch;
                bp.getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, endpointUrl);
            }
        }

        public void setMTOMEnabled(boolean enable) {
            SOAPBinding binding = (SOAPBinding) ((BindingProvider) _proxy).getBinding();
            binding.setMTOMEnabled(enable);
        }
    }

    public CoreSoap12Proxy() {
        _descriptor = new Descriptor();
        _descriptor.setMTOMEnabled(false);
    }

    public CoreSoap12Proxy(URL wsdlLocation, QName serviceName) {
        _descriptor = new Descriptor(wsdlLocation, serviceName);
        _descriptor.setMTOMEnabled(false);
    }

    public Descriptor _getDescriptor() {
        return _descriptor;
    }

    public String convertDocument(String area, String password, String documentType, String documentContent) {
        return _getDescriptor().getProxy().convertDocument(area,password,documentType,documentContent);
    }

    public String convertSignDocument(String area, String password, String documentType, String documentContent) {
        return _getDescriptor().getProxy().convertSignDocument(area,password,documentType,documentContent);
    }

    public String addCAF(String area, String password, String caf, String fileName) {
        return _getDescriptor().getProxy().addCAF(area,password,caf,fileName);
    }

    public String removeCAF(String area, String password, String fileName) {
        return _getDescriptor().getProxy().removeCAF(area,password,fileName);
    }

    public String archiveCAF(String area, String password, String fileName) {
        return _getDescriptor().getProxy().archiveCAF(area,password,fileName);
    }

}