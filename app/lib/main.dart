import 'package:app/stores/stores.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:vrouter/vrouter.dart';
import 'package:app/pages/pages.dart';
import 'package:app/models/models.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(ProfileListAdapter());

  runApp(
    const ProviderScope(
      child: TwitterNiNaritai(),
    ),
  );
}

class TwitterNiNaritai extends HookConsumerWidget {
  const TwitterNiNaritai({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    return VRouter(
      title: 'Twitter ni Naritai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      initialUrl: '/',
      routes: [
        VGuard(
          beforeEnter: (vRedirector) async {
            final box = await Hive.openBox<ProfileList>('profileList');
            final profileList = box.get('profileList');

            if (box.isEmpty || profileList == null) {
              box.put(
                'profileList',
                ProfileList(
                  active: null,
                  profiles: [],
                ),
              );

              return vRedirector.to("/sign");
            }

            if (profileList.active == null) {
              vRedirector.to("/sign");
              return;
            }

            final profile = profileList.profiles[profileList.active!];
            ref.read(currentProfileProvider.notifier).profile = profile;
          },
          stackedRoutes: [
            VWidget(
              path: '/',
              widget: const AppPage(),
            ),
          ],
        ),
        VWidget(
          path: '/account',
          widget: const AccountPage(),
          fullscreenDialog: true,
        ),
        VWidget(
          path: '/sign',
          widget: const WelcomePage(),
          stackedRoutes: [
            VWidget(path: '/sign-in', widget: const SignInPage()),
            VWidget(
              path: '/sign-up',
              widget: const SignUpPage(),
              stackedRoutes: [
                VWidget(
                  path: '/sign-mail',
                  widget: const SignMail(),
                  stackedRoutes: [
                    VWidget(
                      path: '/sign-profile',
                      widget: const SignProfile(),
                      stackedRoutes: [
                        VWidget(
                          path: '/sign-complete',
                          widget: const SignComplete(),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
