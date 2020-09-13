import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/roundedButton.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginDetails = FirebaseAuth.instance;

  String _emailId;
  String _password;
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: kLogoTransitionTag,
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                  _emailId = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your E-Mail'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  _password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                colorofButton: Colors.lightBlueAccent,
                text: 'Log In',
                onPressed: () async {
                  //Implement login functionality.
                  setState(() {
                    _showSpinner = true;
                  });
                  try {
                    final userDetails =
                        await _loginDetails.signInWithEmailAndPassword(
                            email: _emailId, password: _password);
                    userDetails != null
                        ? Navigator.pushNamed(context, ChatScreen.id)
                        : print(userDetails);

                    setState(() {
                      _showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
