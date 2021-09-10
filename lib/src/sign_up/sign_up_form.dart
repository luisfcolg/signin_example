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
  final _formKey = GlobalKey<FormState>();

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  InputDecoration _getDecoration(String text) {
    return InputDecoration(
      hintText: text,
      border: const OutlineInputBorder(),
      filled: true,
    );
  }

  String? _validateField(value) {
    if(value == null || value.isEmpty || value.length < 5) {
      return "Please enter more than 5 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedProgressIndicator(value: _formProgress,),
          Text("Sign up", style: Theme.of(context).textTheme.headline4,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: _getDecoration("First name"),
              validator: _validateField
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: _getDecoration("Last name"),
              validator: _validateField
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: _getDecoration("Username"),
              validator: _validateField
            ),
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(horizontal: 20.0)),
              foregroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.disabled) ? null : Colors.white),
              backgroundColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.disabled) ? null : Theme.of(context).colorScheme.primary),
            ),
            child: const Text("Sign up"),
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                _showWelcomeView();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Invalid form"))
                );
              }
            }
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
