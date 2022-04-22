

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
 // LoginModel loginModelResponse;

  RegisterSuccessState();
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangePasswordIcon extends RegisterState {}
class RegisterChangeSelectedGroupBlood extends RegisterState {}
