public without sharing class CrmServiceUsageRepository implements ICrmServiceUsageRepository {
    public List<Crm_Service_Usage__c> createCrmServiceUsage(List<Crm_Service_Usage__c> toCreate) {
        if(toCreate != null && !toCreate.isEmpty())
        {
            insert toCreate;
        }
        return toCreate;
    }

    public void updateCrmServiceUsage(List<Crm_Service_Usage__c> toUpdate) {
        if(toUpdate != null && !toUpdate.isEmpty())
        {
            update toUpdate;
        }
    }

    public Crm_Service_Usage__c getCrmServiceUsageById(Id usageId) {
        return [SELECT Id, Name, Comment__c, Crm_Service__c, Is_Archieved__c,Request__c, Requester__c, Response__c, Status__c FROM Crm_Service_Usage__c WHERE Id = :usageId];
    }
}