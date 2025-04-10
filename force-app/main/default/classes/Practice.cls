/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-10-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Practice {
    public void methodDemo(){
        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5];
        System.debug('AccList contains: - ' + accList);
    }
}