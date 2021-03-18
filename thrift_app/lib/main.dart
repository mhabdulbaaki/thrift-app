import 'package:flutter/material.dart';
import 'package:thrift_app/ui/screens/create_post.dart';
import 'package:thrift_app/ui/screens/login.dart';
import 'package:thrift_app/ui/screens/upcoming_events.dart';

const String kAppTitle = 'Thrift Shop';
const String kAppBarTitle = 'Upcoming Events';
void main() {
  runApp(ThriftApp());
}

class ThriftApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: CreatePost(),
      home: UpcomingEvents(),
    );
  }
}
