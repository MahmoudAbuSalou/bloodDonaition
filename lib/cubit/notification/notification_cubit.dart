import 'package:blood_donation_project/Models/notification/notification_model.dart';
import 'package:blood_donation_project/Models/token_phone/token_model.dart';
import 'package:blood_donation_project/cubit/notification/notification_states.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/local/cachehelper.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit() : super(SendNotificationLoadingState());

  static NotificationCubit get(context) => BlocProvider.of(context);


  TokenPhone? tokenPhone;

  String message = "";
  sendNotification({
    required String tokenPh,
    required String title,
    required String body,
  }) {
    emit(SendNotificationLoadingState());



    DioHelper.postData(
      url: Urls.notification,
      token:
          'key=AAAApcu0bnM:APA91bFlWsydukk1_g9ZdRIzn2Msu8MyUpV1wwKKczmbec8zJXtDZluKk0auHty44sFRYUhq9r6xBW-GPTMftkoGBVCOj8HLtVaQZwkIZwAs4MDqHEpBuzOVtArnhmdNuRHgNm0LhU9y',
      data: {
        'to': tokenPh,
        'notification': {'title': title, 'body': body},
      },
    ).then((value) async {
      print('Data Here>>>>>>>>>>>>>>:');
      print(value.data);
      emit(SendNotificationSuccessState());
    }).catchError((error) {
      print("+++++++++++++++++++++++++++HERE");
      print(error.toString());
      emit(SendNotificationErrorState(error.toString()));
    });
  }

  getTokenPh(id) {
    emit(GetTokenPhoneLoadingState());
    DioHelper.getData(
      url: Urls.tokenPh + '$id',
    ).then((value) {
      tokenPhone = TokenPhone.fromJson(value.data);
      print(value.data);
      emit(GetTokenPhoneSuccessState());
    }).catchError((error) {
      print(error.data);
      emit(GetTokenPhoneErrorState(error.toString()));
    });
  }




}
