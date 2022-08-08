//      /=/=/=/=/=/=/=/
//      Al-Rifai Added MyPosts States:

import 'package:blood_donation_project/Models/post/Post.dart';

abstract class MyPostsStates {}

class MyPostsInitialState extends MyPostsStates {}


class GetMyPostLoadingState extends MyPostsStates {}

// ignore: must_be_immutable
class GetMyPostSuccessfullyState extends MyPostsStates {
  List<Data> emergency_normal;

  GetMyPostSuccessfullyState({required this.emergency_normal});
}

// ignore: must_be_immutable
class GetMyPostErrorState extends MyPostsStates {
  String Error;

  GetMyPostErrorState({required this.Error});
}

