import 'package:cloud_firestore/cloud_firestore.dart';

import 'verifyEmail.dart';
import 'verifyEmail.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List options = ['Admin', 'Farmer'];
TextEditingController emailtext = TextEditingController();
TextEditingController passwordText = TextEditingController();
late UserCredential userCredential;
final firestore = FirebaseFirestore.instance;
CollectionReference users = FirebaseFirestore.instance.collection('User');

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //create cacount
  String currentOption = options[0];
  void createAcc() async {
    String email = emailtext.text.trim();
    String password = passwordText.text.trim();
    if (email == "" || password == "") {
    } else {
      try {
        //creating new user
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => verify()));
        if (userCredential.user != null && isEmailVerified) {
          await users.doc(userCredential.user?.uid.toString())
          .set({
            'Username':email ,
            'Role':currentOption ,
            'Name': "" ,
            'Phone':"" ,
            'Location': ' ' ,
            'ping': false ,
            'uid': userCredential.user?.uid.toString()
          })
          .then((value) => print("user added"))
          .catchError((error)=>print("error in user"));
          final message = SnackBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
              content: const Text("Signin Successful"));

          ScaffoldMessenger.of(context).showSnackBar(message);
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        // AlertDialog(
        setState(() {
          isloadings = false;
        });
        final message = SnackBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
            content: Text(e.message.toString()));

        ScaffoldMessenger.of(context).showSnackBar(message);
      }
    }
  }

  @override
  final email = "";
  bool isloadings = false;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                //Login text
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25.0),
                  child: Container(
                    child: Text("Sign In ",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.green))),
                  ),
                ),
                // spacer
                const SizedBox(
                  height: 5,
                ),

                //textfireld
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: emailtext,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter Email',
                    ),
                  ),
                ),

                //for password
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: TextFormField(
                    controller: passwordText,
                    obscureText: true,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: Colors.green,
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                //button
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Admin"),
                        Radio(

                             activeColor: Colors.green,

                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            }),
                        SizedBox(
                          width: 6,
                        ),
                        Text("Farmer"),
                        Radio(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                              });
                            }),
                      ],
                    ),
                  ),
                ),

                // Sign in button
                Padding(
                  padding: const EdgeInsets.only(left: 125),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild?.unfocus();
                      }

                      setState(() {
                        isloadings = true;
                      });
                      createAcc();
                      // setState(() {
                      //   isloadings = false ;
                      // });
                    },
                    child: (isloadings)
                        ? Transform.scale(
                            scale: 0.5,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "SIGN IN ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //have an account or not text
                Row(
                  children: [
                    const SizedBox(
                      width: 70,
                    ),
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(" Login",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ))),
                    ),
                  ],
                )
              ],
            ),



          ]),
        ),
      ),
    );
  }
}
