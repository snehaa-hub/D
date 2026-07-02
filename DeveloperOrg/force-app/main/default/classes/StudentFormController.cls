public with sharing class StudentFormController {
    @AuraEnabled
    public static void saveStudent(String name, Integer age, String phone) {
        userProtals__c s = new userProtals__c();
        s.Name = name;
        s.Age__c = age;
        s.Phone_Number__c = phone;
        insert s;
    }
}