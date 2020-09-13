import 'file:///C:/Users/User/All%20Projects/Flutter/flash_chat/lib/components/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

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
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _emailId = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your E-Mail'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  _password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                colorofButton: Colors.blueAccent,
                text: 'Register',
                onPressed: () async {
                  //for user registration
                  setState(() {
                    _showSpinner = true;
                    _emailId = '';
                    _password = '';
                  });
                  try {
                    final statusOfRegistration =
                        await _auth.createUserWithEmailAndPassword(
                            email: _emailId, password: _password);
                    if (statusOfRegistration != null) {
                      Navigator.pushNamed(context, ChatScreen.id);

                      setState(() {
                        _showSpinner = false;
                      });
                    }
                  } catch (e) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
