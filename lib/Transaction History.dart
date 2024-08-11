import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AccountPage(),

    );

  }
}

class AccountPage extends StatelessWidget {
  final List<Account> accounts = [
    Account(name: 'Savings Account', balance: 3000.00),
    Account(name: 'Credit Card', balance: -500.00),
  ];

  final List<Transaction> transactions = [
    Transaction(
        date: DateTime.now().subtract(Duration(days: 5)),
        description: 'Payment received',
        amount: 1000.00),
    Transaction(
        date: DateTime.now().subtract(Duration(days: 3)),
        description: 'Grocery shopping',
        amount: -200.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Accounts & Transactions'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Accounts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(accounts[index].name),
                  subtitle: Text('Balance: \$${accounts[index].balance}'),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Transaction History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(transactions[index].description),
                  subtitle: Text(
                      '${transactions[index].date.toString().substring(0, 10)}'),
                  trailing: Text('\$${transactions[index].amount}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Account {
  final String name;
  final double balance;

  Account({required this.name, required this.balance});
}

class Transaction {
  final DateTime date;
  final String description;
  final double amount;

  Transaction({
    required this.date,
    required this.description,
    required this.amount,
  });
}
