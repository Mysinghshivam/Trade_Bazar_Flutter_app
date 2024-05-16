import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trade_bazar/authentication/signIn.dart';
import 'package:trade_bazar/homeScreens/homeScreenNavigation.dart';
import 'package:trade_bazar/models/userModel.dart';

import '../colors.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  //firebase
  final _auth = FirebaseAuth.instance;

  //form key
  final _formKey = GlobalKey<FormState>();

  // string for displaying the error Message
  String? errorMessage;

  final TextEditingController firstNameEditingController =
      new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      new TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
          color: wcolor,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 2.8,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [pcolor.withOpacity(0.7), pcolor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(160),
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(60))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 130, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(color: wcolor, fontSize: 20),
                    ),
                    Text(
                      "Sign Up!",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: wcolor),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    _buildForm(),
                  ],
                ),
              )
            ],
          )),
    );
    ;
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          inputField(),
          _buildRememberForget(),
          SizedBox(
            height: 10,
          ),
          _buildSignUpButton(),
          SizedBox(
            height: 20,
          ),
          _remainingText()
          //_buildOtherRegister(),
        ],
      ),
    );
  }

  Widget inputField() {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildGrayText("Full Name"),
        TextFormField(
          autofocus: false,
          controller: firstNameEditingController,
          keyboardType: TextInputType.name,
          validator: (value) {
            RegExp regex = new RegExp(r'^.{5,}$');
            if (value!.isEmpty) {
              return ("Name cannot be Empty");
            }
            if (!regex.hasMatch(value)) {
              return ("Enter Valid name(Min. 5 Character)");
            }
            return null;
          },
          onSaved: (value) {
            firstNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.account_circle),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        _buildGrayText("Email address"),
        TextFormField(
            autofocus: false,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Please Enter Your Email");
              }
              // reg expression for email validation
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return ("Please Enter a valid email");
              }
              return null;
            },
            onSaved: (value) {
              emailController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.mail),
            )),
        SizedBox(
          height: 5,
        ),
        _buildGrayText("Password"),
        TextFormField(
            autofocus: false,
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Password is required for login");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter Valid Password(Min. 6 Character)");
              }
            },
            onSaved: (value) {
              passwordController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.vpn_key),
            )),
        SizedBox(
          height: 5,
        ),
        _buildGrayText("Confirm Password"),
        TextFormField(
            autofocus: false,
            controller: confirmPasswordEditingController,
            obscureText: true,
            validator: (value) {
              if (confirmPasswordEditingController.text !=
                  passwordController.text) {
                return "Password don't match";
              }
              return null;
            },
            onSaved: (value) {
              confirmPasswordEditingController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
            ))
      ]),
    );
  }

  //remember me
  Widget _buildRememberForget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildGrayText("Remember me"),
          ],
        ),
        //TextButton(onPressed: (){}, child: Text("Forget your password?",style: TextStyle(color: pcolor)),)
      ],
    );
  }

  Widget _buildGrayText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
        onPressed: () {
          _formKey.currentState!.validate();
          _register(emailController.text, passwordController.text);
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: myColor,
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text("Register"));
  }

  Widget _remainingText() {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(color: Colors.black),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) => login()));
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          )
        ],
      ),
    );
  }


  //signup or register
  void _register(String email, String password) async{
    try{
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch(error){
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        case "network-request-failed":
          errorMessage = "Network connection not available.";
          break;
        case "email-already-in-use":
          errorMessage = "The account already exists for that email.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }



  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    ClientUserModel userModel = ClientUserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.cid = user.uid;
    userModel.name = firstNameEditingController.text;

    await firebaseFirestore
        .collection("client")
        .doc(user.uid)
        .set(userModel.toMap());

    await firebaseFirestore.collection("client").doc(user.uid).set(
        {"phoneNumber": "", "age": "", "gender": ""}, SetOptions(merge: true));
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => navigationBar()),
            (route) => false);
  }

  Widget _buildOtherRegister() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildGrayText("Or login with"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(
                icon: Image.asset("assets/fblogo.png"),
              ),
              Tab(
                icon: Image.asset("assets/googlelogo.png"),
              ),
              Tab(
                icon: Image.asset("assets/twitterlogo.png"),
              )
            ],
          )
        ],
      ),
    );
  }

}
