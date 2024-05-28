public interface ICrmServiceRepository {
    List<Crm_Service__c> getAllInProductionActiveCrmServices();
    List<Crm_Service__c> getAllCrmServices();
    Crm_Service__c getCrmServicesByName(String serviceName);
}