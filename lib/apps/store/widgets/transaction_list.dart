import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionListWidget(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          var tx = transactions[index];
          return Card(
              child: Row(
                children: [
                  Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        '\$ ' + tx.amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tx.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ));
        },
        itemCount: transactions.length
      ),
    );
  }
}
