import 'package:flutter/material.dart';

import 'package:signin_example/src/sign_up/animated_progress_indicator.dart';

import 'package:signin_example/src/welcome/welcome_view.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress,),
          Text("Sign up", style: Theme.of(context).textTheme.headline4,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: "First name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: "Last name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: const InputDecoration(hintText: "Username"),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.disabled) ? null : Colors.white),
              backgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.disabled) ? null : Colors.blue),
            ),
            child: const Text("Sign up"),
            onPressed: _formProgress == 1 ? _showWelcomeView : null,
          ),
        ],
      ),
      onChanged: _updateFormProgress,
    );
  }

  void _showWelcomeView() {
    Navigator.pushNamed(context, WelcomeView.routeName);
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController
    ];

    for(final controller in controllers) {
      if(controller.value.text.isNotEmpty)  progress += 1 / controllers.length;
    }

    setState(() {
      _formProgress = progress;
    });
  }
}
