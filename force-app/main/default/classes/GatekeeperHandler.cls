public without sharing class GatekeeperHandler implements IGatekeeperHandler {
    private IGatekeeperValidator validator = new GatekeeperValidator();
    private ICrmServiceUsageService usageService = new CrmServiceUsageService();
    private ICrmService crmService = new CrmService();

    private Crm_Service_Usage__c createUsage(RestRequest req) {
        Crm_Service_Usage__c usageRecord = usageService.createUsageRecordByRestRequest(req);
        return usageRecord;
    }

    public GatekeeperUtil.GatekeeperResponse handle(RestRequest req) {
        GatekeeperUtil.GatekeeperResponse response = new GatekeeperUtil.GatekeeperResponse();
        GatekeeperUtil.GatekeeperValidationResponse validatorResponse = null;
        Crm_Service_Usage__c usageRecord = null;
        try 
        {
            usageRecord = createUsage(req);
            validatorResponse = validator.validate(req);
            response.request = validatorResponse.reqDTO;
            usageRecord.Status__c='Success';
            usageService.updateCrmServiceUsage(new List<Crm_Service_Usage__c> {usageRecord}, false);
        }
        catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());    
        }
        return response;
    }
}