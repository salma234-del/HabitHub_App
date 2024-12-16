import 'package:dartz/dartz.dart';
import 'package:todo/Core/errors/failure.dart';
import 'package:todo/Features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, void>> updateUser({required UserModel user});
}
