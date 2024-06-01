public without sharing class CrmService implements ICrmService {
    private ICrmServiceRepository repository = new CrmServiceRepository(Crm_Service__c.SObjectType);

    private final Crm_Service__c invalidServiceRecord { // Lazy Loading
        get {
            if(invalidServiceRecord == null) {
                return getCrmServicesByDeveloperName(GatekeeperUtil.INVALID_SERVICE_DEVELOPER_NAME);
            }
            return invalidServiceRecord;
        }
        set;
    }
    
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

    public Crm_Service__c getInvalidCrmService() {
        return this.invalidServiceRecord;
    }

    public List<Crm_Service__c> createCrmService(List<Crm_Service__c> servs, Boolean allOrNone) {
        if(servs == null || servs.isEmpty()) {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        allOrNone = (allOrNone != null? allOrNone: false);
        return repository.createCrmService(servs, allOrNone);
    }
}