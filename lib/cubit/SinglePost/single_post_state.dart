part of 'single_post_cubit.dart';

@immutable
abstract class SinglePostState {}

class SinglePostInitial extends SinglePostState {}
/// Get Single Post
class GetSinglePostLoading extends SinglePostState{}
// ignore: must_be_immutable
class GetSinglePostSuccessfully extends SinglePostState{
 late SinglePost singlePost;
 GetSinglePostSuccessfully({required this.singlePost});
}
// ignore: must_be_immutable
class GetSinglePostError extends SinglePostState{
  String Error;
  GetSinglePostError({required this.Error});
}


/// UpDate Single Post
class UpDateSinglePostLoading extends SinglePostState{}
// ignore: must_be_immutable
class UpDateSinglePostSuccessfully extends SinglePostState{
  late SinglePost singlePost;
  UpDateSinglePostSuccessfully({required this.singlePost});
}
// ignore: must_be_immutable
class UpDateSinglePostError extends SinglePostState{
  String Error;
  UpDateSinglePostError({required this.Error});
}

/// delete Single Post

class DeleteSinglePostLoading extends SinglePostState{}
// ignore: must_be_immutable
class DeleteSinglePostSuccessfully extends SinglePostState{
  DeleteSinglePostSuccessfully();
}
// ignore: must_be_immutable
class DeleteSinglePostError extends SinglePostState{
  String Error;
  DeleteSinglePostError({required this.Error});
}
