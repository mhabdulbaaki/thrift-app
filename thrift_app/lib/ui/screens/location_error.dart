import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocationErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/location.json'),
          Text(
              'Location is off hellow woarkd akdalkdfjl kjfdka dkakda skdsalfda asd',
              style: Theme.of(context).textTheme.subtitle1),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                //Todo: reload
              },
              child: Text('try again')),
        ],
      ),
    ));
  }
}
