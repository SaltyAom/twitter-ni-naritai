import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:niku/namespace.dart' as n;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';
import 'package:dio/dio.dart';

import 'package:app/stores/stores.dart';
import 'package:app/models/models.dart';
import 'package:app/services/dio.dart';

class Compose extends HookConsumerWidget {
  const Compose({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final profile = ref.watch(currentProfileProvider);
    final content = useTextEditingController();

    final isLoading = useState<bool>(false);
    final error = useState<String?>(null);

    final form = useMemoized(() => GlobalKey<FormState>());

    tweet() async {
      if (isLoading.value) return;
      if (!form.currentState!.validate()) return;

      isLoading.value = true;

      try {
        final res = await dio.put(
          "$api/tweet/new",
          data: {
            "content": content.text,
          },
          options: Options(
            headers: {
              "cookie": "accessToken=${profile!.token}",
            },
          ),
        );

        final tweet = Tweet.fromJson(res.data);

        isLoading.value = false;

        context.vRouter.historyBack();
      } on DioError catch (_) {
        isLoading.value = false;
        error.value = "Something went wrong, please try again";
      } on FormatException catch (_) {
        isLoading.value = false;
        error.value = "Something went wrong, please try again";
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.vRouter.historyBack();
          },
        ),
        actions: [
          n.Wrap([
            n.Button(n.Text("Tweet"))
              ..color = Colors.white
              ..w500
              ..bg = Colors.blue
              ..rounded
              ..onPressed = tweet,
          ])
            ..mr = 8
        ],
      ),
      body: n.Row([
        n.Image.network(profile!.image)
          ..w = 36
          ..h = 36
          ..cover
          ..rounded
          ..mt = 12,
        n.TextFormField.hint("What's on your mind?")
          ..formKey = form
          ..controller = content
          ..validator = (value) {
            if (value!.isEmpty) return "Can't tweet empty text";

            return null;
          }
          ..errorText = error.value
          ..noUnderline
          ..flex
          ..px = 16
          ..maxLength = 280,
      ])
        ..crossStart
        ..px = 8,
    );
  }
}
