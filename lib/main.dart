import 'package:flutter/material.dart';
import 'package:union_bank/Register.dart';
import 'package:union_bank/dashboard.dart';
import 'package:union_bank/login.dart';
import 'package:union_bank/Register.dart';
import 'package:union_bank/model/design.dart';
import 'Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   Platform.isAndroid?
   await Firebase.initializeApp(
  options:const FirebaseOptions(
  apiKey:"AIzaSyBHBj_wdW5pGVy9EQXRF_V15X8-IEciudo",
 appId:"1:246878000514:android:bd039f68aa049f4d2d2b9b",
   messagingSenderId:"",
  projectId:"digital-diary-8d25d"

)
):
Firebase.initializeApp();
runApp(const MyLogin());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  (FirebaseAuth.instance.currentUser!=null)? BankingDashboard():
    const MyLogin (),

    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
    },
  ));
}