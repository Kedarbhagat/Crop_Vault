import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hack_o_mania/farmer/profile.dart';
import 'package:hack_o_mania/starting/User_Decision.dart';
import 'create_folder.dart';

class home_admin extends StatefulWidget {
  const home_admin({super.key});

  @override
  State<home_admin> createState() => _home_adminState();
}

class _home_adminState extends State<home_admin> {
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
    return Scaffold(
      body: Center(
        child:
        Column(
          children: [
            Container(
              child: Text("This is HomePage for admin" , style: TextStyle(
                fontWeight: FontWeight.bold ,
                color: Colors.black ,
                fontSize: 50  ,
              ),),
            ),
            ElevatedButton(onPressed: (){
              logout() ;
            }, child:Text("Logout"))

          ],
        ),
      ),
    );
  }
}
class Drawer extends StatefulWidget {
  const Drawer({super.key});

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    context, MaterialPageRoute(builder: (context) => folder())) ;
              },
              leading: Icon(Icons.person),
              title: Text("Create Folder"),
            ) ,
          ],
        )
    );
  }
}
