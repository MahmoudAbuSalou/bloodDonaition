import 'package:blood_donation_project/Models/donation/acceptance_rate_model.dart';
import 'package:blood_donation_project/Models/donation/donors_model.dart';
import 'package:blood_donation_project/Models/post/Post.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPostsCubit extends Cubit<MyPostsStates> {
  MyPostsCubit() : super(MyPostsInitialState());

  static MyPostsCubit get(context) => BlocProvider.of(context);

  late Post myPostModel;
  List<Data> myPosts = []; // To Store MyPosts

  getMyPosts() async {
    emit(GetMyPostLoadingState());
    await DioHelper.getData(
      url: Urls.userPosts,
      token:AppSharedPreferences.getToken,
    ).then((value) {
      myPostModel = Post.fromJson(value.data);
      print("Status IS: ==> " + value.data["status"]);
      myPostModel.data?.forEach((element) {
        myPosts.add(element);
      });
      emit(GetMyPostSuccessfullyState(emergency_normal: myPosts));
    }).catchError((error) {
      print(error.toString());
      emit(GetMyPostErrorState(Error: error));
    });
  }

  late DonorsModel donorsModel;
  List<DataModel> dataModel = [];

  getDonors(int postId) async {
    dataModel = [];
    emit(GetDonorsLoadingState());
    await DioHelper.getData(
            url: Urls.getDonors + postId.toString(),
            token: AppSharedPreferences.getToken
    )
        .then((value) {
      donorsModel = DonorsModel.fromJson(value.data);
      donorsModel.data!.forEach((element) {
        dataModel.add(element);
      });
      print('DataMode Length Is =====>');
      print(dataModel.length);
      emit(GetDonorsSuccessState(donors: dataModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetDonorsErrorState(Error: error));
    });
  }

  late AcceptanceRateModel acceptanceRateModel;

  acceptanceRate({
    required int acceptanceRate,
    required int? postID,
  }) async {
    emit(AcceptanceRateLoadingState());

    await DioHelper.postData(
            url: Urls.acceptanceRate,
            data: {
              'acceptance_rate': acceptanceRate,
              'post_id': postID,
            },
            token: AppSharedPreferences.getToken)
        .then((value) {
      print(value.data);
      acceptanceRateModel = AcceptanceRateModel.fromJson(value.data);
      print('acceptance Rate Message Is: ');
      print(acceptanceRateModel.message);
      showToast(
          msg: 'تم إرسال طلب التبرُّع بنجاح, شكراً لك❤️',
          state: ToastState.SUCCESS);
      emit(AcceptanceRateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AcceptanceRateErrorState(Error: error.toString()));
    });
  }
}
