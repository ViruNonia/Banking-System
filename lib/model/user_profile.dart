import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:union_bank/Transaction%20History.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'design.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
      options:FirebaseOptions(
          apiKey:"AIzaSyBHBj_wdW5pGVy9EQXRF_V15X8-IEciudo",
          appId:"1:246878000514:android:bd039f68aa049f4d2d2b9b",
          messagingSenderId:"",
          projectId:"digital-diary-8d25d"
      )
  ):
  Firebase.initializeApp();
  runApp(MyApp());
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();


  void saveData(){
    String name=_nameController.text.trim();
    String email=_emailController.text.trim();
    String dob=_dobController.text.trim();
    _nameController.clear();
    _emailController.clear();
    _dobController.clear();


    if(name != ""&& email !="" && dob!="")
    {
      Map<String, dynamic>database = {
        "name": name,
        "email": email,
         "dob":dob
      };
      FirebaseFirestore.instance.collection("database").add(database);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('please all the filed the data'),
          ),
      );

    }
  }
  @override
  Widget build(BuildContext context) {

        BankingDashboard();
    return Scaffold(

      appBar: AppBar(
        title: Text('Edit Profile'),

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(labelText: 'Date_Of_Birth'),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveData();

                // Implement logic to update user profile
               // _updateProfile();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> _updateProfile() async {
    // Implement logic to update user profile
    String name = _nameController.text;
    String email = _emailController.text;
    String dob = _dobController.text;

    // Perform actions to update the user's profile
    // For example, make API requests, update local storage, etc.

    // Show a snackbar to indicate profile update success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully'),
      ),

    );
    StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("databse").
        snapshots(),
         builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData && snapshot.data != null) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic>userMap = snapshot.data!.
                    docs[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(userMap["name"]),
                      subtitle: Text(userMap["email"]),
                    );
                  },),
              );
            } else {
              Text("no data");
            }
          }
          return build(context);               
        }

    );
    // try{
    //   await _auth
    //    StreamBuilder.
    // }

  }
}
