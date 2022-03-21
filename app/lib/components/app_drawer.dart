import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'account_sheet.dart';
import 'package:app/stores/stores.dart';

class AppDrawer extends HookConsumerWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final profile = ref.watch(currentProfileProvider);

    showAccountSheet() {
      showModalBottomSheet(
        context: context,
        builder: (_) => const AccountSheet(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );
    }

    return Drawer(
      child: n.Column([
        n.Row([
          n.Image.network(profile!.image)
            ..w = 48
            ..h = 48
            ..rounded,
          n.IconButton(Icons.more_horiz)
            ..w = 36
            ..h = 36
            ..p = 0
            ..splashColor = Colors.transparent
            ..splashRadius = 1
            ..onPressed = showAccountSheet
            ..useParent((v) => v
              ..useRoundedBorder(
                color: Colors.grey.shade300,
                width: 2,
              )),
        ])
          ..mainBetween
          ..px = 16,
        n.Text(profile.name)
          ..mx = 16
          ..fontSize = 18
          ..w600
          ..mt = 12
          ..mb = 4,
        n.Text("@${profile.alias}")
          ..mx = 16
          ..color = Colors.grey.shade500,
        n.Row([
          n.Text("0 Followers")
            ..mx = 16
            ..color = Colors.grey.shade500,
          n.Text("198 Followings")
            ..mx = 16
            ..color = Colors.grey.shade500,
        ])
          ..my = 16,
      ])
        ..crossStart
        ..safeY,
    );
  }
}
