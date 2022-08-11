import '../../Models/user/User_Respnse.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState{}
class ProfileSuccessState extends ProfileState{}
class ProfileErrorState extends ProfileState{
  final String error;

  ProfileErrorState(this.error);

}
class ChangSliderState extends ProfileState{}


class UpdateUserProfileLoadingState extends ProfileState{}

class UpdateUserProfileSuccessState extends ProfileState{}

class UpdateUserProfileErrorState extends ProfileState{
  final String error;

  UpdateUserProfileErrorState(this.error);

}

