import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../res/numerical_vals.dart';
import '../components/event_card.dart';

class ViewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add reminder'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          EventCard(),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Set Reminder')),
              ElevatedButton(onPressed: () {}, child: Text('View Location')),
            ],
          )
        ],
      )),
    );
  }
}
