// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/screens/authentication/component.dart';

import '../home/components/home_screen.dart';

class LogInPage extends StatefulWidget {
  static bool isSignedIn = false;
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // sign up to firebase auth
  Future<void> registerWithEmailAndPassword() async {
    try {
      print('going to run firebase register function ->');
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('completed firebase register function ->');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // login to firebase auth
  Future<void> signInWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: Container(
        width: w * 0.87,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.25,
              ),
              Text(
                LogInPage.isSignedIn ? "Login" : "Sign Up",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 4))
                  ],
                  color: Colors.white,
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                      border: InputBorder.none,
                      hintText: "Email",
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 207, 203, 203),
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 4))
                    ],
                    color: Colors.white),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.key,
                        color: primaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: primaryColor,
                      ),
                      border: InputBorder.none,
                      hintText: "Password",
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 207, 203, 203),
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    LogInPage.isSignedIn
                        ? "Don't have an account? "
                        : "Already have an account?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 160, 155, 155),
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (LogInPage.isSignedIn == false) {
                          LogInPage.isSignedIn = true;
                        } else {
                          LogInPage.isSignedIn = false;
                        }
                      });
                    },
                    child: Text(
                      LogInPage.isSignedIn ? "Register" : "Login",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    print('entering home screen');
                    if (LogInPage.isSignedIn == true) {
                      signInWithEmailAndPassword();
                    } else if (LogInPage.isSignedIn == false) {
                      registerWithEmailAndPassword();
                    } else {
                      print(
                          "error while authenticating, bool isSignedIn is causing issue.");
                    }
                  },
                  child: Container(
                    width: w * 0.7,
                    height: h * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 4))
                        ],
                        color: primaryColor),
                    child: Center(
                      child: Text(
                        LogInPage.isSignedIn ? "Log In" : "Create account",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white54),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Center(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 181, 174, 174)),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
