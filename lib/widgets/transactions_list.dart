import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: (transactions.isEmpty)
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text("No transtions added yet",
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView(
              children: transactions.map((tx) {
                return TransactionItem(
                  key: ValueKey(tx.id),
                  transaction: tx,
                  deleteTx: deleteTx,
                );
              }).toList(),
            ),
    );
  }
}
