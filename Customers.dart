import 'Query.dart';

class Customers{
  final String leadId;
  final String appId;
  final String name;
  final String mobileNo;
  final double loanAmount;
  final DateTime createdOn;

  Customers({
    required this.leadId,
    required this.appId,
    required this.name,
    required this.mobileNo,
    required this.loanAmount,
    required this.createdOn,
  });

  factory Customers.fromMap(Map<String, dynamic> map) {
    // Utils.dart class Utils<T
    //> -> create static method for T KeyMapper(Map someMap, List<dynamic> keys , T t)
    return Customers(
      leadId: map['lcdLeadId'],
      appId: map['lcdAppId'],
      name: map['lcdcustName'],
      mobileNo: map['lcdMobNo'],
      loanAmount: double.tryParse(map['lcdLoanAmt'].toString()) ?? 0.0,
      createdOn: DateTime.parse(map['lcdcreatedon']),
  );
  }

  String toString(){
    return 'LeadId:$leadId, AppId:$appId, Name:$name, MobileNo:$mobileNo, LoanAmount:$loanAmount, CreatedOn:$createdOn';
  }

}

class CustomerFilter extends SimpleFilter<Customers> {
  @override
  List<Customers> applyFilter(
    List<Customers> customers,
    bool Function(Customers) predicate,
  ) {
    return customers.where(predicate).toList();
  }
}