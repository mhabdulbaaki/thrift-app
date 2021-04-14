import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InternetErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/no-connection.json'),
        Text('No internet connection',
            style: Theme.of(context).textTheme.subtitle1),
        ElevatedButton(
            onPressed: () {
              //Todo: reload
            },
            child: Text('try again')),
      ],
    ));
  }
}
