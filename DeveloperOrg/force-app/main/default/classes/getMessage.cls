/**
* @File Name : getMessage.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : July 1, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | July 1, 2025 |   | Initial Version
**/

public with sharing class  getMessage {
 @AuraEnabled(cacheable=true)
	public static String apexController(){
		return 'Welcome to LWC learning!';
	}
}