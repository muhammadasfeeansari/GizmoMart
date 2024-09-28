// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/helper_fun/helper_func.dart';
import 'package:practice/utills/routes.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Registeruser extends StatefulWidget {
  const Registeruser({super.key});

  @override
  State<Registeruser> createState() => _RegisteruserState();
}

class _RegisteruserState extends State<Registeruser> {
  final Name = TextEditingController();
  final Email = TextEditingController();
  final Password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void registerUser() async {
    if (formkey.currentState!.validate()) {
      // Show loading dialog
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        // Create user in Firebase Auth
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: Email.text, password: Password.text);
        // Store additional user data in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': Name.text,
          'email': Email.text, // Make sure this is included
          'createdAt': Timestamp.now(),
        });
        // Remove loading dialog
        Navigator.pop(context);
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Sign Up Successfully",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        );
        // Navigate to Login screen
        Navigator.pushNamed(context, MyRoutes.LoginRoute);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayErrorMassage(e.code, context);
      } catch (e) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to store user data: ${e.toString()}'),
          ),
        );
      }
    }
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Material(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/hey.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: (Theme.of(context).textTheme.displayLarge?.color ??
                          mytheme.blueishcolor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: Name,
                            decoration: InputDecoration(
                              hintText: "Enter Username",
                              labelText: "User Name",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "User Name Is Required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: Email,
                            decoration: InputDecoration(
                              hintText: "Enter User Email",
                              labelText: "User Email",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "User Email Is Required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: Password,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "User Password",
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Is Required";
                              } else if (value.length < 6) {
                                return "Password Must Contain 6 Characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Already Have An Account?".text.size(16).make(),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.LoginRoute);
                                },
                                child: "Sign In"
                                    .text
                                    .color(Colors.blue[800])
                                    .size(16)
                                    .make(),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () => registerUser(),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mytheme
                                  .blueishcolor, // Set your button color here
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
