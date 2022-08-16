import 'dart:async';

import 'package:blood_donation_project/Models/user/User_Respnse.dart';
import 'package:blood_donation_project/cubit/UsenManagmentCubits/Register/register_cubit/register_states.dart';

import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';

import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';

import 'package:geocoding/geocoding.dart';
import 'package:google_geocoding/google_geocoding.dart';

import '../../../../Models/user/userModel.dart';
import '../../../../shared/network/end_point.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(RegisterState initialState) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  //////////////////////////

/////////////////////////////
  void signUp({required UserModel user}) async{

    late UserResponse userModel;

    emit(RegisterLoadingState());
    try {

      final response = await DioHelper.postData(
        url: Urls.singupUrl,

        data: user.toJson(),
      );

      userModel = UserResponse.fromJson(response.data);

      if(userModel.status=="true"){
        emit(RegisterSuccessState(userModel: userModel));
        AppSharedPreferences.saveToken(userModel.token!);
        AppSharedPreferences.saveEmail(userModel.user!.email);
        AppSharedPreferences.saveAddress(userModel.user!.address);
        AppSharedPreferences.saveBlood_type(userModel.userprofile!.bloodType);
        AppSharedPreferences.saveBirthDate(userModel.user!.birthDate);
        AppSharedPreferences.saveGender(userModel.userprofile!.gender);
        AppSharedPreferences.savePhone(userModel.user!.phone.toString());
        AppSharedPreferences.saveWeight(userModel.userprofile!.weight);
        AppSharedPreferences.saveName(userModel.user!.name);
        print(userModel.user!.userId!);
        AppSharedPreferences.saveUserId(userModel.user!.userId!);

      }
      else
        emit(RegisterErrorState(error: userModel.message));

    } catch (error) {
      if (error is DioError) {

        emit(RegisterErrorState(error: 'Error'));
      } else {

        emit(RegisterErrorState(error: error.toString()));
      }
    }
  }

}
//Mahmoud
