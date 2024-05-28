public interface ICrmServiceRepository {
    List<Crm_Service__c> getAllCrmServices(Boolean activeOnly);
    Crm_Service__c getCrmServicesByName(String serviceName);
}