import 'dart:async';
import 'package:thrift_app/utilities/get_user_current_position.dart';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'error_check_state.dart';

class ErrorCheckCubit extends Cubit<ErrorCheckState> {
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;
  StreamSubscription<Position> positionStream;
  ErrorCheckCubit({@required this.connectivity}) : super(ErrorCheckInitial()) {
    try {
      //subscribe for changes in network connection
      subscription = connectivity.onConnectivityChanged
          .listen((ConnectivityResult result) {
        //if connected to internet
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          print('connected State: $result');
          emit(InternetConnected());
        } else if (result == ConnectivityResult.none) {
          print('disconnected: $result');
          emit(InternetDisconnected());
        }
      });
    } on PlatformException catch (e) {
      print(e);
    }

    //check location permissions
    try {
      positionStream =
          Geolocator.getPositionStream().listen((Position position) {
        print(position == null
            ? 'Unknown'
            : position.latitude.toString() +
                ', ' +
                position.longitude.toString());
      });
    } catch (e) {
      print('error message: $e');
    }
  }

  Future<Position> retrieveCurrentPosition() async {
    try {
      final Position currentPosition = await getUserCurrentPosition();

      print(
          'ur current position: lat ${currentPosition.latitude} lon ${currentPosition.longitude}');
      emit(LocationEnabled(currentPosition: currentPosition));
    } on Error catch (e) {
      print('errorMessage: $e');
      emit(LocationError(errorMessage: e.toString()));
    }
    return null;
  }

  @override
  Future<void> close() {
    subscription.cancel();
    positionStream.cancel();
    return super.close();
  }
}
