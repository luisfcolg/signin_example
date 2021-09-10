import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  static const routeName = "/welcome";

  const WelcomeView({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome!", style: Theme.of(context).textTheme.headline2,),
      ),
    );
  }
}
