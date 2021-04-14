import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thrift_app/ui/components/event_tile.dart';

const String kDelete = 'Delete';

class ViewReminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    void removeReminder() {
      //ToDo: implement remove reminder
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Reminders'),
      ),
      body: ListView(
        children: [
          EventTile(
              width: width, buttonAction: removeReminder, buttonTitle: kDelete),
          EventTile(
              width: width, buttonAction: removeReminder, buttonTitle: kDelete),
          EventTile(
              width: width, buttonAction: removeReminder, buttonTitle: kDelete),
          EventTile(
              width: width, buttonAction: removeReminder, buttonTitle: kDelete),
          EventTile(
              width: width, buttonAction: removeReminder, buttonTitle: kDelete),
        ],
      ),
    );
  }
}
