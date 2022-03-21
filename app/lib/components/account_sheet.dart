import 'package:app/styles/account.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/models/models.dart';

const profileSlot = 3;

class AccountSheet extends HookWidget {
  const AccountSheet({Key? key}) : super(key: key);

  @override
  build(context) {
    final profileBox = useState<Box<ProfileList>?>(null);
    final profileListData = useState<ProfileList?>(null);

    final totalAccount = profileListData.value?.profiles.length ?? 0;

    useEffect(() {
      main() async {
        final box = await Hive.openBox<ProfileList>('profileList');
        final profileList = box.get('profileList');

        profileBox.value = box;
        profileListData.value = profileList;
      }

      main();

      return () {};
    }, []);

    signOut() async {
      profileBox.value!.put(
        'profileList',
        profileListData.value!.copyWith(active: -1),
      );

      context.vRouter.to('/sign', isReplacement: true);
    }

    showFullScreenAccountSheet() {
      Navigator.of(context).pop();
      context.vRouter.to("/account");
    }

    return n.Column([
      n.Box()
        ..bg = Colors.grey.shade400
        ..size = [40, 4]
        ..rounded
        ..mt = 12,
      n.Row([
        n.Row([
          n.Button(n.Text("Edit"))
            ..onPressed = showFullScreenAccountSheet
            ..centerStart,
        ])
          ..pl = 8
          ..expanded,
        n.Text("Account")
          ..color = Colors.grey.shade600
          ..center
          ..expanded,
        n.Box()..expanded
      ]),
      n.ListView.builder()
        ..shrinkWrap = true
        ..total = totalAccount
        ..h = totalAccount * 66
        ..maxH = profileSlot * 66
        ..p = 0
        ..physics = totalAccount <= profileSlot
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics()
        ..useItemBuilder((context, index) {
          if (profileListData.value == null) return const SizedBox.shrink();

          final profile = profileListData.value!.profiles[index];

          return n.ListTile(key: ValueKey(profile.alias))
            ..apply = AccountStyles.profileTile(profile)
            ..onTap = () {};
        }),
      n.ListTile()
        ..apply = AccountStyles.tile("Sign out")
        ..onTap = signOut,
      n.ListTile()
        ..apply = AccountStyles.tile("Add more accounts")
        ..onTap = () {},
    ]);
  }
}
