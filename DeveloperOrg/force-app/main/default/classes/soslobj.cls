public class soslobj {
    public static void find(){
       List<List<Account>> acc= [FIND 'Demo*' IN ALL FIELDS RETURNING
                           Account(Id, Name, Rating, Industry, AnnualRevenue, Active__C Limit 15)];
    }
}