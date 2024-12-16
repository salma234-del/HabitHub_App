import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/Core/errors/failure.dart';
import 'package:todo/Core/errors/server_failure.dart';
import 'package:todo/Core/services/firebase_auth_service.dart';
import 'package:todo/Core/utils/constants.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failure, User>> signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      final User? firebaseUser =
          await firebaseAuthService.signUpWithEmailAndPassword(
        name: fullName,
        email: email,
        password: password,
      );
      if (firebaseUser != null) {
        return Right(firebaseUser);
      } else {
        return Left(ServerFailure(errorMessage: 'Register failed.'));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> sendVerifyEmail({required String email}) async {
    try {
      await firebaseAuthService.verifyEmail();
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> signIn(
      {required String email, required String password}) async {
    try {
      final User? firebaseUser =
          await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (firebaseUser != null) {
        // add to users collection
        // check if user is exist
        final userDoc = await firestore
            .collection(usersCollection)
            .doc(firebaseUser.uid)
            .get();
        if (!userDoc.exists) {
          await firestore
              .collection(usersCollection)
              .doc(firebaseUser.uid)
              .set({
            'fullName': firebaseUser.displayName,
            'email': firebaseUser.email,
            'id': firebaseUser.uid,
            'image': '',
          }, SetOptions(merge: true));
        }
        return Right(firebaseUser);
      } else {
        return Left(ServerFailure(errorMessage: 'Login failed.'));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await firebaseAuthService.resetPassword(email: email);
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await firebaseAuthService.signOut();
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(ServerFailure.fromFirebaseAuthException(e.code));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
