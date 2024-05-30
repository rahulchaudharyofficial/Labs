public without sharing class GatekeeperHandler implements IGatekeeperHandler {
    private IGatekeeperValidator validator = new GatekeeperValidator();
    private ICrmServiceUsageService usageService = new CrmServiceUsageService();

    private SObject createUsageRecord(RestRequest req) {
        SObject result = null;
        try {
            GatekeeperUtil.GatekeeperRequest gkReq = GatekeeperUtil.getGateKeeperRequestByRestRequest(req);
            Map<String,Object> props = new Map<String,Object> {
                'Status__c' => 'New',
                'Response__c' => '',
                'Requester__c' => UserInfo.getUserId(),
                'Request__c' => JSON.serialize(req),
                'Crm_Service__c' => gkReq.serviceName,
                'Comment__c' => ''
            };
            result = usageService.createCrmServiceUsage(props);
        }
        catch(Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
        return result;
    }

    public GatekeeperUtil.GatekeeperResponse handle(RestRequest req) {
        try 
        {
            createUsageRecord(req);
            GatekeeperUtil.GatekeeperResponse response = validator.validateGatekeeperRequest(req);
            GatekeeperUtil.GatekeeperRequest gkReq = (GatekeeperUtil.GatekeeperRequest) JSON.deserialize(req.requestBody.toString(), GatekeeperUtil.GatekeeperRequest.class);   
        }
        catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());    
        }
        return response;
    }
}