import 'package:flutter/material.dart';

import 'package:signin_example/src/sign_up/sign_up_view.dart';

import 'package:signin_example/src/welcome/welcome_view.dart';

class SignUpApp extends StatelessWidget {
  SignUpApp({
    Key? key
  }) : super(key: key);

  final ColorScheme _colorScheme = ColorScheme.fromSwatch().copyWith(
    primary: Colors.indigo,
    secondary: Colors.indigoAccent,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: "app",
      title: "Sign Up App",
      theme: ThemeData().copyWith(
        colorScheme: _colorScheme
      ),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: _colorScheme
      ),
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
