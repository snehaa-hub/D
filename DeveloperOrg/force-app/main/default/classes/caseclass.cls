public class caseclass {
    public static void case(List<Case>caselist){
        Map<Id,Case> uniqe =new Map<Id,Case>();
        for(Case cas : caselist){
            if(cas.status=='Escalated'){
                uniqe.put(cas.Opportunity__c,cas);
            }
         }  
         List<opportunity> opplist1=new  List<opportunity>();   
        List<opportunity> oppcastlist =[Select Id FROM opportunity WHERE Id IN: uniqe.KeySet() ];
          for(opportunity opp : oppcastlist){
              if(uniqe.containsKey(opp.Id)){
                         opp.Description='My case  number: '+uniqe.get(opp.Id).CaseNumber +'is '+uniqe.get(opp.Id).status ;
              opplist1.add(opp);
              }
              
        }
        update opplist1;
    }        
            
    }