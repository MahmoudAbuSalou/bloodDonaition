part of 'all_post_cubit.dart';

@immutable
abstract class AllPostState {}

class AllPostInitial extends AllPostState {}

class GetPostLoading extends AllPostState{}
// ignore: must_be_immutable
class GetPostSuccessfully extends AllPostState{
  Post post;
  GetPostSuccessfully({required this.post});
}
// ignore: must_be_immutable
class GetPostError extends AllPostState{
  String Error;
  GetPostError({required this.Error});
}
