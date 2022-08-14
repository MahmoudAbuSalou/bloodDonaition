import 'package:blood_donation_project/Models/SinglePost/SinglePost.dart';
import 'package:blood_donation_project/Models/donation/acceptance_rate_model.dart';
import 'package:blood_donation_project/Models/donation/donors_model.dart';
import 'package:blood_donation_project/Models/post/Post.dart';
import 'package:blood_donation_project/cubit/SinglePost/single_post_cubit.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPostsCubit extends Cubit<MyPostsStates> {
  MyPostsCubit() : super(MyPostsInitialState());

  static MyPostsCubit get(context) => BlocProvider.of(context);

  // ========================================
  // My Posts
  late Post myPostModel;
  List<Data> myPosts = []; // To Store MyPosts
  getMyPosts() async {
    myPosts = [];
    emit(GetMyPostLoadingState());
    await DioHelper.getData(
      url: Urls.userPosts,
      token: AppSharedPreferences.getToken,
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

  // Single Post
  late SinglePost singlePost;

  getSinglePost({required int id}) async {
    try {
      emit(GetSinglePostForDonorsLoading());
      final response = await DioHelper.getData(
        url: Urls.getSinglePOST + id.toString(),
      );
      singlePost = SinglePost.fromJson(response.data);
      emit(GetSinglePostForDonorsSuccessfully(singlePost: singlePost));
    } catch (err) {
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(GetSinglePostForDonorsError(Error: err.toString()));
    }
  }

  // ========================================
  // All Donors on One Post
  late DonorsModel donorsModel;
  List<DataModel> dataModel = [];

  getDonors(int postId) async {
    getSinglePost(id: postId);
    dataModel = [];
    emit(GetDonorsLoadingState());
    await DioHelper.getData(
            url: Urls.getDonors + postId.toString(),
            token: AppSharedPreferences.getToken)
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

  // **************
  confirmDonor(donateId, context) async {
    emit(ConfirmDonorLoadingState());
    if ((singlePost.data!.bloodBagsCollect!) + 1 ==
        singlePost.data!.bloodBags!) {
      await DioHelper.postData(
        url: Urls.confirmDonor + donateId.toString(),
        data: null,
        token: AppSharedPreferences.getToken,
      ).then((value) {
        emit(ConfirmDonorSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ConfirmDonorErrorState(Error: error));
      });
      Navigator.pop(context);
      showToast(
          msg: 'اكتمل هذا المنشور بنجاح, يمكنكم المسهاهمة بعملية آخرى',
          state: ToastState.SUCCESS);
      getMyPosts();
      return;
    }
    await DioHelper.postData(
      url: Urls.confirmDonor + donateId.toString(),
      data: null,
      token: AppSharedPreferences.getToken,
    ).then((value) {
      emit(ConfirmDonorSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ConfirmDonorErrorState(Error: error));
    });
  }

  // **************

  deleteDonor({required int? donateId}) async {
    emit(DeleteDonorLoadingState());
    await DioHelper.postData(
      url: Urls.deleteDonor + donateId.toString(),
      data: null,
      token: AppSharedPreferences.getToken,
    ).then((value) async {
      emit(DeleteDonorSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteDonorErrorState(Error: error));
    });
  }

  // ========================================
  // Donation Process
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
