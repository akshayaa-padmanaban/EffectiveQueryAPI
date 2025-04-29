List<T> applyFilter<T>(
  List<T> customers,
  bool Function(T) predicate,
) {
  List<T> results = [];
  for (var customer in customers) {
    if (predicate(customer)) {
      results.add(customer);
    }
  }
  return results;
}



// abstract class searchQueries{
//   List<Customers> apply(List<Customers> customers);
// }

// class loanAmountQuery extends searchQueries{
//   final String operator;
//   final double value;
//   loanAmountQuery(this.operator,this.value);
//   List<Customers> apply(List<Customers> customers)
//   {
//     return customers.where((customer){
//       if (operator=='>') return customer.loanAmount>value;
//       if (operator=='<') return customer.loanAmount<value;
//       return false;
//       }).toList();
//   }
// }

// class dateQuery extends searchQueries{
//   final int days;
//   dateQuery(this.days);
//   List<Customers> apply(List<Customers> customers)
//   {
//     DateTime datetime = DateTime.now().subtract(Duration(days:days));
//     return customers.where((customer) => customer.createdOn.isAfter(datetime)).toList();
//   }
// }

// class generalQuery extends searchQueries{
//   final String query;
//   generalQuery(this.query);
//   List<Customers> apply(List<Customers> customers)
//   {
//     return customers.where((customer) => customer.leadId.contains(query)||
//     customer.appId.contains(query)||
//     customer.name.toLowerCase().contains(query.toLowerCase())||
//     customer.mobileNo.contains(query)).toList();
// }
//}