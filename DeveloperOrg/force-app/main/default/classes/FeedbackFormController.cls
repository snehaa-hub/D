public class FeedbackFormController {

    @AuraEnabled
    public static Boolean isValidRegistration(Id regId) {
        if (String.isBlank(regId)) return false;

        Registration__c reg = [
            SELECT Status__c FROM Registration__c 
            WHERE Id = :regId LIMIT 1
        ];
        return reg.Status__c == 'Attended';
    }

    @AuraEnabled
   public static void submitFeedback(Id regId, string rating, String comment) {
    insert new Feedback__c(
        Registration__c = regId,
        Rating__c = rating,
        Comments__c = comment 
        );
    }

    @AuraEnabled(cacheable=true)
    public static List<Registration__c> getRegistrations() {
        return [
            SELECT Id, Name 
            FROM Registration__c 
            WHERE Status__c = 'Attended' 
            ORDER BY CreatedDate DESC
        ];
    }

}