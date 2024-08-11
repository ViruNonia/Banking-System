// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:union_bank/login.dart';
// // import 'package:union_bank/main.dart';
// // class Dashboard extends StatefulWidget{
// //   const Dashboard({super.key});
// //
// //   @override
// //   _DashboardScreenState createState()=> _DashboardScreenState();
// //
// // }
// // class _DashboardScreenState extends State<Dashboard> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("welcome to hokjhvjhgfcghjkjhgfcghjkme "),
// //         backgroundColor:  Colors.blueAccent,
// //         actions: [
// //           PopupMenuButton(itemBuilder: (context){
// //             return[
// //               PopupMenuItem<int>(
// //                 value: 0,
// //                 child: Text("Logout"),
// //               )
// //             ];
// //           },
// //             onSelected: (value){
// //               if(value==0){
// //                 logout(context);
// //
// //
// //               }
// //
// //             },
// //             //logout(context);
// //           )
// //         ],
// //       ),
// //     );
// //   }
// //   Future<void> logout(BuildContext context) async{
// //     await FirebaseAuth.instance.signOut();
// //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyLogin()));
// //   }
// // }
// child: Stack(children: [
// Container(
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height/ 3.5,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [
// pcolor.withOpacity(0.8),
// pcolor
// ],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// ),
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(20),
// bottomRight: Radius.circular(20)
//
// ),
// ),
// ),
// Padding(padding: EdgeInsets.only(top:30),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(padding: EdgeInsets.symmetric(horizontal: 15),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// CircleAvatar(
// radius: 30,
// backgroundImage: AssetImage("set photo"),
// ),
// Icon(Icons.notification_add_outlined,
// color: wcolor,
// size: 30,
// )
// ],
// ),
//
// SizedBox(height: 15),
// Text("Life Line",
// style: TextStyle(
// color: wcolor,
// fontSize: 18,
// fontWeight: FontWeight.w500,
//
// ),
// ),
// SizedBox(height: 10,),
// Text("Your Health is our \n First Priority",
// style: TextStyle(
// color: wcolor,
// fontSize: 25,
// fontWeight: FontWeight.w500,
// ),
// ),
//
// Container(
// margin: EdgeInsets.only(top: 15,bottom: 20),
// width: MediaQuery.of(context).size.width,
// height: 55,
// alignment:Alignment.center,
// decoration: BoxDecoration(
// color: wcolor,
// borderRadius: BorderRadius.circular(10),
// boxShadow: [
// BoxShadow(
// color: sdColor,
// blurRadius: 6,
// spreadRadius: 3,
// )
// ]
// ),
// child: TextFormField(
// decoration: InputDecoration(
// border: InputBorder.none,
// hintText: "Search Doctor......",
// hintStyle: TextStyle(
// color: Colors.black.withOpacity(0.5),
// ),
// prefixIcon: Icon(
// Icons.search,
// size: 25,
// ),
// ),
// ),
// )
//
// ],
// ),
// ),
// // SizedBox(height: 15),
// // Text("Life Line",
// // style: TextStyle(
// //   color: wcolor,
// //   fontSize: 18,
// //   fontWeight: FontWeight.w500,
// //
// // ),
// // ),
// // SizedBox(height: 10,),
// // Text("Your Health is our \n First Priority",
// //   style: TextStyle(
// //     color: wcolor,
// //     fontSize: 25,
// //     fontWeight: FontWeight.w500,
// //   ),
// // // ),
// // Container(
// //   margin: EdgeInsets.only(top: 15,bottom: 20),
// //   width: MediaQuery.of(context).size.width,
// //   height: 55,
// //   alignment:Alignment.center,
// //   decoration: BoxDecoration(
// //     color: wcolor,
// //     borderRadius: BorderRadius.circular(10),
// //     boxShadow: [
// //       BoxShadow(
// //         color: sdColor,
// //         blurRadius: 6,
// //         spreadRadius: 3,
// //       )
// //     ]
// //   ),
// //   child: TextFormField(
// //     decoration: InputDecoration(
// //       border: InputBorder.none,
// //       hintText: "Search Doctor......",
// //       hintStyle: TextStyle(
// //         color: Colors.black.withOpacity(0.5),
// //       ),
// //       prefixIcon: Icon(
// //         Icons.search,
// //         size: 25,
// //       )
// //     ),
// //   ),
// // )
// ],
// ),
// ),Padding(padding: EdgeInsets.only(left: 15),
// child: Text("Categories",style:
// TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: bcolor.withOpacity(0.7),
// ),
// ),
// ),
// SizedBox(height: 15,),
// Container(
// height: 100,
// child: ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// itemCount: catNames.length,
// itemBuilder: (context,index){
// return Column(
// children: [
// Container(
// margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
// height: 60,
// width: 60,
// decoration: BoxDecoration(
// color: Color(0xFFF2F8FF),
// shape: BoxShape.circle,
// boxShadow: [
// BoxShadow(
// color: sdColor,
// blurRadius: 4,
// spreadRadius: 2,
// ),
// ],
// ),
// child: Center(
// child: catIcons[index],
// ),
// ),
// SizedBox(height: 10),
// Text(catNames[index],
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w500,
// color: bcolor.withOpacity(0.7),
// ),
// ),
// ],
// );
// },
// ),
// ),
// SizedBox(height: 30),
// Padding(padding: EdgeInsets.only(left: 15),
// child: Text(
// "Recommened Doctors",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: bcolor.withOpacity(0.7),
// ),
// ),
// ),
//
// ],),
