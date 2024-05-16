import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trade_bazar/authentication/signUp.dart';
import 'package:trade_bazar/homeScreens/homeScreenNavigation.dart';
import '../colors.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  // form key
  final _formKey = GlobalKey<FormState>();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return Material(
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
              padding: EdgeInsets.only(top: 120, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back,",
                    style: TextStyle(color: wcolor, fontSize: 20),
                  ),
                  Text(
                    "Log In!",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: wcolor),
                  ),
                  SizedBox(
                    height: 180,
                  ),
                  _buildForm(),
                ],
              ),
            )
          ],
        ));
  }

  //building of form
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        inputField(),
        SizedBox(
          height: 5,
        ),
        _buildRememberForget(),
        SizedBox(
          height: 15,
        ),
        _buildLoginButton(),
        _buildSignUpButton(),
      ],
    );
  }

  Widget inputField() {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          height: 20,
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
        TextButton(
          onPressed: () {},
          child: Text("Forget your password?", style: TextStyle(color: pcolor)),
        )
      ],
    );
  }

  Widget _buildGrayText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {
          _formKey.currentState!.validate();
          signIn(emailController.text, passwordController.text);

        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: myColor,
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text("Login"));
  }

  Widget _buildSignUpButton() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGrayText("Don't have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) => register()));
                  },
                  child: Text(
                    "Register Now",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
          /* SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Powered by ",
                style: TextStyle(fontWeight: FontWeight.bold, color: pcolor),
              ),
              Text(
                "Trade Bazar",
                style: TextStyle(color: gcolor),
              )
            ],
          )*/
        ],
      ),
    );
  }


  //signIn
  void signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => navigationBar())),
      });
    } on FirebaseAuthException catch (error) {
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
        case "invalid-credential":
          errorMessage = "User doesn't exist.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }

}
