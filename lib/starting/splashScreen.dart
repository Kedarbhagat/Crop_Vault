import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_o_mania/farmer/home_famer.dart';
import '../admin/home_admin.dart';
import 'User_Decision.dart';
import 'login.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), () {
      if(FirebaseAuth.instance.currentUser!=null)
      { print(roll) ;
        Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => (roll.toString()=='Admin')?home_admin():home_admin())) ;}
      else{
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => decisionByUser()));
      }  ;
    }) ;
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6fff7),
      body: Stack(

        children: [
          Positioned(
            top: 319,
              left: 230,
              child: Image.asset("assets/l.png")),
          Image.asset("assets/1.png"),
          Positioned(
            top: 430,
              child: Image.asset("assets/2.png")),
          Center(
          child: Container(
            child: Text("CropVault" , style: TextStyle(
              fontSize: 40 ,
              color: Colors.black  ,
              fontWeight: FontWeight.bold ,
            ),),
          ),
        ),
      ]),
    );
  }
}
