import 'package:bloc/bloc.dart';
import 'package:blood_donation_project/cubit/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(RegisterState initialState)
      : super(RegisterInitialState());
  IconData suffx = Icons.visibility_outlined;
  bool isPassword = true;
  bool isSelected1 = false;
  bool isSelected2 = false;
  List isSel=[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List <GroupBlood> list=[];

 // LoginModel loginModel;

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String email,
      required password,
      required name,
      required phone}) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: '', data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    }).then((value) {
      print(value.data);
   //   loginModel = LoginModel.fromJson(value.data);

      //print(value.data);

      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error));
      print(error.toString());
    });
  }

  void changePasswordIcon() {
    isPassword = !isPassword;
    if (isPassword) {
      suffx = Icons.visibility_outlined;
      emit(RegisterChangePasswordIcon());
    } else {
      suffx = Icons.visibility_off_outlined;
      emit(RegisterChangePasswordIcon());
    }
  }

  void changeelectedGroupBlood(int index) {
    // isSel= [
    //   false,
    //   false,
    //   false,
    //   false,
    //   false,
    //   false,
    //   false,
    //   false,
    // ];
    //isSel[index] = !isSel[index];
    list.forEach((element) {
      element.isSelected=false;
    });
    list[index].isSelected=!list[index].isSelected;

    emit(RegisterChangeSelectedGroupBlood());

  }

}
