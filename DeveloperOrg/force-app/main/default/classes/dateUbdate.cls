public class dateUbdate {
    public static void datemethod (List<Account> accDate){//list for fetching records
        Date startDate;//its a vaiable assing to date felid
        for(Account acc : accDate){//for loop to itrate records
            startDate = acc.Date__c;// the variable we are declare to our felid so this variable turn into our felid
            if (startDate != null) {// see our felids has some value
                if(startDate < system.today()){//  system.today() this is a fuction for today date, < this is lesser than sombol
                   // here we are seeing if our date filed is less than today
                 throw new IllegalArgumentException(' Please choose a future date');
                }//throw an run time exception
                 DateTime dt = DateTime.newInstance(startDate.year(), startDate.month(), startDate.day());
                String dayAbbrev = dt.format('E');
                if (dayAbbrev == 'Sat' || dayAbbrev == 'Sun') {
                    throw new IllegalArgumentException('The selected date ' + startDate 
                                                       + ' falls on a weekend. Please choose a weekday.');
                }
                Integer daysAdded = 0;
                if(startDate == system.today()){
                while (daysAdded < 2) {
                    startDate = startDate.addDays(1);
                    DateTime dt1 = DateTime.newInstance(startDate.year(), startDate.month(), startDate.day());
                    String dayAbbrev1 = dt1.format('E');
                    if (dayAbbrev1 == 'Sat' || dayAbbrev1 == 'Sun') {
                        
                        continue;
                    }
                    System.debug('adding days' + startDate);
                    daysAdded++;
                    
                }
                acc.Date__c = startDate;
                }
            }
        }
    }
}