import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/profile/data/repos/profile_repo.dart';
import 'package:todo/Features/profile/presentation/cubits/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.profileRepo) : super(LogoutInitial());

  ProfileRepo profileRepo;

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await profileRepo.logout();
    result.fold(
      (error) => emit(LogoutFailure(errorMessage: error.errorMessage)),
      (_) => emit(LogoutSuccess()),
    );
  }
}
