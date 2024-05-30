public without sharing class CrmServiceUsageRepository implements ICrmServiceUsageRepository {
    private ICrudRepository repository;

    public CrmServiceUsageRepository() {
        this.repository = new CrudRepository(Crm_Service_Usage__c.SObjectType);
    }

    public List<Crm_Service_Usage__c> createCrmServiceUsage(List<Crm_Service_Usage__c> toCreate, Boolean allOrNone) {
        return repository.persist(toCreate, allOrNone);
    }

    public List<Crm_Service_Usage__c> updateCrmServiceUsage(List<Crm_Service_Usage__c> toUpdate, Boolean allOrNone) {
       return repository.modify(toUpdate, allOrNone);
    }
    

    public Crm_Service_Usage__c getCrmServiceUsageById(Id usageId) {
        return (Crm_Service_Usage__c) repository.get(usageId);
    }
}