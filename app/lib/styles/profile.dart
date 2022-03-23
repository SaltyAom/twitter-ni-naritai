import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class ProfileStyles {
  static final profile = n.Image.network("")
    ..w = 48
    ..h = 48
    ..rounded;

  static final name = n.Text("")
    ..fontSize = 18
    ..w600;

  static final alias = n.Text("")..color = Colors.grey.shade500;
}
