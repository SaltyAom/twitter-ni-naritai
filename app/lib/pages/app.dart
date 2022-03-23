import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niku/namespace.dart' as n;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/components/components.dart';
import 'package:app/stores/stores.dart';

class AppPage extends HookConsumerWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final currentProfile = ref.watch(currentProfileProvider);

    final GlobalKey<ScaffoldState> scaffold = useMemoized(() => GlobalKey());

    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        title: n.Text('Twitter in Naritai')..color = Colors.black,
        leading: n.Image.network(currentProfile!.image)
          ..rounded
          ..m = 8
          ..useGesture(
            tap: () {
              scaffold.currentState!.openDrawer();
            },
          ),
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: n.Icon(Icons.add),
        onPressed: () {
          context.vRouter.to("/tweet");
        },
      ),
      body: const Center(
        child: Text('App'),
      ),
    );
  }
}
