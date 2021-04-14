import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile(
      {@required this.width,
      @required this.buttonAction,
      @required this.buttonTitle});

  final double width;
  final String buttonTitle;
  final Function buttonAction;

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
                  ElevatedButton(
                      onPressed: buttonAction, child: Text(buttonTitle)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
