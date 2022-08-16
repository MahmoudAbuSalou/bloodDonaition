part of 'all_post_cubit.dart';

@immutable
abstract class AllPostState {}

class AllPostInitial extends AllPostState {}

class GetPostLoading extends AllPostState {}

class GetPostNormalEmpty extends AllPostState {}

class GetPostEmergencyEmpty extends AllPostState {}

// ignore: must_be_immutable
class GetPostSuccessfully extends AllPostState {
  List<Data> normal;
  List<Data> Emergency;
  GetPostSuccessfully({required this.normal, required this.Emergency});
}


// ignore: must_be_immutable
class GetPostError extends AllPostState {
  String Error;

  GetPostError({required this.Error});
}
// ignore: must_be_immutable



