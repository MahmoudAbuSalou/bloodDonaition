

abstract class LoginState {}
 class LoginInitialState extends LoginState{}
 class LoadingState extends LoginState{}
 class LoginSuccessState extends LoginState{
 //LoginModel loginModelResponse;
 LoginSuccessState();
 }
 class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);

 }


 class LoginChangePasswordIcon extends LoginState{}
