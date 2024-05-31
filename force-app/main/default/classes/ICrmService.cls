public interface ICrmService {
    List<Crm_Service__c> getAllInProductionActiveCrmServices();
    List<Crm_Service__c> getAllCrmServices();
    Crm_Service__c getCrmServicesByName(String serviceName);
    Crm_Service__c getCrmServicesByDeveloperName(String developerName);
    Crm_Service__c getInvalidCrmService();
    List<Crm_Service__c> createCrmService(List<Crm_Service__c> servs, Boolean allOrNone);
}