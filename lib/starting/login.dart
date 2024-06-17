
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hack_o_mania/admin/home_admin.dart';
import 'package:hack_o_mania/farmer/home_famer.dart';
import 'package:hack_o_mania/starting/Sign.dart';
import 'Sign.dart';
import 'package:hack_o_mania/farmer/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
var roll ='' ;
var emaild = '' ;
var farmer_named= "Enter Your Name" ;
var phoned = '' ;
var document = '' ;
var location = '' ;
bool pingd = false ;
var AdminSenderd=  '' ;
TextEditingController emailsign = TextEditingController();
TextEditingController passwordsign = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final email = "";
  bool isloading = false ;

  Future enterUser() async {
    String emais = emailsign.text.trim();
    String passwors = passwordsign.text.trim();
    if (emais == "" || passwors == "") {
    } else {
      try {
        //creating new user
        var userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emais, password: passwors);

        print(userCredential.user);
        if (userCredential.user != null) {
          final message =SnackBar(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
              content: Text("Login Successful") )   ;
          ScaffoldMessenger.of(context).showSnackBar(message) ;

            document = userCredential.user!.uid ;
            print(document) ;
            DocumentSnapshot who = await  FirebaseFirestore.instance.collection('User').doc(userCredential.user?.uid.toString()).get() ;
              var role = who.get('Role') ;
              var email = who.get('Username') ;
          var farmer_name = who.get('Name') ;
          var phone = who.get('Phone') ;
          var l  = who.get('Location') ;
          bool ping = who.get('ping');
          var adminSender = who.get('AdminSender') ;
            pingd= ping ;
          roll = role ;

              print("lol") ;
              print(email) ;
              print(pingd) ;
              emaild =email ;
              phoned = phone ;
              farmer_named = farmer_name ;
              location = l ;
               AdminSenderd = adminSender ;
               print(AdminSenderd) ;
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => (role=='Admin')?home_admin():home_farmer()));
        }
      } on FirebaseAuthException catch (e) {
        // AlertDialog(
        //   title: Text(e.toString()),
        //
        // ) ;
        setState(() {
          isloading = false ;
        });
        final message =SnackBar(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            content: Text(e.message.toString())) ;

        ScaffoldMessenger.of(context).showSnackBar(message) ;
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 250,
            child: Image.asset("assets/el.png")),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
        ),
        Positioned(
            top: 200,
            child: Image.asset("assets/el.png")),
        Positioned(
          top: 150,
            left: 200,
            child: Image.asset("assets/lady.png")),

        Positioned(
          top: 300,
          left: 30,
          child: Container(

            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(

                  blurRadius: 10,

                )
              ],
              color: Colors.white ,
              borderRadius: BorderRadius.circular(40) ,
            ),
            width: 300,
            height: 400,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Login text
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25.0),
                  child: Container(
                    child: Text(
                        "LOGIN",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.green
                                ,
                                fontSize: 30 ,
                                fontWeight: FontWeight.bold
                            )
                        )
                    ),
                  ),
                ),
                // spacer
                SizedBox(
                  height: 20,
                ),
                //textfireld
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(

                    controller: emailsign,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.green,width: 2),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color:Colors.green
                        ,
                      ),
                      contentPadding: EdgeInsets.all(20),
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
                    controller: passwordsign,
                    obscureText: true,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.green,width: 2),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Colors.green
                      ),
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                //sign in
                //button
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:110 ,),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async{
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                        currentFocus.focusedChild?.unfocus();
                      }
                      setState(() {
                        isloading= true;
                      });
                      
                      await  enterUser();
                      // setState(() {
                      //   isloading =false ;
                      // });
                    },
                    child: (isloading)?
                    Transform.scale(
                      scale: 0.5,
                      child: CircularProgressIndicator(
                        color: Colors.white,),
                    )
                        : Text("login" , style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white ,
                            fontWeight: FontWeight.bold
                        )
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,

                      ) ,
                      Text("Dont have a account? " ,
                        style: TextStyle(
                          // color: Color(0xffED1C39)
                        ),

                      )
                      ,
                      Text(
                          "Sigin",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 12 ,
                                fontWeight: FontWeight.bold ,
                                color: Colors.green ,
                              )
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}