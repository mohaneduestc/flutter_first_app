import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    print('build transactionList');
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
          // height: MediaQuery.of(context).size.height*0.6,
          child: transactions.isEmpty
              ? Column(
                  children: [
                    Text(
                      'No Transaction',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              : ListView(
                  children: transactions
                      .map((tr) => TransactionItem(
                          key: ValueKey(tr.id),
                          transaction: tr,
                          deleteTx: deleteTx))
                      .toList()));
    });
  }
}
