import 'package:flutter/material.dart';
import 'package:thrift_app/ui/components/event_card.dart';
import 'package:thrift_app/ui/screens/view_post.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          child: EventCard(),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViewPost()));
          },
        ),
        GestureDetector(
          child: EventCard(),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViewPost()));
          },
        ),
        GestureDetector(
          child: EventCard(),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ViewPost()));
          },
        ),
      ],
    );
  }
}
