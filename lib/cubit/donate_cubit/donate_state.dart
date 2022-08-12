import 'package:blood_donation_project/Models/donation/acceptance_rate_model.dart';
import 'package:blood_donation_project/Models/donation/donors_model.dart';
import 'package:blood_donation_project/Models/post/Post.dart';

abstract class MyPostsStates {}

class MyPostsInitialState extends MyPostsStates {}

// MyPosts
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

// All Donors For One Post Of Me

class GetDonorsLoadingState extends MyPostsStates {}

// ignore: must_be_immutable
class GetDonorsSuccessState extends MyPostsStates {
  List<DataMode> donors;

  GetDonorsSuccessState({required this.donors});
}

// ignore: must_be_immutable
class GetDonorsErrorState extends MyPostsStates {
  String Error;

  GetDonorsErrorState({required this.Error});
}

// Acceptance Rate After Press Donate Now

class AcceptanceRateLoadingState extends MyPostsStates {}

// ignore: must_be_immutable
class AcceptanceRateSuccessState extends MyPostsStates {}

// ignore: must_be_immutable
class AcceptanceRateErrorState extends MyPostsStates {
  String Error;

  AcceptanceRateErrorState({required this.Error});
}
