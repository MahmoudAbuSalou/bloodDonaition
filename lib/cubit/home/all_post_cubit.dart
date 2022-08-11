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
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  late Post post;

  late List<Data> normal = [];
  List<Data> Emergency = [];
  int pageCount = 0;

  getPost() async {
    try {
      pageCount++;
      emit(GetPostLoading());
      final response = await DioHelper.getData(
        url: Urls.getPOST + pageCount.toString(),
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjU3MTg0OTcwfQ.BOdbtbomzcq-7DV2vfav4hn2HVUbF_luaLptlFw7yLg",
      );

      post = Post.fromJson(response.data);
      post.data?.forEach((element) {
        if (element.postType == true) {
          Emergency.add(element);
        } else {
          normal.add(element);
        }
      });
      refreshController.loadComplete();
      print("Normal Length Is: ");
      print(normal.length);
      print("Emergency Length Is: ");
      print(Emergency.length);

      emit(GetPostSuccessfully(normal: normal, Emergency: Emergency));
    } catch (err) {
      refreshController.loadFailed();
      print(err);
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(GetPostError(Error: err.toString()));
    }
  }
}
