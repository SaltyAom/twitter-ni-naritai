import 'dart:async';

import 'package:app/models/error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/stores/stores.dart';
import 'package:app/models/validation.dart';
import 'package:app/services/dio.dart';
import 'package:app/styles/sign.dart';

class SignProfile extends HookConsumerWidget {
  const SignProfile({Key? key}) : super(key: key);

  @override
  build(context, ref) {
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

    useEffect(() {
      final store = ref.read(registrationProvider);

      alias.text = store.alias;
      name.text = store.name;

      return () {};
    }, []);

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

    Future<bool> signUp() async {
      try {
        final store = ref.read(registrationProvider);

        final res = await dio.put(
          "$api/auth/signup",
          data: {
            "username": store.username,
            "password": store.password,
            "profile": {
              "alias": aliasText.value,
              "email": store.email,
              "name":
                  nameText.value.isNotEmpty ? nameText.value : aliasText.value,
            },
          },
        );

        final isValid = res.data['username'] == store.username;
        if (!isValid) aliasError.value = "Something went wrong";

        return isValid;
      } on DioError catch (err) {
        try {
          final res = APIError.fromJson(err.response?.data);

          aliasError.value = res.error;
        } catch (e) {
          aliasError.value = "Something went wrong";
        }

        return false;
      } catch (err) {
        aliasError.value = "Something went wrong";

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

      if (!await signUp()) {
        isLoading.value = false;
        return;
      }

      isLoading.value = false;
      aliasError.value = null;

      context.vRouter.to('/sign-complete');

      final action = ref.read(registrationProvider.notifier);
      action.reset();
    }

    return Scaffold(
      body: Form(
        key: form,
        child: n.Column([
          SignStyles.back(context, () {
            ref.read(registrationProvider.notifier).copyWith(
                  alias: alias.text,
                  name: name.text,
                );
          }),
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
            ..maxLines = 1
            ..errorText = aliasError.value
            ..focusNode = SignStyles.save(ref, (action) {
              action.copyWith(
                alias: alias.text,
              );
            }),
          n.TextFormField.label("Name $optionalText")
            ..controller = name
            ..isFilled
            ..emailKeyboard
            ..maxLines = 1
            ..focusNode = SignStyles.save(ref, (action) {
              action.copyWith(
                name: name.text,
              );
            }),
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
