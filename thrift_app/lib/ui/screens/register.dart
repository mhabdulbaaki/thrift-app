import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thrift_app/res/numerical_vals.dart';
import 'package:thrift_app/res/string_values.dart';
import 'package:thrift_app/utilities/decoration.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final onTapRecognizer = TapGestureRecognizer()
    ..onTap = () {
      //
    };

  @override
  void dispose() {
    onTapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kSignUp),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(text: 'have an account already?   '),
                        TextSpan(
                            recognizer: onTapRecognizer,
                            text: 'Login',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ))
                      ])),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  TextFormField(
                    decoration: authDecoration(kEmail),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  TextFormField(
                    decoration: authDecoration(kPassword),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text(kSignUp)),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 3,
                          endIndent: 5,
                        ),
                      ),
                      Text('continue with'),
                      Expanded(
                        child: Divider(
                          thickness: 3,
                          indent: 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.google,
                          size: 35,
                        ),
                        onTap: () async {},
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.apple,
                          size: 35,
                        ),
                        onTap: () async {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
