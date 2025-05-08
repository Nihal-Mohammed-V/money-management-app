import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transaction/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (ctx, index) {
            final _value = newList[index];
            return Card(
              elevation: 0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      _value.type == CategoryType.income
                          ? Colors.green
                          : Colors.red,
                  child: Text(
                    parseDate(_value.date),
                    textAlign: TextAlign.center,
                  ),
                ),
                title: Text('RS ${_value.amount.toString()}'),
                subtitle: Text(_value.category.name),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(height: 10);
          },
          itemCount: newList.length,
        );
      },
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitDate = _date.split(' ');
    return '${_splitDate.last}\n${_splitDate.first}';
    // return '${date.day}\n${date.month}';
  }
}
