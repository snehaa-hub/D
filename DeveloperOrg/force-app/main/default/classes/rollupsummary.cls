public class rollupsummary {
    public static void rollup(List<Contact> conList) {
        Set<Id> accIds = new Set<Id>();
        for (Contact con : conList) {
            if (con.AccountId != null) {
                accIds.add(con.AccountId);
            }
        }
        if (accIds.isEmpty()) return;
        
        // Aggregate Contact counts per Account
        Map<Id, Integer> counts = new Map<Id, Integer>();
        for (AggregateResult ar : [
            SELECT AccountId, COUNT(Id) cmt 
            FROM Contact 
            WHERE AccountId IN : accIds 
            GROUP BY AccountId
        ]) {
            counts.put((Id) ar.get('AccountId'), (Integer) ar.get('cmt'));
        }

        // Prepare Account updates
        List<Account> updates = new List<Account>();
        for (Id aid : accIds) {
            updates.add(new Account(
                Id = aid,
                NumberofLocations__c = counts.containsKey(aid) ? counts.get(aid) : 0
            ));
        }

        update updates;
    }
}