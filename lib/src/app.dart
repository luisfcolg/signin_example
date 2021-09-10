import 'package:flutter/material.dart';

import 'package:signin_example/src/sign_up/sign_up_view.dart';

import 'package:signin_example/src/welcome/welcome_view.dart';

class SignUpApp extends StatelessWidget {
  const SignUpApp({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: "app",
      title: "Sign Up App",
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch(routeSettings.name) {
              case SignUpView.routeName:
                return const SignUpView();
              case WelcomeView.routeName:
                return const WelcomeView();
              default:
                return const SignUpView();
            }
          },
        );
      },
    );
  }
}
