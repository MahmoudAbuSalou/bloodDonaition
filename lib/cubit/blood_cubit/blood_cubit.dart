import 'package:blood_donation_project/Models/blood_post/blood_request.dart';
import 'package:blood_donation_project/Modules/home/homePage/homePage.dart';
import 'package:blood_donation_project/cubit/home/all_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_point.dart';
import '../../shared/network/local/appSharedPrefernce.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'blood_state.dart';

class BloodCubit extends Cubit<BloodState> {
  BloodCubit() : super(BloodInitial());

  BloodCubit get(context) => BlocProvider.of(context);

  int currentIndex1 = 0;
  int currentIndex2 = 0;

  void changeTypeBlood(int index) {
    if (index != 5 && index != 6) {
      currentIndex1 = index;
    } else {
      currentIndex2 = index;
    }
    emit(ChangeTypeBlood());
  }

  addBloodPost({required BloodRequest bloodRequest, required context}) async {
    try {
      emit(AddPostLoading());
      final response = await DioHelper.postData(
        url: Urls.AddRequestBlood,
        token: AppSharedPreferences.getToken,
        data: bloodRequest.toJson(),
      );

      showToast(msg: 'تم اضافة طلبك بنجاح..', state: ToastState.SUCCESS);

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      emit(AddPostSuccess());
    } catch (err) {
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(AddPostError(error: err.toString()));
    }
  }
}
