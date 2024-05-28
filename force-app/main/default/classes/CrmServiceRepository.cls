public without sharing class CrmServiceRepository implements ICrmServiceRepository {
    private List<String> crmServiceFields = new List<String> {
        	'Id',
            'Name',
            'Description__c',
            'Is_Active__c',
            'Request__c',
            'Request_Model__c',
            'Response__c',
            'Service_Handler__c',
            'Stage__c',
            'Usage__c'
    };
    public List<Crm_Service__c> getAllInProductionActiveCrmServices() 
    {
        return [SELECT Id, Name, Description__c, Is_Active__c,Request__c, Request_Model__c,Response__c, Service_Handler__c,Stage__c,Usage__c from Crm_Service__c where Is_Active__c=true and Stage__c='In Prod'];
    }

    public List<Crm_Service__c> getAllCrmServices() {
        return [SELECT Id, Name, Description__c, Is_Active__c,Request__c, Request_Model__c,Response__c, Service_Handler__c,Stage__c,Usage__c from Crm_Service__c];
    }

    public Crm_Service__c getCrmServicesByName(String serviceName) {
        return [SELECT Id, Name, Description__c, Is_Active__c,Request__c, Request_Model__c,Response__c, Service_Handler__c,Stage__c,Usage__c from Crm_Service__c WHERE Name = :serviceName];
    }
}