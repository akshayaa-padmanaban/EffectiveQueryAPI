class CustomerData{
  int? id;
  String? customerName;
  String? urnNo;
  List<LoanDetail>? loanDetails;
  
}

class LoanDetail{
  String? loanAccountNo;
  String? loanAmount;
  String? productCode;
  bool? isDefaulter;
}