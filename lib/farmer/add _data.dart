import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_o_mania/starting/Sign.dart';
import 'package:hack_o_mania/starting/login.dart';
TextEditingController name = TextEditingController() ;
TextEditingController phonenumber = TextEditingController() ;
TextEditingController location1 = TextEditingController() ;

class adddata extends StatelessWidget {
  const adddata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(

              controller: name,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Enter Name',
              ),
            ),
            TextFormField(

              controller: phonenumber,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Enter Phone number',
              ),
            ),  TextFormField(

              controller: location1,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Enter location',
              ),
            ),
            TextButton(onPressed: ()async{
              await FirebaseFirestore.instance.collection('User').doc(document.toString()).update(
                  {
                    'Name':name.text  ,
                    'Phone':phonenumber.text  ,
                    'Location':location1.text,
                  }) ;

            }, child: Text("Enter")) ,
           Text("log in again to make changes")  ,
          ],
        ),
      ),
    );
  }
}
