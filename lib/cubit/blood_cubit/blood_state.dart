part of 'blood_cubit.dart';

@immutable
abstract class BloodState {}

class BloodInitial extends BloodState {}
class ChangeTypeBlood extends BloodState {}

/// Add Request Blood

class AddPostLoading extends BloodState {}
class AddPostSuccess extends BloodState {}
// ignore: must_be_immutable
class AddPostError extends BloodState {
  late String error;
  AddPostError({required this.error});

}