import 'package:flutter/material.dart';
import 'package:hack_o_mania/farmer/Send_information.dart';
class d extends StatelessWidget {
  const d({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: Text("Chat")) ,
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FarmingInformationForm())) ;
            }, child: Text("Fill form")) ,
          ],
        ),
      ),
    );
  }
}
