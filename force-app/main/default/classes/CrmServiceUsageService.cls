public without sharing class CrmServiceUsageService implements ICrmServiceUsageService {

    private ICrmServiceUsageRepository repository = new CrmServiceUsageRepository();

    private final String FAIL_CREATE_MESSAGE = 'Failed to create usage record';
    private final String FAIL_UPDATE_MESSAGE = 'Failed to update usage record'; 
    
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
}