/**
* @File Name : helloWorldApex.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : August 14, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | August 14, 2025 |   | Initial Version
**/

public class helloWorldApex {
	@AuraEnabled
	public static List<Contact> getContact(){
		List<Contact> getContact = [Select LastName,Phone,Email from Contact];
		return getContact;
	}
}