public class aggeratesoql {
    
    Public Static void aggregateFun(){
      List<AggregateResult> results = [SELECT StageName, COUNT(Id) totalOpps, SUM(Amount) totalRevenue
                                        FROM Opportunity
                                        GROUP BY StageName
                                      HAVING stageName ='Closed Won'];

          for(AggregateResult ar : results) {
              
        
            System.debug('Stage: ' + ar.get('StageName'));
            System.debug('Count: ' + ar.get('totalOpps'));
            System.debug('Revenue: ' + ar.get('totalRevenue'));
        }   
    }//SELECT AccountId, COUNT(Id) totalOpps, SUM(Amount) totalRevenue FROM Opportunity GROUP BY AccountId
   // Public static void opp
}
//SELECT Min(Amount),Max(Amount)FROM Opportunity