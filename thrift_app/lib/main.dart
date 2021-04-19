import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrift_app/cubit/error_check_cubit.dart';
import 'package:thrift_app/ui/screens/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:thrift_app/ui/screens/internet_error.dart';

import 'cubit/screentab_cubit.dart';

const String kAppTitle = 'Thrift Shop';
const String kAppBarTitle = 'Upcoming Events';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: ".env");
  //get connectivity status
  ConnectivityResult connectionType =
      await (Connectivity().checkConnectivity());

  //get user current location
  //request for permission if location is off or denied.

  print('init app: $connectionType');
  runApp(ThriftApp(
    connectivity: Connectivity(),
    connectionType: connectionType,
  ));
}

class ThriftApp extends StatelessWidget {
  final connectivity;
  final ConnectivityResult connectionType;
  ThriftApp({@required this.connectivity, this.connectionType});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScreentabCubit>(create: (context) => ScreentabCubit()),
        // BlocProvider<ErrorCheckCubit>(
        //     create: (context) => ErrorCheckCubit(connectivity: connectivity)),
        BlocProvider<ErrorCheckCubit>(
            create: (context) => ErrorCheckCubit(connectivity: connectivity)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<ErrorCheckCubit, ErrorCheckState>(
          builder: (context, state) {
            if (state is InternetConnected) {
              return Home();
            } else if (state is ErrorCheckInitial &&
                connectionType == ConnectivityResult.none) {
              return InternetErrorPage();
            } else if (state is ErrorCheckInitial &&
                connectionType != ConnectivityResult.none) {
              return Home();
            } else if (state is InternetDisconnected) {
              return InternetErrorPage();
            }
            print('current app state: $state');

            return Home();
          },
        ),
      ),
    );
  }
}
