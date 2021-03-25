import 'package:flutter/material.dart';
import 'package:thrift_app/ui/screens/create_post.dart';
import 'package:thrift_app/ui/screens/created_posts.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Container(
              child: Placeholder(),
              width: width / 3,
              height: width / 3,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('title here',
                      style: Theme.of(context).textTheme.headline5),
                  Text(
                    'Lorem Ipsum has been the industrys standard dumm',
                    maxLines: 4,
                    overflow: TextOverflow.fade,
                    //softWrap: true,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Edit Post')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
