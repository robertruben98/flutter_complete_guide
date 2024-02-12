import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/apps/store/models/transactions.dart';
import 'package:flutter_complete_guide/apps/store/widgets/transaction_list.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Old Shoes', amount: 19.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(), TransactionListWidget(_userTransactions)],
    );
  }
}
