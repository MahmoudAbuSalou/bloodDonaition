import 'package:blood_donation_project/Models/SinglePost/SinglePost.dart';

abstract class SinglePostState {}

class SinglePostInitial extends SinglePostState {}

/// Get Single Post
class GetSinglePostLoading extends SinglePostState {}

class GetSinglePostSuccessfully extends SinglePostState {
  late SinglePost singlePost;

  GetSinglePostSuccessfully({required this.singlePost});
}

class GetSinglePostError extends SinglePostState {
  String Error;

  GetSinglePostError({required this.Error});
}

/// UpDate Single Post
class UpDateSinglePostLoading extends SinglePostState {}

class UpDateSinglePostSuccessfully extends SinglePostState {
  late SinglePost singlePost;

  UpDateSinglePostSuccessfully({required this.singlePost});
}

class UpDateSinglePostError extends SinglePostState {
  String Error;

  UpDateSinglePostError({required this.Error});
}

/// delete Single Post

class DeleteSinglePostLoading extends SinglePostState {}

class DeleteSinglePostSuccessfully extends SinglePostState {
  DeleteSinglePostSuccessfully();
}

class DeleteSinglePostError extends SinglePostState {
  String Error;

  DeleteSinglePostError({required this.Error});
}
