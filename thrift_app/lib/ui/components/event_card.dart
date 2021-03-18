import 'package:flutter/material.dart';
import 'package:thrift_app/res/numerical_vals.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Placeholder(),
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Text('title here'),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Text('event date'),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Text('short details of the upcoming event goes here'),
            ],
          ),
        ),
      ),
    );
  }
}
