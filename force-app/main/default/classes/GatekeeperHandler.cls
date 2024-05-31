public without sharing class GatekeeperHandler implements IGatekeeperHandler {
    private IGatekeeperValidator validator = new GatekeeperValidator();
    private ICrmServiceUsageService usageService = new CrmServiceUsageService();

    private GatekeeperUtil.GatekeeperRequest getGatekeeperReq(RestRequest req) {
        GatekeeperUtil.GatekeeperRequest gkReq = null;
        try {
            gkReq = GatekeeperUtil.getGateKeeperRequestByRestRequest(req);    
        } catch (Exception e) {
            System.debug('GatekeeperHandler.getGatekeeperReq => '+ e.getMessage());
            //throw new GatekeeperUtil.GatekeeperException(e.getMessage());
            gkReq = null;
        }
        return gkReq;
    }

    private Crm_Service_Usage__c createUsageRecord(RestRequest req, GatekeeperUtil.GatekeeperRequest gkReq) {
        Crm_Service_Usage__c result = null;
        try {
            
            Map<String,Object> props = new Map<String,Object> {
                'Status__c' => 'New',
                'Response__c' => '',
                'Requester__c' => UserInfo.getUserId(),
                'Request__c' => JSON.serialize(req),
                'Crm_Service__c' => ((gkReq != null && !String.isBlank(gkReq.serviceName)) ? gkReq.serviceName: ''),
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
        GatekeeperUtil.GatekeeperResponse response = null;
        try 
        {
            GatekeeperUtil.GatekeeperRequest gkReq = getGatekeeperReq(req);
            Crm_Service_Usage__c usageRecord = createUsageRecord(req, gkReq);
            response = validator.validateGatekeeperRequest(req);
        }
        catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());    
        }
        return response;
    }
}