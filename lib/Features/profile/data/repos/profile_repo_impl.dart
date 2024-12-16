import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/Core/errors/failure.dart';
import 'package:todo/Core/errors/server_failure.dart';
import 'package:todo/Core/services/firebase_auth_service.dart';
import 'package:todo/Core/utils/constants.dart';
import 'package:todo/Features/profile/data/models/user_model.dart';
import 'package:todo/Features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      FirebaseAuthService().signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final user = await firestore
          .collection(usersCollection)
          .where('id', isEqualTo: FirebaseAuthService().currentUser!.uid)
          .get();

      return Right(UserModel.fromJson(user.docs.first.data()));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser({required UserModel user}) async {
    try {
      await firestore
          .collection(usersCollection)
          .where('id', isEqualTo: FirebaseAuthService().currentUser!.uid)
          .get()
          .then((value) {
        value.docs.first.reference.update(user.toJson());
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
