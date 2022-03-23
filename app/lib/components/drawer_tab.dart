import 'package:flutter/material.dart';

import 'package:niku/namespace.dart' as n;

class DrawerTab extends StatelessWidget {
  const DrawerTab({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  build(context) {
    return n.ListTile()
      ..useLeading(() => n.Icon(icon))
      ..useTitle(() => n.Text(title)
        ..fontSize = 16
        ..w500)
      ..onTap = onTap
      ..py = 4;
  }
}
