import 'package:blood_donation_project/Models/profile/profile_Model.dart';

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

class GetUserProfileLoadingState extends ProfileState{}

class GetUserProfileSuccessState extends ProfileState{
  final ProfileModel profileModel;

  GetUserProfileSuccessState(this.profileModel);
}

class GetUserProfileErrorState extends ProfileState{
  final String error;

  GetUserProfileErrorState(this.error);

}

