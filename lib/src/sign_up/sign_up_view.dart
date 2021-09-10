import 'package:flutter/material.dart';

import 'package:signin_example/src/sign_up/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  static const routeName = "/sign_up";

  const SignUpView({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 400.0,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
