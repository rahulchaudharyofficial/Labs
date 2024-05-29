public interface ICrmServiceUsageService {
    List<Crm_Service_Usage__c> createCrmServiceUsage(List<Crm_Service_Usage__c> toCreate);
    void updateCrmServiceUsage(List<Crm_Service_Usage__c> toUpdate);
    Crm_Service_Usage__c getCrmServiceUsageById(Id usageId);
}