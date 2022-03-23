import 'package:app/components/components.dart';
import 'package:app/components/tweet_card.dart';
import 'package:app/stores/stores.dart';
import 'package:app/styles/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niku/namespace.dart' as n;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vrouter/vrouter.dart';

import 'package:app/models/models.dart';
import 'package:app/services/dio.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    final alias = context.vRouter.pathParameters['alias'];
    final isLoading = useState(true);

    final profile = useState<Profile?>(null);
    final scrollController = useScrollController();

    useEffect(() {
      main() async {
        final currentProfile = ref.read(currentProfileProvider);

        final res = await dio.get("$api/profile/$alias");

        try {
          final profileData = Profile.fromJsonNonUser(
            json: res.data,
            user: currentProfile!,
          );

          profile.value = profileData;
        } catch (e) {
          // print(e);
        } finally {
          isLoading.value = false;
        }
      }

      main();

      return () {};
    }, []);

    if (isLoading.value) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (alias == null || profile.value == null) {
      return Scaffold(
        appBar: AppBar(),
        body: n.Column([
          n.Text("User not found"),
        ]),
      );
    }

    final totalTweet = profile.value!.user.tweet.length;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: n.Icon(Icons.add),
        onPressed: () {
          context.vRouter.to("/profile-utils/tweet");
        },
      ),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          controller: scrollController,
          child: ProfileBanner(
            scrollController: scrollController,
            name: profile.value!.name,
            totalTweet: totalTweet,
            child: n.Column([
              n.Text(profile.value!.name)
                ..fontSize = 21
                ..w600,
              n.Text("@$alias")
                ..fontSize = 14
                ..w300
                ..color = Colors.grey.shade500
                ..mt = 4,
              if (profile.value!.bio.isNotEmpty)
                n.Text(profile.value!.bio)
                  ..fontSize = 16
                  ..my = 16,
              n.Row([
                n.Button(
                  Text("${profile.value!.user.count.following} following"),
                )
                  ..px = 0
                  ..splash = Colors.transparent,
                n.Button(
                  Text("${profile.value!.user.count.followedBy} followers"),
                )
                  ..px = 0
                  ..splash = Colors.transparent
              ])
                ..my = 12
                ..gap = 16,
              const Divider(),
              n.ListView.separated(
                itemBuilder: (context, index) {
                  final tweet =
                      profile.value!.user.tweet[totalTweet - index - 1];

                  return TweetCard(tweet: tweet);
                },
              )
                ..total = totalTweet
                ..shrinkWrap = true
                ..neverScroll
                ..py = 12
                ..px = 0,
              n.Box()..size = [100, 1000]
            ])
              ..crossStart
              ..p = 16,
          ),
        ),
      ),
    );
  }
}
