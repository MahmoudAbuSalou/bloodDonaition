import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/post/Post.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'all_post_state.dart';

class AllPostCubit extends Cubit<AllPostState> {
  AllPostCubit() : super(AllPostInitial());


  static  AllPostCubit get(context) => BlocProvider.of(context);

  late Post post;
  int pageCount = 0;

  getPost() async {
    try {
      //192.168.43.59
      //http://192.168.183.177:3000/api//home/getAll/1
      pageCount++;
      emit(GetPostLoading());

      final response = await DioHelper.getData(
        url: Urls.getPOST + pageCount.toString(),
        token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjU3MTg0OTcwfQ.BOdbtbomzcq-7DV2vfav4hn2HVUbF_luaLptlFw7yLg",
      );

      post = Post.fromJson(response.data);

      emit(GetPostSuccessfully(post: post));
    } catch (err) {
      print(err);
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(GetPostError(Error: err.toString()));
    }
  }
}
