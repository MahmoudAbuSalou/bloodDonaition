import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../Models/post/Post.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'all_post_state.dart';

class AllPostCubit extends Cubit<AllPostState> {
  AllPostCubit() : super(AllPostInitial());

  static AllPostCubit get(context) => BlocProvider.of(context);
  RefreshController refreshController1 =
      RefreshController(initialRefresh: false);

  late Post post;
  late List<Data> normal = [];
  List<Data> Emergency = [];



  int pageCount = 1;

  getPost() async {
    normal = [];
    Emergency = [];
    try {
      emit(GetPostLoading());
      final response = await DioHelper.getData(
        url: Urls.getPOST + pageCount.toString(),
      );
      post = Post.fromJson(response.data);
      post.data?.forEach(
        (element) {
          if (element.postType == true) {
            normal.add(element);
          }
          if (element.postType == false) {
            Emergency.add(element);
          }
        },
      );

      refreshController1.loadComplete();
      print("Normal Length Is: ");
      print(normal.length);
      print("Emergency Length Is: ");
      print(Emergency.length);

      emit(GetPostSuccessfully(normal: normal, Emergency: Emergency));
    } catch (err) {
      refreshController1.loadFailed();
      print(err);
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(GetPostError(Error: err.toString()));
    }
  }
  int getCount(int size) {
    int count = 1;
    if (size <= 10) {
      count = 1;
    } else if (size > 10 && size <= 20) {
      count = 2;
    } else if (size > 20 && size <= 30) {
      count = 3;
    } else if (size > 30 && size <= 40) {
      count = 4;
    } else if (size > 40 && size <= 50) {
      count = 5;
    }
    return count;
  }
}
