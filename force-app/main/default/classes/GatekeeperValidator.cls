public without sharing class GatekeeperValidator implements IGatekeeperValidator {
    
    private GatekeeperUtil.RequestDTO getRequestDTO(RestRequest req) {
        GatekeeperUtil.RequestDTO request = new GatekeeperUtil.RequestDTO();
        request.headers.putAll(req.headers);
        request.params.putAll(req.params);
        request.httpMethod = req.httpMethod;
        request.remoteAddress = req.remoteAddress;
        request.requestBody = req.requestBody;
        request.requestURI = req.requestURI;
        request.resourcePath = req.resourcePath;
        return request;
    }

    private Boolean isRequestBodyValid(RestRequest req) {
        Boolean flag = false;
        GatekeeperUtil.RequestDTO reqDto = getRequestDTO(req);
        GatekeeperUtil.getGateKeeperRequestByRestRequest(req);
        return flag;
    }
    
    public GatekeeperUtil.GatekeeperResponse validateGatekeeperRequest(RestRequest request) {
        GatekeeperUtil.GatekeeperResponse response = new GatekeeperUtil.GatekeeperResponse();
        
        return response;       
    }
}