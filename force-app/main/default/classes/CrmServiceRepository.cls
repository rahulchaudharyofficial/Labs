public without sharing class CrmServiceRepository implements ICrmServiceRepository {
    private ICrudRepository repository;

    public CrmServiceRepository() {
        this.repository = new CrudRepository(Crm_Service__c.SObjectType);
    }

    public CrmServiceRepository(Schema.SObjectType sObjTyp) {
        this.repository = new CrudRepository(sObjTyp);
    }

    public List<Crm_Service__c> getAllInProductionActiveCrmServices() 
    {
        return [SELECT Id, Name,Developer_Name__c, Description__c, Is_Active__c,Request__c, Request_Model__c,Response__c, Service_Handler__c,Stage__c,Usage__c from Crm_Service__c where Is_Active__c=true and Stage__c='In Prod'];
    }

    public List<Crm_Service__c> getAllCrmServices() {
        return [SELECT Id, Name,Developer_Name__c, Description__c, Is_Active__c,Request__c, Request_Model__c,Response__c, Service_Handler__c,Stage__c,Usage__c from Crm_Service__c];
    }

    public Crm_Service__c getCrmServicesByName(String serviceName) {
        return [SELECT Id, Name, Developer_Name__c, Description__c, Is_Active__c,Request__c, Request_Model__c,Response__c, Service_Handler__c,Stage__c,Usage__c from Crm_Service__c WHERE Name = :serviceName];
    }

    public Crm_Service__c getCrmServicesByDeveloperName(String developerName) {
        return [SELECT Id, Name, Developer_Name__c, Description__c, Is_Active__c,Request__c, Request_Model__c,Response__c, Service_Handler__c,Stage__c,Usage__c from Crm_Service__c WHERE Developer_Name__c = :developerName];
    }

    public List<Crm_Service__c> createCrmService(List<Crm_Service__c> servs, Boolean allOrNone) {
        return (Crm_Service__c) repository.persist(servs, allOrNone);
    }
}