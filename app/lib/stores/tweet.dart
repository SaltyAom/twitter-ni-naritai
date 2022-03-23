import 'package:app/services/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:dio/dio.dart';
import 'package:app/models/mirror_tweet.dart';

final tweetProvider = StateNotifierProvider((_) => TweetState());

class TweetState extends StateNotifier<List<Tweet>> {
  TweetState() : super(<Tweet>[]);

  fetchMore() {
    // dio.get();
  }

  void add(Tweet tweet) {
    state.add(tweet);
  }

  void addAll(List<Tweet> tweets) {
    state.addAll(tweets);
  }
}
