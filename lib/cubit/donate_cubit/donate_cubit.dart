import 'package:blood_donation_project/Models/donation/donors_model.dart';
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
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjYwMDE4ODA5fQ.gNJ8qkA1Gc-EZXnkDWWll40jKGqTLliTilf7dY9xSqc',
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
  List<DataMode> dataMode = [];

  getDonors(int postId) async {
    emit(GetDonorsLoadingState());
    await DioHelper.getData(
        url: Urls.getDonors + postId.toString(),
        token:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjYwMDIwNjkyfQ.wW3orrn_eojGAw3RXnY8yWPFbj72BZxZDFJjsd8gnCo')
        .then((value) {
      donorsModel = DonorsModel.fromJson(value.data);
      donorsModel.data!.forEach((element) {
        dataMode.add(element);
      });
      print('DataMode Length Is =====>');
      print(dataMode.length);
      emit(GetDonorsSuccessState(donors: dataMode));
    }).catchError((error) {
      print(error.toString());
      emit(GetDonorsErrorState(Error: error));
    });
  }
}
