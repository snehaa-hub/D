public class bankamount {
            
    private decimal balance =0;
    
    public void deposit(decimal amount){
        if(amount> 0)balance += amount;
    }
    public decimal getbalance(){
        return balance;
    }
}