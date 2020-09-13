import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class LaunchingPage extends StatefulWidget {
  static const id = 'LaunchingPage';

  @override
  _LaunchingPageState createState() => _LaunchingPageState();
}

class _LaunchingPageState extends State<LaunchingPage> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    functionCheck();
  }

  functionCheck() {
    var duration = new Duration(seconds: 2);

    print('You here');
    Timer(
      duration,
      () {
        Navigator.pushNamed(context, WelcomeScreen.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Hero(
              tag: kLogoTransitionTag,
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 400,
              ),
            ),
          ),
          Flexible(
            child: Hero(
              tag: kTextTransitonTag,
              child: TextLiquidFill(
                waveDuration: Duration(seconds: 1),
                text: 'Flash Chat',
                boxBackgroundColor: Colors.deepOrangeAccent,
                textStyle: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                boxHeight: 300.0,
                waveColor: Colors.white,
                loadDuration: Duration(seconds: 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
