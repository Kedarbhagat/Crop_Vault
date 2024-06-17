import 'package:flutter/material.dart';
import 'login.dart';
import 'Sign.dart';

class decisionByUser extends StatelessWidget {
  const decisionByUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.topCenter,
          child: Image.asset("assets/man.png" ,fit: BoxFit.fill,)),
      Positioned(top: 450, child: Image.asset("assets/el.png")),
      Positioned(top: 700, child: Image.asset("assets/el1.png")),
      Positioned(
        left: 70,
        top: 580,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xff2ecc71), fixedSize: Size.fromWidth(200)),
          onPressed: () {
            // Navigate to login screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text(
            'LOGIN',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      Positioned(left: 70,
        top: 500,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color(0xff2ecc71), fixedSize: Size.fromWidth(200)),
          onPressed: () {
            // Navigate to sign up screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: Text(
            'SIGN UP',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
