part of 'error_check_cubit.dart';

@immutable
abstract class ErrorCheckState {}

class ErrorCheckInitial extends ErrorCheckState {}

class InternetDisconnected extends ErrorCheckState {}

class InternetConnected extends ErrorCheckState {}

class LocationEnabled extends ErrorCheckState {}

class LocationError extends ErrorCheckState {
  final String errorMessage;
  LocationError({@required this.errorMessage});
}
