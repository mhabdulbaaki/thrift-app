import 'package:flutter/material.dart';
import 'package:thrift_app/res/string_values.dart';

class Settings extends StatelessWidget {
  final List<String> _actions = [kReminders, kResetPassword, kLogout];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(),
          Divider(
            height: 3,
          ),
          Expanded(
            // flex: 3,
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    TextButton(onPressed: () {}, child: Text(_actions[index])),
                separatorBuilder: (context, index) => Divider(),
                itemCount: _actions.length),
          )
        ],
      ),
    );
  }
}
