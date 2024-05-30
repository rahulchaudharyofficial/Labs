public without sharing class GatekeeperUtil {

    public static final String MESSAGE_ERROR_INVALID_INPUT = 'Invalie input data received';

    public static final Integer STATUS_CODE_SUCCESS = 200;
    public static final Integer STATUS_CODE_ERROR = 500;

    public static final String STATUS_SUCCESS = 'SUCCESS';
    public static final String STATUS_ERROR = 'ERROR';

    public static final String MESSAGE_SERVICE_NOT_FOUND = 'No service found for name ';
    
    public class GatekeeperException extends Exception {}

    /**
     * RestRequest wrapper
    public class RequestDTO {
        public GatekeeperUtil.GatekeeperRequest request {get;set;}
        public Map<String, String> headers {get;set;}
        public Map<String, String> params {get;set;}
        public String httpMethod {get;set;}
        public String remoteAddress {get;set;}
        public String requestBody {get;set;}
        public String requestURI {get; set;}
        public String resourcePath {get;set;}
    }
    */

    public class GatekeeperRequest
    {
        // What service do you need
        public String serviceName;

        // Optional - callerId - if you have unique identification token as caller entity (i.e. SAP, AWS)
        public String callerId;

        // Request payload
        public String payload;

        // Is Async Requst
        public Boolean isAsync;
    }

    public class GatekeeperResponse
    {
        // status text
        public String status {get;set;}

        // response body
        public String response {get;set;}

        // status code
        public Integer statusCode {get;set;}

        public RestRequest request {get; set;}

        public GatekeeperResponse() {
            this.status = STATUS_SUCCESS;
            this.response = '';
            this.statusCode = STATUS_CODE_SUCCESS;
            this.request = null;
        }
    }

    public static GatekeeperRequest getGateKeeperRequestByRestRequest(RestRequest req) {
        GatekeeperUtil.GatekeeperRequest gkReq = null;
        try {
            if(req != null && req.requestBody != null) {
                gkReq = (GatekeeperUtil.GatekeeperRequest) JSON.deserialize(req.requestBody.toString(), GatekeeperUtil.GatekeeperRequest.class);
            }
            else {
                throw new GatekeeperUtil.GatekeeperException('Rest request or request body is null');
            }
        }
        catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
        return gkReq;
    }
}