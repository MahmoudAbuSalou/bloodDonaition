import 'package:bloc/bloc.dart';
import 'package:blood_donation_project/Models/SinglePost/SinglePost.dart';
import 'package:blood_donation_project/Models/SinglePost/updatePost.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/SinglePost/SinglePost.dart';
import '../../Models/SinglePost/SinglePost.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'single_post_state.dart';

class SinglePostCubit extends Cubit<SinglePostState> {
  SinglePostCubit() : super(SinglePostInitial());
    static SinglePost get(context)=>BlocProvider.of(context);

  late SinglePost singlePost;
  late String status ;

  getSinglePost({required  int id}) async {
    try {

      emit(GetSinglePostLoading());
      final response = await DioHelper.getData(
        url: Urls.getSinglePOST + id.toString(),
      );
      singlePost = SinglePost.fromJson(response.data);
      emit(GetSinglePostSuccessfully(singlePost: singlePost));
    } catch (err) {
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(GetSinglePostError(Error: err.toString()));
    }
  }

  deleteSinglePost({required  int id}) async {
    try {

      emit(DeleteSinglePostLoading());
      final response = await DioHelper.postData(
        url: Urls.deleteSinglePOST + id.toString(), data: null,
        token:  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjU3MTg0OTcwfQ.BOdbtbomzcq-7DV2vfav4hn2HVUbF_luaLptlFw7yLg",
      );
      status = response.data['status'];
      if(status == 'true'){
        showToast(msg: 'تم حذف الطلب بنجاح..', state: ToastState.SUCCESS);
      }

      emit(DeleteSinglePostSuccessfully());
    } catch (err) {
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(DeleteSinglePostError(Error: err.toString()));
    }
  }

  updateSinglePost({required UpdateSinglePost updateSinglePost,required int  id}) async {
    try {

      emit(UpDateSinglePostLoading());
      final response = await DioHelper.postData(
        url: Urls.deleteSinglePOST + id.toString(), data: updateSinglePost,
        token:  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjU3MTg0OTcwfQ.BOdbtbomzcq-7DV2vfav4hn2HVUbF_luaLptlFw7yLg",
      );


      status = response.data['status'];
      if(status == 'true'){
        showToast(msg: 'تم تعديل الطلب بنجاح..', state: ToastState.SUCCESS);
        await getSinglePost(id: id);
      }

      emit(UpDateSinglePostSuccessfully(singlePost: singlePost));
    } catch (err) {
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(UpDateSinglePostError(Error: err.toString()));
    }
  }
}
