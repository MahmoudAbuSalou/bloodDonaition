import 'package:blood_donation_project/Models/notification/notification_model.dart';
import 'package:blood_donation_project/Models/token_phone/token_model.dart';
import 'package:blood_donation_project/cubit/notification/notification_states.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit() : super(SendNotificationLoadingState());

  static NotificationCubit get(context) => BlocProvider.of(context);

  late NotificationModel notificationModel;

  TokenPhone? tokenPhone;

  sendNotification({
    required String tokenPh,
    required String title,
    required String body,
  }) {
    emit(SendNotificationLoadingState());

    DioHelper.postData(
        url: Urls.notification,
        token:
            'AAAApcu0bnM:APA91bFlWsydukk1_g9ZdRIzn2Msu8MyUpV1wwKKczmbec8zJXtDZluKk0auHty44sFRYUhq9r6xBW-GPTMftkoGBVCOj8HLtVaQZwkIZwAs4MDqHEpBuzOVtArnhmdNuRHgNm0LhU9y',
        key: 'key=',
        data: {
          'to': tokenPh,
          'notification': {'title': title, 'body': body},
        }).then((value) async {
      notificationModel = await NotificationModel.fromJson(value.data);

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
      //token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjU1MTM3NDA0fQ.tM7A-DNAouIYF8R4CDuAusi6OuH5qRMJkAp0VHCqkac'
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
