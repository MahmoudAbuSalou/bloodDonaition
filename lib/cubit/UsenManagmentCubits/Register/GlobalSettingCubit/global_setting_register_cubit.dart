import 'package:bloc/bloc.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'global_setting_register_state.dart';

class GlobalSettingRegisterCubit extends Cubit<GlobalSettingRegisterState> {
  GlobalSettingRegisterCubit() : super(GlobalSettingRegisterInitial());
  static GlobalSettingRegisterCubit get(context) => BlocProvider.of(context);

  IconData suffx = Icons.visibility_outlined;
  bool isPassword = true;
  int grpValueGen = 0;
  int grpValueWeight = 0;
  List<GroupBlood> list = [];
  int indexG=0;
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
    list.forEach((element) {
      element.isSelected = false;
    });
    indexG=index;
    list[index].isSelected = !list[index].isSelected;

    emit(RegisterChangeSelectedGroupBlood());
  }

  void changeSelectGen(int id) {
    grpValueGen = id;
    emit(RegisterChangeSelectedGender());
  }

  void changeSelectWeight(int id) {
    grpValueWeight = id;
    emit(RegisterChangeSelectedWeight());
  }
}
