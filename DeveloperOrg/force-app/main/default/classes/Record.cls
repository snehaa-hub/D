public class Record {
    public static void Tasks(List<Case>caselist){
        for(Case cas:caselist){
  List<Task>TaskList= new List<Task>();
    Task com=new Task();
    com.Status='In progress' ;   
    com.Priority='Normal';
    com.Subject='I am Created'; 
      
}
  
    }
    public static void event(){
    //   Account acc = [select id from Account where name like 'ABC%' limit 1];
    List<case> cs = [select id from case where status ='New'];
        List<Event> event = new List<Event>();
        for(case cas: cs){
       Event ent = new Event();
        ent.StartDateTime=DateTime.Now();
        ent.EndDateTime=DateTime.Now().addDays(1);
        ent.Subject='Event1';
        ent.WhatId=cas.Id; 
            event.add(ent);
        }
       insert event;
      system.debug(event);
    }  
    
}