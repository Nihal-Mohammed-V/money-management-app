import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

const TRANSACTION_DN_NAME = 'transaction-db';

abstract class TransactionDbFunctions {
  Future<void> addTransaction(TransactionModel obj);
}

class TransactionDB implements TransactionDbFunctions {
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB() {
    return instance;
  }

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DN_NAME);
    await _db.put(obj.id, obj);
    {}
  }
}
