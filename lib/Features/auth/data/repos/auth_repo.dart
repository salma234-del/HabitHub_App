import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/Core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp({
    required String fullName,
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> sendVerifyEmail({required String email});
  Future<Either<Failure, User>> signIn(
      {required String email, required String password});
  Future<Either<Failure, void>> resetPassword({required String email});
  Future<Either<Failure, void>> logout();
}
