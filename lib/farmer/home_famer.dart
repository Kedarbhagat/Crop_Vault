import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hack_o_mania/farmer/log.dart';
import 'package:hack_o_mania/farmer/profile.dart';
import 'package:hack_o_mania/starting/User_Decision.dart';

class home_farmer extends StatefulWidget {
  const home_farmer({super.key});

  @override
  State<home_farmer> createState() => _home_farmerState();
}

class _home_farmerState extends State<home_farmer> {
  @override

  Widget build(BuildContext context) {
    return ZoomDrawer(menuScreen: Drawer() ,mainScreen: homepage() ,borderRadius: 20,
    showShadow:   true,angle: 0,
      menuBackgroundColor: Colors.greenAccent,

    ) ;
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(

              child: Image.asset("assets/p1.png")),
    s
      ]),
    );
  }
}
class Drawer extends StatefulWidget {
  const Drawer({super.key});

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  void logout() async {
    await FirebaseAuth.instance.signOut();
    final message = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        content: const Text("Logged out"));

    ScaffoldMessenger.of(context).showSnackBar(message);
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const decisionByUser()));
  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () async{
      
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => profile())) ;
              },
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ) ,
            ListTile(
              onTap: () async{
      
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => log())) ;
              },
              leading: Icon(Icons.file_copy , color: Colors.white,),
              title: Text("Admin Folders"),
      
            ) ,
            TextButton(onPressed: (){
              logout() ;
            }, child:Text("LOGOUT" , style: TextStyle(
              color: Colors.white ,
              fontSize: 20 ,
              fontWeight: FontWeight.bold ,
            ),))
          ],
        )
      ),
    );
  }
}
