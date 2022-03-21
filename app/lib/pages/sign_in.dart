import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';

import 'package:vrouter/vrouter.dart';

import 'package:niku/namespace.dart' as n;

import 'package:app/services/services.dart';
import 'package:app/models/models.dart';
import 'package:app/styles/styles.dart';

class SignInPage extends HookWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  build(context) {
    final username = useTextEditingController();
    final password = useTextEditingController();

    final isLoading = useState(false);
    final error = useState<String?>(null);

    final form = useMemoized(() => GlobalKey<FormState>());

    Future<void> handleSubmit() async {
      if (!form.currentState!.validate()) return;

      if (isLoading.value) return;
      isLoading.value = true;

      try {
        final res = await dio.post("$api/auth/signin", data: {
          "username": username.text,
          "password": password.text,
        });

        try {
          final profile = Profile.fromJson(res.data);

          if (profile.username != username.text) {
            error.value = "Username or password is incorrect";
            isLoading.value = false;
            return;
          }

          final box = await Hive.openBox<ProfileList>('profileList');
          final profileList = box.get('profileList');

          if (profileList == null) {
            box.put(
              'profileList',
              ProfileList(
                active: 0,
                profiles: [profile],
              ),
            );

            isLoading.value = false;
            return;
          }

          box.put(
            'profileList',
            ProfileList(
              active: profileList.profiles.length,
              profiles: [...profileList.profiles, profile],
            ),
          );

          isLoading.value = false;

          context.vRouter.to('/', isReplacement: true);
        } catch (e) {
          error.value = "Something went wrong";
          isLoading.value = false;
        }
      } on DioError catch (err) {
        try {
          final res = APIError.fromJson(err.response?.data);

          error.value = res.error;
        } catch (e) {
          error.value = "Something went wrong";
        }

        isLoading.value = false;
      }
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
          if (error.value != null && error.value!.isNotEmpty)
            n.Text(error.value)
              ..color = Colors.red
              ..w500
              ..mt = 12,
          n.Button(SignStyles.buttonText("Sign In", isLoading.value))
            ..apply = SignStyles.submit
            ..onPressed = handleSubmit,
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
