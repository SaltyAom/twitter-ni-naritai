import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:vrouter/vrouter.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  build(context) {
    return Scaffold(
      body: n.Column([
        n.Text("Welcome to")
          ..fontSize = 16
          ..w300
          ..color = Colors.grey.shade500
          ..mb = 8,
        n.Text("Twitter ni naritai")
          ..fontSize = 36
          ..w200,
        n.Text(
            "A side-project of a Twitter wanna-be created for educational purposes.")
          ..apply = SignStyles.label
          ..mt = 12
          ..mb = 36,
        n.Button(const Text("Sign In"))
          ..onPressed = () {
            context.vRouter.to('/sign-in');
          }
          ..color = Colors.white
          ..w500
          ..fontSize = 18
          ..py = 16
          ..bg = Colors.blue
          ..rounded
          ..wFull
          ..mb = 12,
        n.Button(const Text("Sign Up"))
          ..onPressed = () {
            context.vRouter.to('/sign-up');
          }
          ..color = Colors.blue
          ..w500
          ..fontSize = 18
          ..py = 16
          ..bg = Colors.blue.shade50
          ..rounded
          ..wFull
      ])
        ..mainCenter
        ..crossStart
        ..px = 16,
    );
  }
}
