public class TriggerContact {
    public static void sampleInsert(List<Contact> conList) {
        for (Contact con : conList) {
            system.debug('contact'+con.Phone);
            system.debug('contact'+con.Phone.length());
            if (con.Phone != null && con.Phone.length() != 10){
                    con.addError('Phone number must be exactly 10 digits.');
                }
            }
        }
                }