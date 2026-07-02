trigger sampleTriggercon on Contact (before insert,before update) 
{
    if(Trigger.isBefore && Trigger.isInsert)
    {
        triggercontact.sampleInsert(Trigger.New);
    }
}