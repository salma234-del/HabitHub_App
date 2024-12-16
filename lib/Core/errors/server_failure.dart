import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromFirebaseAuthException(String message) {
    switch (message) {
      case 'invalid-email':
        return ServerFailure(errorMessage: 'Invalid Email');
      case 'user-disabled':
        return ServerFailure(errorMessage: 'User Disabled');
      case 'user-not-found':
        return ServerFailure(errorMessage: 'User Not Found');
      case 'wrong-password':
        return ServerFailure(errorMessage: 'Wrong Password');
      case 'email-already-in-use':
        return ServerFailure(errorMessage: 'Email Already In Use');
      case 'weak-password':
        return ServerFailure(errorMessage: 'Weak Password');
      case 'network-request-failed':
        return ServerFailure(
            errorMessage:
                'No Internet Connection, Please Check Your Connection and Try Again');
      case 'invalid-credential':
        return ServerFailure(errorMessage: 'Invalid Email or Password');
      default:
        return ServerFailure(
            errorMessage: 'Something Went Wrong, Try Again Later');
    }
  }
}
