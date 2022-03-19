import 'dart:async';

import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/models/validation.dart';
import 'package:app/services/dio.dart';
import 'package:app/styles/sign.dart';

class SignProfile extends HookWidget {
  const SignProfile({Key? key}) : super(key: key);

  @override
  build(context) {
    final alias = useTextEditingController();
    final name = useTextEditingController();

    final form = useMemoized(() => GlobalKey<FormState>());

    final aliasText = useState<String>('');
    final nameText = useState<String>('');

    final isLoading = useState(false);
    final aliasError = useState<String?>(null);

    useMemoized(() {
      alias.addListener(() {
        aliasText.value = alias.text;
      });

      name.addListener(() {
        nameText.value = name.text;
      });
    });

    final optionalText = aliasText.value.isNotEmpty && nameText.value.isEmpty
        ? "(default to '${alias.text}')"
        : "";

    FutureOr<bool> validateAlias() async {
      try {
        final res = await dio.post(
          "$api/registration/profile",
          data: {
            "alias": alias.text,
          },
        );

        final data = ValidationResponse.fromJson(res.data);

        final isValid = data.taken != true;
        if (!isValid) aliasError.value = "Username is taken";

        return isValid;
      } catch (_) {
        aliasError.value = "Invalid username";

        return false;
      }
    }

    Future<void> handleSubmit() async {
      if (isLoading.value) return;

      isLoading.value = true;
      aliasError.value = null;

      if (!form.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      if (!await validateAlias()) {
        isLoading.value = false;
        aliasError.value = "ID is taken";
        return;
      }

      isLoading.value = false;
      aliasError.value = null;

      context.vRouter.to('/sign-complete');
    }

    return Scaffold(
      body: Form(
        key: form,
        child: n.Column([
          SignStyles.back(context),
          n.Text("Add your profile")
            ..fontSize = 36
            ..w200,
          n.Text(
              "Let's set up your profile so you can easily find your friends.")
            ..fontSize = 16
            ..w300
            ..color = Colors.grey.shade500
            ..mb = 24
            ..freezed,
          n.TextFormField.label("ID Alias")
            ..controller = alias
            ..validator = SignStyles.validate
            ..isFilled
            ..emailKeyboard
            ..maxLines = 1,
          n.TextFormField.label("Name $optionalText")
            ..controller = name
            ..isFilled
            ..emailKeyboard
            ..maxLines = 1,
          n.Button(
            SignStyles.buttonText("Sign Up", isLoading.value),
          )
            ..apply = SignStyles.submit
            ..onPressed = handleSubmit
            ..freezed
        ])
          ..apply = SignStyles.layout,
      ),
    );
  }
}
