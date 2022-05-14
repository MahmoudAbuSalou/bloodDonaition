
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../Modules/home/homePage/homePage.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  HomeCubit get(context)=>BlocProvider.of(context);

  int indexScreen = 1;
  List<Widget>screen=[
    HomePage(),
    HomePage(),
    HomePage(),
  ];


  void changeScreen(int index){
    indexScreen = index;
    emit(ChangeHomeScreen());
  }
}
