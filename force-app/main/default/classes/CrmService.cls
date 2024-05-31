public without sharing class CrmService implements ICrmService {
    private ICrmServiceRepository repository = new CrmServiceRepository(Crm_Service__c.SObjectType);

    public List<Crm_Service__c> getAllInProductionActiveCrmServices() {
        return repository.getAllInProductionActiveCrmServices();
    }

    public List<Crm_Service__c> getAllCrmServices() {
        return repository.getAllCrmServices();
    }

    public Crm_Service__c getCrmServicesByName(String serviceName) {
        if(String.isBlank(serviceName)) {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        return repository.getCrmServicesByName(serviceName);
    }
    
    public Crm_Service__c getCrmServicesByDeveloperName(String developerName) {
        if(String.isBlank(developerName)) {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        return repository.getCrmServicesByDeveloperName(developerName);
    }
}