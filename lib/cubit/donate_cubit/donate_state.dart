import 'package:blood_donation_project/Models/SinglePost/SinglePost.dart';
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
  List<DataModel> donors;

  GetDonorsSuccessState({required this.donors});
}

// ignore: must_be_immutable
class GetDonorsErrorState extends MyPostsStates {
  String Error;

  GetDonorsErrorState({required this.Error});
}


// Delete Post

class DeletePostLoadingState extends MyPostsStates {}

// ignore: must_be_immutable
class DeletePostSuccessState extends MyPostsStates {}

// ignore: must_be_immutable
class DeletePostErrorState extends MyPostsStates {
  String Error;

  DeletePostErrorState({required this.Error});
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


// Confirm Donor

class ConfirmDonorLoadingState extends MyPostsStates {}

// ignore: must_be_immutable
class ConfirmDonorSuccessState extends MyPostsStates {}

// ignore: must_be_immutable
class ConfirmDonorErrorState extends MyPostsStates {
  String Error;

  ConfirmDonorErrorState({required this.Error});
}




// Delete Donor

class DeleteDonorLoadingState extends MyPostsStates {}

// ignore: must_be_immutable
class DeleteDonorSuccessState extends MyPostsStates {}

// ignore: must_be_immutable
class DeleteDonorErrorState extends MyPostsStates {
  String Error;

  DeleteDonorErrorState({required this.Error});
}


// Get Single Post

class GetSinglePostForDonorsLoading extends MyPostsStates{}

class GetSinglePostForDonorsSuccessfully extends MyPostsStates{
  late SinglePost singlePost;
  GetSinglePostForDonorsSuccessfully({required this.singlePost});
}
class GetSinglePostForDonorsError extends MyPostsStates{
  String Error;
  GetSinglePostForDonorsError({required this.Error});
}



// Update Single Post's Data

class UpdateSinglePostForDonorsLoadingState extends MyPostsStates {}

class UpdateSinglePostForDonorsSuccessfullyState extends MyPostsStates {}
class UpdateSinglePostForDonorsErrorState extends MyPostsStates{
  String Error;
  UpdateSinglePostForDonorsErrorState({required this.Error});
}


