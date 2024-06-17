import 'dart:async';
import 'dart:ui';
import 'User_Decision.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_o_mania/starting/Sign.dart';
bool isEmailVerified = false ;
class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {

  Timer?timer ;
  @override
  void initState() {
    isEmailVerified  = FirebaseAuth.instance.currentUser!.emailVerified ;
    if(!isEmailVerified)
    {
      sendVerficationMail() ;
      timer =  Timer.periodic(Duration(seconds: 3), (_)=>checkemailVerified()) ;
    }
    // TODO: implement initState
    super.initState();
  }
  Future sendVerficationMail()async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final message = SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(message);
    }
  }
  Future checkemailVerified()async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified =FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isEmailVerified)
      {
        timer?.cancel() ;
       
        print("Email is verified") ;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: veri() ,
    ) ; 
  }
}

class veri extends StatefulWidget {
  const veri({super.key});

  @override
  State<veri> createState() => _veriState();
}

class _veriState extends State<veri> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: (isEmailVerified)?
        Column(
            children:
            [
              Text("Email is Verified" , style: TextStyle(
                fontSize: 50 ,
                fontWeight: FontWeight.bold ,
              ),) ,
              
              ElevatedButton(onPressed: (){Navigator.pop(context) ; }, child: Icon(Icons.arrow_back))
            ]
        ):
        Text("Please verify email"  , style: TextStyle(
          fontWeight: FontWeight.bold ,
          fontSize: 50 ,
        ))
      ),
    );
  }
}
