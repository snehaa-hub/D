public class Samplertigger {
 public static void sampleInsert( List<Account> acclist){
        for(Account acc :acclist){
            if(acc.Industry=='Banking' && acc.Type=='Prospect'){
                acc.Rating = 'Cold';
            }
        }
        
    }
    
    public static void sampleupdate( List<Account> acclist){
        for(Account acc :acclist){
            if(acc.Industry=='Education' && acc.Type!=''){
                acc.Rating = 'Hot';
            }
        }
        
    }
    
    public static void Sampledelete( List<Account> accoldlist){
        for(Account acc :accoldlist){
			system.debug('Account'+acc.CreatedDate);
            system.debug('Account'+Date.Today());            
            if(Date.valueOf(acc.CreatedDate) == Date.Today()){
                //acc.addError('Cannot delete todays records');
            }
        }
      //  public static void Sampledelete( List<Account> acclist){
       // for(Account acc :acclist){ 
    }
    
}