import 'package:blood_donation_project/cubit/search_cubit/cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  void search(String text){
    emit(SearchLoadingState());
  }

}