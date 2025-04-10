public class Practice {
    public void methodDemo(){
        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 2];
        System.debug('AccList contains: - ' + accList);
    }
}