import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                  // onChanged: (value) => this.titleInput = value,
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController),
              TextField(
                // onChanged: (value) => this.amountInput,
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
              ),
              TextButton(
                  onPressed: () {
                    String title = titleController.text;
                    double amount = double.parse(amountController.text);
                    addNewTransaction(title, amount);
                    },
                  child: Text('Add Transaction'),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.purple)))
            ],
          ),
        ));
  }
}
