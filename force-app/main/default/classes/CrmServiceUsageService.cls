public without sharing class CrmServiceUsageService implements ICrmServiceUsageService {

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
}