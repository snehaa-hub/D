public class contactUser {
   public static void concreateuser(List<Contact> contacts){
        List<User> usersToInsert = new List<User>();

        
        List<Profile> profList = [SELECT Id FROM Profile WHERE Name = 'Salesforce Platform' LIMIT 1];
        if(profList.isEmpty()){
            System.debug('No profile found with name Salesforce Platform');
            return; 
        }
        Id profileId = profList[0].Id;

        for(Contact c : contacts){ 
            if(c.Email != null){ 
                User u = new User();
                u.FirstName = c.FirstName;
                u.LastName  = c.LastName;
                u.Email     = c.Email;
                u.Phone     = c.Phone;
                u.Username  = c.Email + '.' + System.currentTimeMillis(); 
                u.Alias     = c.LastName.left(5);
                u.CommunityNickname = c.FirstName + '@' + c.LastName; 
                u.ProfileId = profileId;
                u.TimeZoneSidKey = 'Asia/Kolkata';
                u.LocaleSidKey   = 'en_IN';
                u.EmailEncodingKey = 'UTF-8';
                u.LanguageLocaleKey = 'en_US';
                usersToInsert.add(u);
            }
        }

        if(!usersToInsert.isEmpty()){
            Database.insert(usersToInsert, false); 
        }
    }
}