import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:union_bank/login.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
 TextEditingController ForgotpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(

      appBar: AppBar(
       automaticallyImplyLeading: false,

        title: AppBar(


          title: Text("Forgot password"),
          backgroundColor: Colors.blue,

        ),

      ),
       body: SingleChildScrollView(
         child: Container(
           child: Column(
             children:<Widget> [
               SizedBox(
                 height: 10.0,
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 110.0),
                 child: Center(
                   child: Container(
                     width: 120,
                     height: 150,
                     child: Image.asset('assets/images/union.png'),
                   ),
                 ),
               ),
               SizedBox(
                 height: 30,
               ),
               Container(
                 margin: EdgeInsets.symmetric(horizontal: 30.0),
                 child: TextFormField(
                   controller: ForgotpasswordController,
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.email),
                     labelText: 'Email Id',
                     hintText: ' Enter Email Reset Password ',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),


                   ),
                 ),
               ),
               SizedBox(
                 height: 10.0,
               ),
               ElevatedButton(
                   onPressed:() async{
                     var ForgotEmail=ForgotpasswordController.text.trim();
                     try{
                        await FirebaseAuth.instance.sendPasswordResetEmail(email:ForgotEmail)
                           .then((value) => {
                            print (ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Send Email! '),
                              ),
                            )),

                         Get.off(()=> MyLogin()),

                       });
                     }
                     on FirebaseAuthException catch(e){
                       print(ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           content: Text('Email Can not be empty '),
                         ),
                       ));
                     }
                   },
               child: Text("Reset password"),),
               SizedBox(
                 height: 70,

                 child: Text(
                   '  1.  First Step Enter Email then Reset  Password!',
                   style: TextStyle(
                     color: Colors.blueGrey,fontSize: 20,
                     decoration: TextDecoration.none,
                   ),
                 ),
               ),

               SizedBox(
                 height: 70,

                 child: Text(' 2,Step Go To Mail click on link Change your\n Password! ',
                   style: TextStyle(
                     color: Colors.blueGrey,fontSize: 20,
                     decoration: TextDecoration.none,
                   ),
                 ),
               ),


             ],
           ),
         ),
       )
    );


  }
}
