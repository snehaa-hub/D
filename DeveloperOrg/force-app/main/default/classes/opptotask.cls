public class opptotask {
    public static void myMethod(List<opportunity>oppList){
        
        List<Task> task =New List<Task>();
        
        for (opportunity opp:oppList){
            
            Task t1 = New Task();
            t1.WhatId =opp.Id;
            t1.status ='inProgress';
            t1.priority ='Hot';
            t1.Subject= 'i creted task';
            task.add(t1);
            
            system.debug('Task is created'+t1);
        }    
        if(!task.isEmpty()){
            insert task;
        }  
    }
    public static void oppurtunity(List<opportunity> opplist){
        Map<Id,opportunity> mapopportunity=new  Map<Id,opportunity>();
        for(opportunity opp :opplist){
            if(opp.Amount < 5000){
                opp.StageName='Negotiation/review';
            }
            
            if(opp.Amount > 5000 && opp.Amount < 10000){
                opp.StageName='Prospecting';
            }
            
            if(opp.Amount > 10000){
                opp.StageName='Value Proposition';
            }
        }
    }
    public static void  OLI(map<Id,opportunity> mapOPP){
        List<OpportunityLineItem> opplineitem2 = new List<OpportunityLineItem>();
        List<OpportunityLineItem> opplineitem=[SELECT Id, Discount,opportunityId	FROM OpportunityLineItem where opportunityId IN: mapOpp.keyset() ];
        for(OpportunityLineItem oppLine : opplineitem){
             system.debug('before if' + mapOPP.get(oppLine.opportunityId).Amount);
            if(mapOPP.get(oppLine.opportunityId).Amount < 5000){
                system.debug('inside if');
                oppLine.Discount =5;
            }
            else if(mapOPP.get(oppLine.opportunityId).Amount > 5000 && mapOPP.get(oppLine.opportunityId).Amount < 10000){
                oppLine.Discount=10;
            }
            else if(mapOPP.get(oppLine.opportunityId).Amount > 10000){
                oppLine.Discount =15;
            }
            opplineitem2.add(oppLine);
        }
        
        update opplineitem2;
    }
}