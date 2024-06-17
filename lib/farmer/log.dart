import 'package:flutter/material.dart' ;
import 'package:hack_o_mania/farmer/Send_information.dart';
import 'package:hack_o_mania/starting/login.dart';

import 'decisionTOchat.dart';

class log extends StatefulWidget {
  const log({super.key});

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child:(pingd)?Center(child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>d())) ;
              },
                child: Text(AdminSenderd.toString()))):Text("No Assignments" , style: TextStyle(
              fontWeight: FontWeight.bold ,
              fontSize: 30
            ),)
          ),
        ),
      ),
    );
  }
}
