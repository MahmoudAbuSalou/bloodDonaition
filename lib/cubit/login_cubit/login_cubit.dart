
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit( ) : super(LoginInitialState());
  IconData suffx = Icons.visibility_outlined;
  bool isPassword = true;
  //LoginModel loginModel;

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required password}) {
    emit(LoadingState());
    DioHelper.postData(url: '', data: {
      'email': email,
      'password': password,
    }).then((value) {
    //  loginModel = LoginModel.fromJson(value.data);
      //print(value.data);

    //  emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error));
      print(error.toString());
    });
  }
  void changePasswordIcon(){
    isPassword = ! isPassword;
   if(isPassword){
     suffx = Icons.visibility_outlined;
     emit(LoginChangePasswordIcon());
   }
   else{
      suffx = Icons.visibility_off_outlined;
     emit(LoginChangePasswordIcon());
   }
  }

}
