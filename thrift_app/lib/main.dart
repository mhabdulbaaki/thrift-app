import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrift_app/ui/screens/home.dart';

import 'cubit/screentab_cubit.dart';

const String kAppTitle = 'Thrift Shop';
const String kAppBarTitle = 'Upcoming Events';
void main() {
  runApp(ThriftApp());
}

class ThriftApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScreentabCubit>(create: (context) => ScreentabCubit()),
      ],
      child: MaterialApp(
        title: kAppTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
