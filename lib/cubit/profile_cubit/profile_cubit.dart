import 'package:bloc/bloc.dart';
import 'package:blood_donation_project/Models/profile/profile_Model.dart';
import 'package:blood_donation_project/cubit/profile_cubit/profile_state.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/local/cachehelper.dart';
import '../../Models/user/User_Respnse.dart';
import '../../Models/user/userModel.dart';
import '../../Modules/profile/profile.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  late UserResponse userResponse;
  late ProfileModel profileModel;

  late double value_slider = 60;

  void changValue(double value) {
    value_slider = value;
    emit(ChangSliderState());
  }

  Future<void> updateUserData({
    required context,
    required String name,
    required int phone,
    required String email,
    required String bloodType,
    required int weight,
  }) async {
    emit(UpdateUserProfileLoadingState());

     DioHelper.postData(
        url: Urls.updateProfile,
        token:
           AppSharedPreferences.getToken,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'weight': weight,
          'blood_type': bloodType,
          'gender': "male"
        }).then((value)  {

      userResponse =  UserResponse.fromJson(value.data);

      if (userResponse.status == "true") {
        AppSharedPreferences.saveEmail(userResponse.user!.email);
        AppSharedPreferences.saveBlood_type(userResponse.userprofile!.bloodType);
        AppSharedPreferences.savePhone(userResponse.user!.phone.toString());
        AppSharedPreferences.saveWeight(userResponse.userprofile!.weight);
        AppSharedPreferences.saveName(userResponse.user!.name);
        navigatorTo(context, Profile());
        emit(UpdateUserProfileSuccessState());
      }
      else{
        navigatorTo(context, Profile());
        emit(UpdateUserProfileErrorState( userResponse.message));}
    }).catchError((error) {
       navigatorTo(context, Profile());
      print(error.toString());
      emit(UpdateUserProfileErrorState(error.toString()));
    });
  }

  Future<void> getUserData() async {
    emit(GetUserProfileLoadingState());

    DioHelper.getData(
        url: Urls.getProfile,
        token:AppSharedPreferences.getToken,
   ).then((value)  {

      profileModel =  ProfileModel.fromJson(value.data);

      if (profileModel.status == "true") {
        emit(GetUserProfileSuccessState(profileModel));
      }
      else
        emit(GetUserProfileErrorState( profileModel.message));
    }).catchError((error) {
      print(error.toString());
      emit(GetUserProfileErrorState(error.toString()));
    });
  }
}
