import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thrift_app/ui/components/event_tile.dart';

const kEditPost = 'Edit Post';

class CreatedPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    void editPost() {
      //ToDo: replace container with route
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Container()));
    }

    return ListView(
      children: [
        EventTile(
          width: width,
          buttonAction: editPost,
          buttonTitle: kEditPost,
        ),
        EventTile(
          width: width,
          buttonAction: editPost,
          buttonTitle: kEditPost,
        ),
        EventTile(
          width: width,
          buttonAction: editPost,
          buttonTitle: kEditPost,
        ),
      ],
    );
  }
}
