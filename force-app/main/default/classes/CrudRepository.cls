public without sharing class CrudRepository implements ICrudRepository {
    public List<SObject> persist(List<SObject> toSave, Boolean allOrNone) {
        if(toSave == null || toSave.isEmpty())
        {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        allOrNone = (allOrNone != null? allOrNone: false);
        try
        {
            List<Database.SaveResult> results = Database.insert(toSave, allOrNone);
            for(Database.SaveResult r: results)
            {

                if(r.isSuccess())
                {
                    System.debug('Successfully inserted record. ID: ' + r.getId());
                }
                else
                {
                    for(Database.Error err : r.getErrors()) {

                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('fields that affected this error: ' + err.getFields());
                    }
                }
            }
        }
        catch(Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
        return toSave;
    }

    public List<SObject> modify(List<SObject> toModify, Boolean allOrNone) {
        if(toModify == null || toModify.isEmpty())
        {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        allOrNone = (allOrNone != null? allOrNone: false);
        try
        {
            List<Database.SaveResult> results = Database.update(toModify, allOrNone);
            for(Database.SaveResult r: results)
            {

                if(r.isSuccess())
                {
                    System.debug('Successfully updated record. ID: ' + r.getId());
                }
                else
                {
                    for(Database.Error err : r.getErrors()) {

                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('fields that affected this error: ' + err.getFields());
                    }
                }
            }
        }
        catch(Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
        return toModify;
    }

    public void remove(List<SObject> toRemove, Boolean allOrNone) {
        if(toRemove == null || toRemove.isEmpty())
        {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        allOrNone = (allOrNone != null? allOrNone: false);
        try
        {
            List<Database.DeleteResult> results = Database.delete(toRemove, allOrNone);
            for(Database.DeleteResult r: results)
            {

                if(r.isSuccess())
                {
                    System.debug('Successfully deleted record. ID: ' + r.getId());
                }
                else
                {
                    for(Database.Error err : r.getErrors()) {

                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('fields that affected this error: ' + err.getFields());
                    }
                }
            }
        }
        catch(Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
    }

    public List<SObject> getByQuery(String query) {
        try {
            return Database.query(query);
        } catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
    }

    public List<SObject> getByIds(List<Id> ids) {
        if(ids == null || ids.isEmpty())
        {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        try {
            Schema.DescribeSObjectResult result = ids.get(0).getSobjectType().getDescribe();
            Set<String> fieldSet= result.fields.getMap().keySet();
            List<String> fieldList = new List<String>();
            fieldList.addAll(fieldSet);
            String fields = String.join(fieldList , ',');
            String query = 'SELECT '+ fields +' FROM '+result.getName()+' WHERE Id in :ids';
            return Database.query(query);
        } catch (Exception e) {
            throw new GatekeeperUtil.GatekeeperException(e.getMessage());
        }
    }

    public SObject get(Id recordId) {
        if(recordId == null)
        {
            throw new GatekeeperUtil.GatekeeperException(GatekeeperUtil.MESSAGE_ERROR_INVALID_INPUT);
        }
        Schema.DescribeSObjectResult result = recordId.getSobjectType().getDescribe();
        Set<String> fieldSet= result.fields.getMap().keySet();
        List<String> fieldList = new List<String>();
        fieldList.addAll(fieldSet);
        String fields = String.join(fieldList , ',');
        String query = 'SELECT '+ fields +' FROM '+result.getName()+' WHERE Id = :recordId';
        return Database.query(query);
    }
}