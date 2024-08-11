import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:union_bank/Register.dart';
import 'package:union_bank/Transaction%20History.dart';
import 'package:union_bank/edit_profile_page.dart';
import 'package:union_bank/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:union_bank/model/user_profile.dart';

void main() {
  runApp(const BankingDashboard());
}

class BankingDashboard extends StatelessWidget {
  const BankingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Details'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.blue,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back, users',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '5,000.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Savings Account'),
            subtitle: Text('Available Balance: 3,000.00'),
          ),
          const ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Credit Card'),
            subtitle: Text('Available Balance: 2,000.00'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pay Money'),
            onTap: () {
              // Navigate to settings screen
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Transaction History'),
            onTap: () {
              // Navigate to transaction history screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
              //navigator?.pushReplacement(MaterialPageRoute(builder: (context)=>MyApp()));
            },

          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('logout'),
            onTap: () {
              logout (context);
              // Perform logout action
            },
          ),
        ],
      ),
    );
  }
  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MyLogin()));
  }

}
