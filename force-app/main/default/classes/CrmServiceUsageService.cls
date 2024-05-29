public without sharing class CrmServiceUsageService implements ICrmServiceUsageService {

    private ICrmServiceUsageRepository repository = new CrmServiceUsageRepository();
    private final String FAIL_CREATE_MESSAGE = 'Failed to create usage record';
    private final String FAIL_UPDATE_MESSAGE = 'Failed to update usage record'; 
    
    public List<Crm_Service_Usage__c> createCrmServiceUsage(List<Crm_Service_Usage__c> toCreate) {
        List<Crm_Service_Usage__c> toReturn = new List<Crm_Service_Usage__c>();

        if(toCreate == null || toCreate.isEmpty())
        {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }

        try {
            toReturn = repository.createCrmServiceUsage(toCreate);
        } catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(FAIL_CREATE_MESSAGE + ' -> '+ e.getMessage());
        }
        return toReturn;
    }

    public void updateCrmServiceUsage(List<Crm_Service_Usage__c> toUpdate) {
        if(toUpdate == null || toUpdate.isEmpty())
        {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        try {
            repository.updateCrmServiceUsage(toUpdate);
        } catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(FAIL_UPDATE_MESSAGE + ' -> '+ e.getMessage());
        }
    }

    public Crm_Service_Usage__c getCrmServiceUsageById(Id usageId) {
        if(usageId == null) {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        return repository.getCrmServiceUsageById(usageId);
    }
}