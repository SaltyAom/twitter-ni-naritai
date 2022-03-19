import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:vrouter/vrouter.dart';

import 'package:app/styles/sign.dart';

class SignComplete extends StatelessWidget {
  const SignComplete({Key? key}) : super(key: key);

  @override
  build(context) {
    return Scaffold(
      body: n.Column([
        n.Text("Sign Up Complete")
          ..fontSize = 36
          ..w200,
        n.Text("Welcome to Twitter ni Naritai! We're glad to have you join.")
          ..apply = SignStyles.label,
        n.Text("Let's welcome you in with signing in")
          ..apply = SignStyles.label,
        n.Button(n.Text("Sign In"))
          ..apply = SignStyles.submit
          ..onPressed = () {
            context.vRouter.to("/", isReplacement: true);
            context.vRouter.to("/sign-in");
          }
          ..mt = 12
      ])
        ..apply = SignStyles.layout,
    );
  }
}
