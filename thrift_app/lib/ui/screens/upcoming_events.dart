import 'package:flutter/material.dart';
import 'package:thrift_app/res/numerical_vals.dart';
import 'package:thrift_app/ui/components/event_card.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: ,
        // onTap: ,

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      appBar: AppBar(
        title: Text('Up coming events'),
      ),
      body: ListView(
        children: [EventCard(), EventCard(), EventCard()],
      ),
    );
  }
}
