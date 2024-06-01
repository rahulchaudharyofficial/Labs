public interface ICrmServiceUsageService {
    List<Crm_Service_Usage__c> createCrmServiceUsage(List<Crm_Service_Usage__c> toCreate, Boolean allOrNone);

    List<Crm_Service_Usage__c> updateCrmServiceUsage(List<Crm_Service_Usage__c> toUpdate, Boolean allOrNone);
    
    Crm_Service_Usage__c getCrmServiceUsageById(Id usageId);
    
    Crm_Service_Usage__c createCrmServiceUsage(Map<String, Object> props);

    Crm_Service_Usage__c createUsageRecordByRestRequest(RestRequest req);
}