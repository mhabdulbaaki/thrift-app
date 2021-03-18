import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:thrift_app/res/apikey.dart';

class LocationSearchDelegate extends SearchDelegate {
  final googlePlace = GooglePlace(KEY);
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () async {
          // query = '';
          print(query);
        },
        icon: Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Text("Result $index");
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 8.0,
        );
      },
      itemCount: 3,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Text("Suggestion $index");
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 2.0,
        );
      },
      itemCount: 3,
    );
  }
}
