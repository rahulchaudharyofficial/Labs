public interface ICrmServiceUsageService {
    List<Crm_Service_Usage__c> createCrmServiceUsage(List<Crm_Service_Usage__c> toCreate, Boolean allOrNone);

    List<Crm_Service_Usage__c> updateCrmServiceUsage(List<Crm_Service_Usage__c> toUpdate, Boolean allOrNone);
    
    Crm_Service_Usage__c getCrmServiceUsageById(Id usageId);
}