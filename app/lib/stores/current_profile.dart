import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:app/models/profile.dart';

final currentProfileProvider =
    StateNotifierProvider<CurrentProfileState, Profile?>(
        (_) => CurrentProfileState());

class CurrentProfileState extends StateNotifier<Profile?> {
  CurrentProfileState() : super(null);

  set profile(Profile? profile) {
    state = profile?.copyWith();
  }

  Future<Profile?> loadProfile(Profile profile) async {
    final box = await Hive.openBox<ProfileList>('profileList');
    final profileList = box.get('profileList');

    if (profileList == null) return null;

    final active = profileList.active;
    if (active == null) return null;

    state = profileList.profiles[active];

    return state;
  }
}
