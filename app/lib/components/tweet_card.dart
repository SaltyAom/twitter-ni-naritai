import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

import 'package:app/models/models.dart';
import 'package:app/styles/styles.dart';

class TweetCard extends StatelessWidget {
  const TweetCard({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  final Tweet tweet;

  @override
  build(context) {
    return n.Row([
      n.Image.network(
        tweet.author.profile.image ??
            "https://pbs.twimg.com/profile_images/1501586627906338818/0WKZDMPZ_400x400.jpg",
      )..apply = ProfileStyles.profile,
      n.Column([
        n.Row([
          n.Row([
            n.Text(tweet.author.profile.name)..w500,
            n.Text('@${tweet.author.profile.alias}')
              ..apply = ProfileStyles.alias,
          ])
            ..gap = 6,
          n.IconButton(Icons.more_vert)
            ..iconSize = 18
            ..w = 21
            ..h = 21
            ..p = 0
            ..splashRadius = 1
            ..onPressed = () {},
        ])
          ..mainCenter
          ..spaceBetween,
        n.Text(tweet.content)..fontSize = 16,
      ])
        ..crossStart
        ..gap = 4
        ..flex,
    ])
      ..crossStart
      ..gap = 16
      ..wFull
      ..py = 4;
  }
}
