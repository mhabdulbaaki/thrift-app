import 'package:flutter/material.dart';

class LocationSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
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
