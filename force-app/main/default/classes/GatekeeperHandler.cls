public without sharing class GatekeeperHandler implements IGatekeeperHandler {
    private IGatekeeperValidator validator = new GatekeeperValidator();
    private ICrmServiceUsageService usageService = new CrmServiceUsageService();
    private ICrmService crmService = new CrmService();

    public GatekeeperUtil.GatekeeperResponse handle(RestRequest req) {
        GatekeeperUtil.GatekeeperResponse response = null;
        try 
        {
            Crm_Service_Usage__c usageRecord = usageService.createUsageRecordByRestRequest(req);
            response = validator.validateGatekeeperRequest(req);
        }
        catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());    
        }
        return response;
    }
}