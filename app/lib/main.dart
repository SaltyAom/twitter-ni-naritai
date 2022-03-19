import 'package:app/pages/sign_mail.dart';
import 'package:flutter/material.dart';

import 'package:vrouter/vrouter.dart';
import 'package:app/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
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
        VWidget(
          path: '/',
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
