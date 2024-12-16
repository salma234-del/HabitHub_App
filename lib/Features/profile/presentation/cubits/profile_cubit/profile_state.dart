import 'dart:io';
import 'package:todo/Features/profile/data/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure({required this.errorMessage});
}

class ProfileSuccess extends ProfileState {
  final UserModel user;

  ProfileSuccess({required this.user});
}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileFailure extends ProfileState {
  final String errorMessage;

  UpdateProfileFailure({required this.errorMessage});
}

class UpdateProfileSuccess extends ProfileState {}

class ProfileImagePicked extends ProfileState {
  final File image;

  ProfileImagePicked({required this.image});
}
