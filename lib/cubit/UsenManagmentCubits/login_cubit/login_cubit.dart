
import 'package:blood_donation_project/Models/user/User_Respnse.dart';
import 'package:blood_donation_project/Models/user/userModel.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Modules/home/homePage/homePage.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/appSharedPrefernce.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit( ) : super(LoginInitialState());
  IconData suffx = Icons.visibility_outlined;
  bool isPassword = true;
  //LoginModel loginModel;

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required password,context}) async {
    UserResponse userModel;
    emit(LoadingState());
    try {
     final response= await DioHelper.postData(url: Urls.loginUrl, data: {
        'email': email,
        'password': password,
      });
     userModel=UserResponse.fromJson(response.data);

     if(userModel.status=='true'){
     emit(LoginSuccessState());
     AppSharedPreferences.saveToken(userModel.token!);
     AppSharedPreferences.saveEmail(userModel.user!.email);
     AppSharedPreferences.saveAddress(userModel.user!.address);
     AppSharedPreferences.saveBlood_type(userModel.userprofile!.bloodType);
     AppSharedPreferences.saveBirthDate(userModel.user!.birthDate);
     AppSharedPreferences.saveGender(userModel.userprofile!.gender);
     AppSharedPreferences.savePhone(userModel.user!.phone.toString());
     AppSharedPreferences.saveWeight(userModel.userprofile!.weight);
     AppSharedPreferences.saveName(userModel.user!.name);
     if(state is LoginSuccessState)
     {
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
     }
     }
     else{
       final error='Error';
     emit(LoginErrorState(error:'Error'));
     if (state is LoginErrorState){
     showToast(msg:error , state: ToastState.ERROR);
     }
     }
    }
    catch(error) {
      if(error is DioError){
        emit(LoginErrorState(error: 'Error'));
      }
      emit(LoginErrorState(error: error));
     if (state is LoginErrorState){
    showToast(msg: error.toString(), state: ToastState.ERROR);
    }

    }

  }


}
