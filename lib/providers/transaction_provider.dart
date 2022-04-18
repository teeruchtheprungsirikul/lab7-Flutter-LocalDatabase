import 'package:flutter/foundation.dart';
import 'package:flutter_localdatabase/database/transaction_db.dart';
import 'package:flutter_localdatabase/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    //transactions.add(statement);
    //transactions.insert(0, statement);
    var db = TransactionDB(dbName: "transactions.db");
    await db.insertData(statement);
    transactions = await db.loadAllData();

    //แจ้งเตือนConsumer
    notifyListeners();
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");

    transactions = await db.loadAllData();
    notifyListeners();
  }
}