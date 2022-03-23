import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class AccountStyles {
  static n.ListTile tile(String title) => n.ListTile()
    ..title = Text(title)
    ..dense = true
    ..textColor = Colors.blue
    ..useParent(
      (v) => Theme(
        child: v,
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.blue.shade50,
        ),
      ),
    );

  static n.ListTile profileTile(User user) => n.ListTile()
    ..useLeading(
      () => n.Image.network(
        user.image.isNotEmpty
            ? user.image
            : "https://pbs.twimg.com/profile_images/1501586627906338818/0WKZDMPZ_400x400.jpg",
      )
        ..w = 40
        ..h = 40
        ..rounded,
    )
    ..useTitle(() => n.Text(user.name)..w600)
    ..useSubtitle(
      () => n.Text("@${user.alias}")..color = Colors.grey.shade600,
    )
    ..dense = true
    ..px = 16
    ..py = 0
    ..h = 66;
}
