import 'package:blood_donation_project/Models/post/Post.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPostsCubit extends Cubit<MyPostsStates> {
  MyPostsCubit() : super(MyPostsInitialState());

  static MyPostsCubit get(context) => BlocProvider.of(context);

  late Post myPostModel;
  List<Data> myPosts = []; // To Store MyPosts That Has Logging with Token

  getMyPosts() async {
    emit(GetMyPostLoadingState());
    await DioHelper.getData(
      url: Urls.userPosts,
      // token: AppSharedPreferences.getToken,
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTY1OTkzOTQ0MH0.L9OVTGXfhzlvx9yga4EXaavoTM-kYIO8plbuUUjxfmQ',
    ).then((value) {
      myPostModel = Post.fromJson(value.data);
      print("Status IS: ==> " + value.data["status"]);
      myPostModel.data?.forEach((element) {
        myPosts.add(element);
      });
      print("FirstName Is :");
      print(myPosts[1].firstName);
      print("MyPosts Length Is :");
      print(myPosts.length);
      emit(GetMyPostSuccessfullyState(emergency_normal: myPosts));
    }).catchError((error) {
      print(error.toString());
      emit(GetMyPostErrorState(Error: error));
    });
  }
}
