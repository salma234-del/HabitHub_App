abstract class ResetPassState {}

class ResetPassInitial extends ResetPassState {}
class ResetPassChangeAutovalidateMode extends ResetPassState {}
class ResetPassLoading extends ResetPassState {}
class ResetPassSuccess extends ResetPassState {}
class ResetPassFailure extends ResetPassState {
  final String errorMessage;

  ResetPassFailure({required this.errorMessage});
}
