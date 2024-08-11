import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:union_bank/Register.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:union_bank/dashboard.dart';
import 'package:union_bank/forgotpassword.dart';
import 'package:union_bank/model/design.dart';
import "dart:io";
import 'package:union_bank/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() {
    return _MyLoginState();
  }
}

class _MyLoginState extends State<MyLogin> {

  bool isLoading =true;
  final _formkey=GlobalKey<FormState>();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final _Auth=FirebaseAuth.instance;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/union.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.cyan, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFormField(

                            style: const TextStyle(color: Colors.black,fontSize: 20),
                            autofocus: false,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return("Please enter email Filed");
                              }
                              if(!RegExp("^[a-zA-Z0-9+.-]+@[a-zA-Z0-9.]+.[a-z]").hasMatch(value)){
                                return("please enter valid email");
                              }
                              return null;
                            },
                            onSaved: (value){
                              emailController.text=value!;
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                labelText: 'Email Id',
                                hintText: "Enter Valid Email Id",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black,fontSize: 20) ,
                            autofocus: false,
                            controller: passwordController,
                            obscureText: true,
                            validator: (value){
                              RegExp regex=new RegExp(r'^.{6,}');
                              if (value!.isEmpty){
                                return("password cannot be empty");
                              } if (!regex.hasMatch(value)){
                                return ("enter valid password (min 6 charecter)");
                              }
                              return null;
                            },
                            onSaved: (value){
                              passwordController.text=value!;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                labelText: 'Password',
                                hintText: "Correct Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: ()
                                      {
                                         signIn(emailController.text,passwordController.text);
                                         showDialog(context: context, builder: (context){
                                           return Center(child: CircularProgressIndicator());
                                         });

                                      },
                                    icon: const Icon(

                                      Icons.arrow_forward,
                                    ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Forgotpassword()));
                                  },
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(

                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),

                                  )),

                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
Future<void> signIn(String email,String password)
async {
  try {
    await _Auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) =>
    {
      Fluttertoast.showToast(msg: "Login Successfully"),

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BankingDashboard())),
      //Navigator.popUntil(context, (route) => route.isFirst)
    });
  } on FirebaseAuthException catch (error) {
    switch (error.code) {
      case "invalid-email":
        errorMessage = "Invalid Email or password.";

        break;
      case "wrong-password":
        errorMessage = "Your password is wrong.";
        break;
      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "user-disabled":
        errorMessage = "User with this email has been disabled.";
        break;
      case "too-many-requests":
        errorMessage = "Too many requests";
        break;
      case "operation-not-allowed":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "Email password can not be empty";
    }
    Fluttertoast.showToast(msg: errorMessage!);
    print(error.code);
  }
}
}