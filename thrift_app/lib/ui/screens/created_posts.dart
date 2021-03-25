import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thrift_app/ui/components/event_tile.dart';

class CreatedPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        EventTile(width: width),
        EventTile(width: width),
        EventTile(width: width),
      ],
    );
  }
}
