import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    var enteredAmount = 0.0;
    if (amountController.text.isNotEmpty) {
      enteredAmount = double.parse(amountController.text);
    } else {
      enteredAmount = 0;
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount
    );

    Navigator.of(context).pop();
  }

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
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
              ),
              TextField(
                // onChanged: (value) => this.amountInput,
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              TextButton(
                  onPressed: submitData,
                  child: Text('Add Transaction'),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Theme.of(context).primaryColor)))
            ],
          ),
        ));
  }
}
