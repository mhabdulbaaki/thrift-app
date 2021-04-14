import 'package:flutter/material.dart';
import 'package:thrift_app/res/numerical_vals.dart';
import 'package:thrift_app/res/string_values.dart';
import 'package:thrift_app/ui/screens/view_reminders.dart';
import 'package:thrift_app/utilities/decoration.dart';

class Settings extends StatelessWidget {
  final buttonStyle = ButtonStyle(alignment: Alignment.centerLeft);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            decoration: iDecoration('change location', borderRadius: 40),
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Expanded(
            child: ListView(
              children: [
                Divider(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewReminders()));
                    },
                    child: Text(kReminders),
                    style: buttonStyle),
                Divider(),
                TextButton(
                    onPressed: () {},
                    child: Text(kResetPassword),
                    style: buttonStyle),
                Divider(),
                TextButton(
                    onPressed: () {}, child: Text(kLogout), style: buttonStyle),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
