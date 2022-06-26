part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class ChangeIconPassResetScreen extends AppState {}
class checkNet extends AppState {}
class getLocationError extends AppState {
  final error;

  getLocationError({this.error});


}
class getLocationSuccess extends AppState {
  final location;

  getLocationSuccess({this.location});

}
class getLocationLoading extends AppState {}
class genPinLoading extends AppState {}


class genPinSuccess extends AppState {
  final Pin pin;

  genPinSuccess({required this.pin});


}
class genPinError extends AppState {
  final error;

  genPinError({this.error});
}
class deleteUserLoading extends AppState {}
class ChangePasswordLoading extends AppState {}
class ChangePasswordSuccess extends AppState {}
class ChangePasswordError extends AppState {

  final error;

  ChangePasswordError({this.error});
}
class deleteUserSuccess extends AppState {}
class deleteUserError extends AppState {
  final error;

  deleteUserError({this.error});
}

/// Convert Latlong To String
class ConvertLocationLoading extends AppState {}
class ConvertLocationSuccess extends AppState {}
class ConvertLocationError extends AppState {

  final error;

  ConvertLocationError({this.error});
}
