

import 'package:blood_donation_project/Models/user/User_Respnse.dart';
import 'package:blood_donation_project/Models/user/userModel.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
   UserResponse userModel;


  RegisterSuccessState({required this.userModel});
}

class RegisterErrorState extends RegisterState {
  String  error;

  RegisterErrorState({required this.error});

}


