import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:app/models/user.dart';

final currentProfileProvider =
    StateNotifierProvider<CurrentUserState, User?>((_) => CurrentUserState());

class CurrentUserState extends StateNotifier<User?> {
  CurrentUserState() : super(null);

  set profile(User? profile) {
    state = profile?.copyWith();
  }

  Future<User?> loadProfile(User profile) async {
    final box = await Hive.openBox<UserList>('profileList');
    final profileList = box.get('profileList');

    if (profileList == null) return null;

    final active = profileList.active;
    if (active == null) return null;

    state = profileList.profiles[active];

    return state;
  }
}
