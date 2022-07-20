import 'package:bloc/bloc.dart';
import 'package:blood_donation_project/Modules/profile/profile_cubit/profile_state.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/local/cachehelper.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context)=> BlocProvider.of(context);


  late double value_slider=60;
  void changValue(double value){

    value_slider=value;
    emit(ChangSliderState());
  }



}