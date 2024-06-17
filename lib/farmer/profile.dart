import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack_o_mania/farmer/add%20_data.dart';
import 'package:hack_o_mania/starting/login.dart';
import 'package:flutter/material.dart';

import '../starting/Sign.dart';



void getdata()async{

  DocumentSnapshot who = await  FirebaseFirestore.instance.collection('User').doc(userCredential.user?.uid.toString()).get() ;
  var role = who.get('Role') ;
  var email = who.get('Username') ;
  print(email) ;

}

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    print("reached") ;
    getdata()  ;
    print("sent") ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyprofile(),
    );
  }
}
class bodyprofile extends StatefulWidget {
  const bodyprofile({super.key});
  @override
  State<bodyprofile> createState() => _bodyprofileState();
}

class _bodyprofileState extends State<bodyprofile> {

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Text("Name : " +farmer_named , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)  ,
        Text("Email : " +emaild, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) ,
          Text("Phone number : " +phoned, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) ,
          Text("Location : " +location, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) ,
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>adddata())) ;
          }, child: Text("Edit profile"))
      ]
      ),
    );
  }
}
