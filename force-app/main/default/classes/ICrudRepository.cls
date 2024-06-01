public interface ICrudRepository {
    List<SObject> persist(List<SObject> toSave, Boolean allOrNone);
    List<SObject> modify(List<SObject> toModify, Boolean allOrNone);
    void remove(List<SObject> toRemove, Boolean allOrNone);
    List<SObject> getByQuery(String query);
    List<SObject> getByIds(List<Id> ids);
    SObject get(Id id);
    SObject createByProperty(Map<String,Object> props);
}