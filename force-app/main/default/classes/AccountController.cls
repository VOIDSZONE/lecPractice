public with sharing class AccountController {
    //Cacheable true when using wire but not required when using dml in imperative way
    @AuraEnabled(cacheable=true)
    public static List<Account> getHighestRevenue(Integer count){
        try {
            return [
                SELECT Id, Name, AnnualRevenue
                FROM Account
                ORDER BY AnnualRevenue DESC NULLS LAST
                LIMIT :count
                ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void createAccount(String name, String phone, String industry){
        try {
            Account acc = new Account(
                Name = name,
                Phone = phone,
                Industry = industry
            );
            insert acc;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}