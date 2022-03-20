import 'dart:async';

import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/stores/stores.dart';
import 'package:app/models/validation.dart';
import 'package:app/services/dio.dart';
import 'package:app/styles/sign.dart';

class SignMail extends HookConsumerWidget {
  const SignMail({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final email = useTextEditingController();

    final form = useMemoized(() => GlobalKey<FormState>());

    final isLoading = useState(false);
    final emailError = useState<String?>(null);

    useEffect(() {
      final store = ref.read(registrationProvider) as Registration;
      email.text = store.email;

      return () {};
    }, []);

    FutureOr<bool> validateEmail() async {
      try {
        final res = await dio.post(
          "$api/registration/email",
          data: {
            "email": email.text,
          },
        );

        final data = ValidationResponse.fromJson(res.data);

        final isValid = data.taken != true;
        if (!isValid) emailError.value = "Email is taken";

        return isValid;
      } catch (_) {
        emailError.value = "Invalid email";

        return false;
      }
    }

    Future<void> handleSubmit() async {
      if (isLoading.value) return;

      isLoading.value = true;
      emailError.value = null;

      if (!form.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      if (!await validateEmail()) {
        isLoading.value = false;
        return;
      }

      ref.read(registrationProvider.notifier).copyWith(email: email.text);

      isLoading.value = false;
      emailError.value = null;

      context.vRouter.to('/sign-profile');
    }

    return Scaffold(
      body: Form(
        key: form,
        child: n.Column([
          SignStyles.back(context, () {
            ref.read(registrationProvider.notifier).copyWith(email: email.text);
          }),
          n.Text("Add your email")
            ..fontSize = 36
            ..w200,
          n.Text(
              "For security and ownership reasons, we need to your email address.")
            ..fontSize = 16
            ..w300
            ..color = Colors.grey.shade500
            ..mb = 24,
          n.TextFormField.label("Email")
            ..controller = email
            ..validator = SignStyles.validate
            ..isFilled
            ..emailKeyboard
            ..maxLines = 1
            ..errorText = emailError.value
            ..focusNode = SignStyles.save(ref, (action) {
              action.copyWith(
                email: email.text,
              );
            }),
          n.Button(
            SignStyles.buttonText("Next", isLoading.value),
          )
            ..apply = SignStyles.submit
            ..onPressed = handleSubmit
        ])
          ..apply = SignStyles.layout,
      ),
    );
  }
}
