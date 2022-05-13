import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'blood_state.dart';

class BloodCubit extends Cubit<BloodState> {
  BloodCubit() : super(BloodInitial());
  BloodCubit get(context)=> BlocProvider.of(context);

  int currentIndex1 = 0;
  int currentIndex2 = 0;
  void changeTypeBlood(int index){
    if(index!=5 && index != 6){
      currentIndex1 = index;
    }
    else{
      currentIndex2 = index;
    }


    emit(ChangeTypeBlood());
  }




}
