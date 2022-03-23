import 'package:app/components/drawer_tab.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import 'account_sheet.dart';
import 'package:app/stores/stores.dart';
import 'package:app/styles/styles.dart';

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

    viewSelfProfile() {
      context.vRouter.to("/profile/${profile!.alias}");
    }

    return Drawer(
      child: n.Column([
        n.Column([
          n.Row([
            n.Image.network(profile!.image)
              ..apply = ProfileStyles.profile
              ..useGesture(
                tap: () {
                  context.vRouter.to("/profile/${profile.alias}");
                },
              ),
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
            ..mainBetween,
          n.Text(profile.name)
            ..fontSize = 18
            ..w600
            ..mt = 12
            ..mb = 4
            ..useGesture(
              tap: viewSelfProfile,
            ),
          n.Text("@${profile.alias}")..color = Colors.grey.shade500,
          n.Row([
            n.Text("0 Followers")..color = Colors.grey.shade500,
            n.Text("198 Followings")..color = Colors.grey.shade500,
          ])
            ..gap = 16
            ..my = 16,
        ])
          ..crossStart
          ..px = 16,
        n.ListView.children([
          DrawerTab(
            title: "Profile",
            icon: Icons.person_outline,
            onTap: viewSelfProfile,
          ),
        ])
          ..shrinkWrap = true
          ..expanded,
      ])
        ..crossStart
        ..safeY,
    );
  }
}
