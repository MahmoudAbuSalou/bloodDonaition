import 'package:blood_donation_project/Models/post/Post.dart';
import 'package:blood_donation_project/cubit/search_cubit/cubit/search_states.dart';
import 'package:blood_donation_project/shared/network/end_point.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);



  Post searchModel = new Post();
  search(String text) async {
    emit(SearchLoadingState());
    await DioHelper.postData(
      url: Urls.search,
      data: {
        'value': text
      },
      token: AppSharedPreferences.getToken
    ).then((value) {
      searchModel = Post.fromJson(value.data);
      print(value.data['message']);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
