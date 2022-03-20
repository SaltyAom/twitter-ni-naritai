import 'package:app/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vrouter/vrouter.dart';

import 'package:niku/namespace.dart' as n;

class SignStyles {
  static final layout = n.Column(const [])
    ..mainCenter
    ..crossStart
    ..gap = 16
    ..fullSize
    ..px = 16;

  static Widget back(BuildContext context, [Function? action]) =>
      n.Button.icon(const Text("Back"), const Icon(Icons.chevron_left))
        ..onPressed = () {
          context.vRouter.historyBack();

          if (action != null) action();
        }
        ..splash = Colors.grey.shade200
        ..p = 0
        ..pr = 12
        ..color = Colors.grey.shade500;

  static final label = n.Text("")
    ..color = Colors.grey.shade500
    ..fontSize = 18
    ..height = 1.5;

  static final submit = n.Button(const Text(""))
    ..fontSize = 18
    ..bold
    ..color = Colors.white
    ..splash = Colors.white.withOpacity(.1)
    ..bg = Colors.blue
    ..rounded
    ..py = 16
    ..mt = 8
    ..wFull;

  static String? Function(String?) get validate {
    return (String? value) {
      if (value == null || value.isEmpty) return "This field can't be empty";
      if (value.length < 5) return "Atleast 5 characters";

      return null;
    };
  }

  static Widget buttonText(String text, bool isLoading) => n.Row([
        n.Box()..w = isLoading ? 29 : 0,
        Text(text),
        if (isLoading)
          const CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.white,
          ).niku
            ..size = [21, 21]
            ..ml = 8
        else
          const SizedBox.shrink(),
      ])
        ..center;

  static FocusNode save(
    WidgetRef ref,
    void Function(RegistrationState) action,
  ) {
    final node = FocusNode();

    return node
      ..addListener(() {
        if (node.hasFocus) return;

        action(ref.read(registrationProvider.notifier));
      });
  }
}
