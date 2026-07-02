public class example {
    @Future
    public static void oppmethod(){
   List< opportunity> opplist=[SELECT Id,Name,CloseDate,StageName FROM OPPORTUNITY WHERE stageName='Closed Won'];
    for( opportunity opp :opplist){

        opp.CloseDate=system.today();
    }
                system.debug(opplist.size());
}
}