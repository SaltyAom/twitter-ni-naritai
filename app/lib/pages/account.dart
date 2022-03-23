import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niku/namespace.dart' as n;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hive/hive.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/models/models.dart';
import 'package:app/stores/stores.dart';
import 'package:app/styles/account.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final profileBox = useState<Box<UserList>?>(null);
    final profileListData = useState<UserList?>(null);

    final totalAccount = profileListData.value?.profiles.length ?? 0;

    useEffect(() {
      main() async {
        final box = await Hive.openBox<UserList>('profileList');
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

    reorder(int oldIndex, int newIndex) {
      newIndex = newIndex >= totalAccount - 1 ? newIndex - 1 : newIndex;

      final profiles = profileListData.value!.profiles;
      // Make sure no side-effect occurs
      final profile = profiles[oldIndex].copyWith();

      profiles
        ..removeAt(oldIndex)
        ..insert(newIndex, profile);

      final newData = profileListData.value!.copyWith(
        active: newIndex,
        profiles: profiles,
      );

      profileListData.value = newData;

      profileBox.value!.put(
        'profileList',
        newData,
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: n.Button(n.Text("Edit"))..onPressed = () {},
        title: n.Text("Account")..color = Colors.grey.shade600,
        actions: [
          n.Button(n.Text("Done"))
            ..onPressed = () {
              context.vRouter.historyBack();
            },
        ],
      ),
      body: n.Column([
        ReorderableListView.builder(
          itemBuilder: (context, index) {
            if (profileListData.value == null) return const SizedBox.shrink();

            final profile = profileListData.value!.profiles[index];

            return n.ListTile(key: ValueKey(profile.alias))
              ..apply = AccountStyles.profileTile(profile)
              ..trailing = ReorderableDragStartListener(
                index: index,
                child: n.Icon(Icons.drag_handle)..color = Colors.grey.shade400,
              );
          },
          itemCount: totalAccount,
          onReorder: reorder,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        n.ListTile()
          ..apply = AccountStyles.tile("Sign out")
          ..onTap = signOut,
        n.ListTile()
          ..apply = AccountStyles.tile("Add more accounts")
          ..onTap = () {},
      ]),
    );
  }
}
