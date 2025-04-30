// my first assignment
import 'dart:io';

import 'AppData.dart';
import 'Customers.dart';
void main()
{
  List<Customers> customers = mobCustData.map((e) => Customers.fromMap(e)).toList();
  
  stdout.write('Enter the Query:');
  String? input = stdin.readLineSync()?.trim().toLowerCase();
  
  if (input == null || input.isEmpty)
  {
    print('Exit');
    return;
  }
  
  final filter = CustomerFilter();
  List<Customers> filtered = [];
  
  if (input.startsWith('>') || input.startsWith('<')) 
  {
    double? amount = double.tryParse(input.substring(1).trim());
    if (amount == null) 
    {
      print('Invalid');
      return;
    }
    
    filtered = filter.applyFilter(customers, (c) 
    {
      if (input.startsWith('>')) return c.loanAmount > amount;
      if (input.startsWith('<')) return c.loanAmount < amount;
      return false;
    });
    } 
    else if (input.contains('last week') || input.contains('last month') || input.contains('last quarter')) 
    {
      int days = 0;
      if (input.contains('last week')) days = 7;
      else if (input.contains('last month')) days = 30;
      else if (input.contains('last quarter')) days = 90;
      
      DateTime cutoff = DateTime.now().subtract(Duration(days: days));
      filtered = filter.applyFilter(customers, (c) => c.createdOn.isAfter(cutoff));
      } 
      else 
      {
        filtered = filter.applyFilter(customers, (c) => c.name.toLowerCase().contains(input) || 
        c.mobileNo.contains(input) || 
        c.appId.contains(input) || 
        c.leadId.contains(input));
      }
      if (filtered.isEmpty) 
      {
        print('Invalid');
      } 
      else 
      {
        for (var customer in filtered) 
        {
          print(customer);
        }
  }
}

  //   searchQueries? query;

  //   if(input.startsWith('>')||input.startsWith('<'))
  //   {
  //     String operator=input[0];
  //     double value = double.tryParse(input.substring(1).trim())??0;
  //     query = loanAmountQuery(operator, value);
  //   }
  //   else if(input.toLowerCase()=='last week')
  //   {
  //     query=dateQuery(7);
  //   }
  //   else if(input.toLowerCase()=='last month')
  //   {
  //     query=dateQuery(30);
  //   }
  //   else if(input.toLowerCase()=='last quarter')
  //   {
  //     query=dateQuery(90);
  //   }
  //   else
  //   {
  //     query=generalQuery(input);
  //   }

  //   List<Customers> results = query.apply(customers);
  //   if(results.isEmpty){
  //     print('No match found');
  //   }
  //   else
  //   {
  //     for(var customer in results)
  //     {
  //       print(customer);
  //     }
  //   }

  // }

//---------------------------------------------------------------------------------

//     print('Enter a search value:');
//     String? input = stdin.readLineSync();

//     if (input == null || input.isEmpty)
//     {
//         print('Exit');
//         return;
//     }
//     if(input.startsWith('>')||input.startsWith('<'))
//     {
//       String condition=input[0];
//       double loanAmount = double.tryParse(input.substring(1).trim())??0;
//       if(loanAmount==0)
//       {
//         print('Invalid');
//         return;
//       }
//       List<Map<String, dynamic>> match = filterBySearchQuery(condition, loanAmount);
//       if(match.isEmpty)
//       {
//         print("Invalid");
//         return;
//       }
//       else
//       {
//        print(match);
//       }
//     }

//     if(input == 'last week' || input == 'last month' || input == 'last quarter')
//     {
//       List<Map<String, dynamic>> match = filterByDate(input);
//       print(match);
//       return;
//     }

//     else
//     {
//        bool isfound = false;
//       for (var data in mobCustData)
//       {
//         for (var value in data.values)
//         {
//             if(value.toString().toLowerCase().contains(input.toLowerCase()))

//             {
//                 print(data);
//                 isfound = true;
//                 return;
//             }
//         }
//         if (isfound) 
//         return;
//       }
//       if(!isfound)
//       {
//         return;
//       }
//     }
// }
    
// List<Map<String, dynamic>> filterBySearchQuery(condition, double loanAmount) {
//   List<Map<String,dynamic>> match = mobCustData.where((data)
//   {
//     double loanAmt = double.tryParse(data['lcdLoanAmt'].toString())??0;
//     if(condition.contains('greater than')&&loanAmt>loanAmount)
//     {
//       return true;
//     }
//     else if(condition.contains('less than')&&loanAmt<loanAmount)
//     {
//       return true;
//     }
//     if(condition == '>' && loanAmt>loanAmount) return true;
//     else if(condition == '<' && loanAmt<loanAmount) return true;
//     return false;
//   }).toList();
//   return match;
// }

// List<Map<String, dynamic>> filterByDate(String dates) {
//   DateTime now = DateTime.now();
//   Duration range;
//   switch(dates)
//   {
//     case 'last week':
//     range = Duration(days:7);
//     break;

//     case 'last month':
//     range = Duration(days:30);
//     break;

//     case 'last quarter':
//     range = Duration(days:90);
//     break;

//     default:
//     return[];
//   }

//   DateTime fromDate = now.subtract(range);

//   return mobCustData.where((data) 
//   {
//     String create = data['lcdcreatedon'].toString();
//     DateTime? date = DateTime.tryParse(create);
//     return date != null && date.isAfter(fromDate);
//   }).toList();

//}