public without sharing class CrmServiceUsageService implements ICrmServiceUsageService {
    private ICrmService crmService = new CrmService();
    private ICrmServiceUsageRepository repository = new CrmServiceUsageRepository();
    
    public List<Crm_Service_Usage__c> createCrmServiceUsage(List<Crm_Service_Usage__c> toCreate, Boolean allOrNone) {
        List<Crm_Service_Usage__c> toReturn = new List<Crm_Service_Usage__c>();
        return repository.createCrmServiceUsage(toCreate, allOrNone);
    }

    public List<Crm_Service_Usage__c> updateCrmServiceUsage(List<Crm_Service_Usage__c> toUpdate, Boolean allOrNone) {
        return repository.updateCrmServiceUsage(toUpdate, allOrNone);
    }

    public Crm_Service_Usage__c getCrmServiceUsageById(Id usageId) {
        return repository.getCrmServiceUsageById(usageId);
    }

    public Crm_Service_Usage__c createCrmServiceUsage(Map<String, Object> props) {
        return repository.createCrmServiceUsage(props);
    }

    

    public Crm_Service_Usage__c createUsageRecordByRestRequest(RestRequest req) {
        GatekeeperUtil.GatekeeperRequest gkReq = null;
        Crm_Service__c crmServiceRecord = null;
        Crm_Service_Usage__c result = null;
        try {
            gkReq =GatekeeperUtil.getGatekeeperRequestByRestRequestOrGetNull(req);
            if(gkReq != null && !String.isBlank(gkReq.serviceName)) {
                try {
                    crmServiceRecord = crmService.getCrmServicesByDeveloperName(gkReq.serviceName);
                }
                catch(Exception e) {
                    System.debug('Error: Could not find service by developer name '+ gkReq.serviceName);
                    System.debug('Error: '+e.getMessage());
                    crmServiceRecord = null;
                }
            }
        }
        catch(Exception e) {
            System.debug('Error=> Could not find service by developer name '+ gkReq);
            System.debug('Error=> '+e.getMessage());
            crmServiceRecord = null;
        }

        if(crmServiceRecord == null) {
            crmServiceRecord = crmService.getInvalidCrmService();
        }
        
        try {
            
            Map<String,Object> props = new Map<String,Object> {
                'Status__c' => 'New',
                'Response__c' => '',
                'Requester__c' => UserInfo.getUserId(),
                'Request__c' => JSON.serialize(req),
                'Crm_Service__c' => crmServiceRecord.Id,
                'Comment__c' => ''
            };
            result = createCrmServiceUsage(props);
        }
        catch(Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
        return result;
    }
}