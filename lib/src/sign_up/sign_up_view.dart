import 'package:flutter/material.dart';

import 'package:signin_example/src/sign_up/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  static const routeName = "/sign_up";

  const SignUpView({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width * 0.4,
          height: screenSize.height * 0.4,
          child: Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: const SignUpForm()
            ),
          ),
        ),
      ),
    );
  }
}
