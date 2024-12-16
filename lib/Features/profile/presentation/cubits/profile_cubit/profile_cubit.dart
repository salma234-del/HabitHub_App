import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Core/services/firebase_auth_service.dart';
import 'package:todo/Core/utils/functions/pick_image.dart';
import 'package:todo/Features/profile/data/models/user_model.dart';
import 'package:todo/Features/profile/data/repos/profile_repo.dart';
import 'package:todo/Features/profile/presentation/cubits/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  ProfileRepo profileRepo;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String imageUrl = '';
  String id = '';

  File? image;

  String imagePath = '';
  Future<void> imagePick() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      image = pickedImage;
      imagePath = pickedImage.path;
      emit(ProfileImagePicked(image: pickedImage));
    }
  }

  Future<void> getUser() async {
    emit(ProfileLoading());
    final result = await profileRepo.getUser();
    result
        .fold((error) => emit(ProfileFailure(errorMessage: error.errorMessage)),
            (user) {
      fullNameController.text = user.fullName;
      emailController.text = user.email;
      imageUrl = user.image;
      id = user.id;
      emit(ProfileSuccess(user: user));
    });
  }

  Future<void> updateUser() async {
    emit(UpdateProfileLoading());
    final result = await profileRepo.updateUser(
      user: UserModel(
        id: FirebaseAuthService().currentUser!.uid,
        fullName: fullNameController.text,
        email: emailController.text,
        image: imageUrl,
      ),
    );
    result.fold(
      (error) => emit(UpdateProfileFailure(errorMessage: error.errorMessage)),
      (_) => emit(UpdateProfileSuccess()),
    );
  }
}
