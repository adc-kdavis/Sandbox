public class KilianTestController {

    @RemoteAction
    public static Account getAccount(String acctName) {
        Account a = [SELECT Id, Name FROM Account WHERE Name = :acctName LIMIT 1];
        return a;
    }
}