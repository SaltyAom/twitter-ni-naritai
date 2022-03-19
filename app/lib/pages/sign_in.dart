import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:vrouter/vrouter.dart';

import 'package:niku/namespace.dart' as n;

import 'package:app/styles/styles.dart';

class SignInPage extends HookWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  build(context) {
    final username = useTextEditingController();
    final password = useTextEditingController();

    final form = useMemoized(() => GlobalKey<FormState>());

    handleSubmit() {
      if (!form.currentState!.validate()) return;
    }

    return Scaffold(
      body: Form(
        key: form,
        child: n.Column([
          SignStyles.back(context),
          n.Text("Sign In")
            ..fontSize = 36
            ..w200
            ..mb = 24,
          n.TextFormField.label("Username")
            ..controller = username
            ..validator = SignStyles.validate
            ..filled = true
            ..maxLines = 1,
          n.TextFormField.label("Password")
            ..controller = password
            ..validator = SignStyles.validate
            ..asPassword
            ..filled = true
            ..maxLines = 1,
          n.Button(const Text("Login"))
            ..onPressed = handleSubmit
            ..fontSize = 18
            ..bold
            ..color = Colors.white
            ..splash = Colors.white.withOpacity(.1)
            ..bg = Colors.blue
            ..rounded
            ..py = 16
            ..mt = 8
            ..wFull,
          n.Wrap([
            n.Text("Doesn't have an account? ")..color = Colors.grey.shade500,
            n.Button(const Text("Sign Up"))
              ..onPressed = () {
                context.vRouter.to('/sign-up', isReplacement: true);
              }
          ])
            ..runStart
            ..crossCenter,
        ])
          ..apply = SignStyles.layout,
      ),
    );
  }
}
