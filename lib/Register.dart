import 'package:flutter/material.dart';
import 'package:union_bank/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:union_bank/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _auth=FirebaseAuth.instance;
  String? errorMessage;
  final _formKey=GlobalKey<FormState>();
  //controllers
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final cpasswordController=TextEditingController();
  final phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Regi.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 30),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
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
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (value){
                              RegExp regex = RegExp(r'^.{3}$');
                              if (value!.isEmpty){
                                return("Enter Valid Name (min 3 charecter)");
                              }
                              return null;
                            },
                            onSaved: (value){
                              nameController.text=value!;
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.account_circle_outlined),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                enabledBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),

                                labelText: 'Enter name ',
                                hintText: "Name",
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),

                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black,fontSize: 20),
                            autofocus: false,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              RegExp regex =RegExp("^[a-zA-Z0-9+.-]+@[a-zA-Z0-9.]+.[a-z]");
                              if(value!.isEmpty){
                                return ("Email cannot be empty");
                              } if (!regex.hasMatch(value)){
                                return("Enter valid email");

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
                              
                                enabledBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10),

                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                labelText: 'Enter gmail',
                                hintText: "Email",
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black,fontSize: 20),
                            obscureText: true,
                            autofocus: false,
                            controller: passwordController,


                            validator: (value){
                              RegExp regex= RegExp(r'^.{6,}$');
                              if (value!.isEmpty){

                                return("Paasword Cannot be empty");
                              }if (!regex.hasMatch(value)){
                                return ("Enter Valid Password (Min atleast 6 charecter)");
                              }
                              return null;
                            },
                            onSaved: (value){
                              passwordController.text=value!;

                            },


                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password_rounded),
                                fillColor: Colors.grey.shade100,
                                filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                labelText: 'Enter Password ',
                                hintText: "Password",
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),

                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            obscureText: true,
                            style: const TextStyle(color: Colors.black,fontSize: 20),
                            autofocus: false,
                            controller: cpasswordController,

                            validator: (value){
                              RegExp regex = RegExp(r'^.{6,}$');
                              if (value!.isEmpty){
                                return("password cannot be empty");
                              }if (!regex.hasMatch(value)){
                                return("Enter valid password (min 6 charecter)");
                              } if(value!= passwordController.text){
                                return ("password didnt matche");
                              }
                              return null;
                            },
                            onSaved: (value){
                              cpasswordController.text=value!;
                            },

                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password_rounded),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                labelText: 'Enter Repeat',
                                hintText: "Repeate password",
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // TextFormField(
                          //   style: TextStyle(color: Colors.white),
                          //   autofocus: false,
                          //   controller: phoneController,
                          //   validator:(value)
                          //   {
                          //     RegExp regex= new RegExp(r'^.{0.9}$');
                          //     if (value!.isEmpty){
                          //       return("Number Cannot be empty");
                          //     }if (!regex.hasMatch(value)){
                          //       return ("Enter Valid phone (Min atleast 10 charecter)");
                          //     }
                          //     return null;
                          //   },
                          //   onSaved: (value){
                          //     phoneController.text=value!;
                          //   },
                          //   decoration: InputDecoration(
                          //       prefixIcon: Icon(Icons.phone),
                          //       enabledBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //         borderSide: BorderSide(
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //         borderSide: BorderSide(
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //       hintText: "10 Digits Phone Number",
                          //       hintStyle: TextStyle(color: Colors.white),
                          //       border: OutlineInputBorder(
                          //
                          //         borderRadius: BorderRadius.circular(10),
                          //       )),
                          // ),
                          // SizedBox(
                          //   height: 39,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: ()
                                    {
                                      signUp(emailController.text,passwordController.text);
                                      showDialog(context: context, builder: (context){
                                        return Center(child: CircularProgressIndicator());
                                      });
                                      print(emailController.text);
                                      print(passwordController.text);



                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
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
                                  Navigator.pushNamed(context, 'login');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blueAccent,
                                      fontSize: 18),
                                ),
                              ),
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
  void signUp(String email, String password ) async {
    // if (_formKey.currentState!.validate()) {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
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
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
    //}
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();


    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    
    userModel.name = nameController.text;


    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const MyLogin()),
            (route) => false);
  }

}