import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';
import 'package:todo/Features/home/presentation/cubits/%20get_category_tasks/get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(
    this.homeRepo,
  ) : super(GetCategoriesInitial());

  HomeRepo homeRepo;

  Future<List<TaskCategoryModel>> getCategories({
    required int category,
  }) async {
    emit(GetCategoriesLoading());
    try {
      final categories = await homeRepo.getCategories();
      emit(GetCategoriesSuccess(categories: categories));

      return categories;
    } catch (e) {
      emit(GetCategoriesError(message: e.toString()));
      return [];
    }
  }
}
