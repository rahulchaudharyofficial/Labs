public without sharing class GatekeeperValidator implements IGatekeeperValidator {
    
    private GatekeeperUtil.RequestDTO getRequestDTO(RestRequest req) {
        GatekeeperUtil.RequestDTO request = new GatekeeperUtil.RequestDTO();
        request.headers.putAll(req.headers);
        request.params.putAll(req.params);
        request.httpMethod = req.httpMethod;
        request.remoteAddress = req.remoteAddress;
        request.requestBody = req.requestBody.toString();
        request.requestURI = req.requestURI;
        request.resourcePath = req.resourcePath;
        return request;
    }

    private GatekeeperUtil.GatekeeperValidationResponse isRequestBodyValid(RestRequest req) {
        GatekeeperUtil.GatekeeperValidationResponse result = new GatekeeperUtil.GatekeeperValidationResponse();

        GatekeeperUtil.GatekeeperRequest request =  GatekeeperUtil.getGatekeeperRequestByRestRequestOrGetNull(req);
        GatekeeperUtil.RequestDTO reqDto = getRequestDTO(req);

        reqDto.request = request;
        result.reqDTO = reqDto;
        if(request == null) //if there is no valid request than no further processing required
        {
            return result;
        }
        
        return result;
    }
    
    public GatekeeperUtil.GatekeeperValidationResponse validate(RestRequest request) {
        GatekeeperUtil.GatekeeperValidationResponse validatorResponse = new GatekeeperUtil.GatekeeperValidationResponse();
        
        return validatorResponse;       
    }
}