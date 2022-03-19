import 'dart:async';

import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/models/validation.dart';
import 'package:app/services/dio.dart';
import 'package:app/styles/styles.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  build(context) {
    final username = useTextEditingController();
    final password = useTextEditingController();
    final confirmPassword = useTextEditingController();

    final isLoading = useState(false);
    final usernameError = useState<String?>(null);

    final form = useMemoized(() => GlobalKey<FormState>());

    FutureOr<bool> validateUsername() async {
      try {
        final res = await dio.post(
          "$api/registration/user",
          data: {
            "username": username.text,
          },
        );

        final data = ValidationResponse.fromJson(res.data);

        final isValid = data.taken != true;
        if (!isValid) usernameError.value = "Username is taken";

        return isValid;
      } catch (_) {
        usernameError.value = "Invalid username";

        return false;
      }
    }

    String? validateConfirmPassword(String? value) {
      final validation = SignStyles.validate(value);

      if (validation != null) return validation;
      if (value != password.text) return "Passwords don't match";

      return null;
    }

    Future<void> handleSubmit() async {
      if (isLoading.value) return;

      isLoading.value = true;
      usernameError.value = null;

      if (!form.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      if (!await validateUsername()) {
        isLoading.value = false;
        return;
      }

      isLoading.value = false;
      usernameError.value = null;

      context.vRouter.to("/sign-mail");
    }

    return Scaffold(
      body: Form(
        key: form,
        child: n.Column([
          SignStyles.back(context),
          n.Text("Sign Up")
            ..fontSize = 36
            ..w200
            ..mb = 24,
          n.TextFormField.label("Username")
            ..controller = username
            ..validator = SignStyles.validate
            ..filled = true
            ..maxLines = 1
            ..errorText = usernameError.value,
          n.TextFormField.label("Password")
            ..controller = password
            ..validator = SignStyles.validate
            ..asPassword
            ..filled = true
            ..maxLines = 1,
          n.TextFormField.label("Confirm Password")
            ..controller = confirmPassword
            ..validator = validateConfirmPassword
            ..asPassword
            ..filled = true
            ..maxLines = 1,
          n.Button(
            SignStyles.buttonText("Next", isLoading.value),
          )
            ..apply = SignStyles.submit
            ..onPressed = handleSubmit,
          n.Wrap([
            n.Text("Already have an account? ")..color = Colors.grey.shade500,
            n.Button(const Text("Sign In"))
              ..onPressed = () {
                context.vRouter.to('/sign-in', isReplacement: true);
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
