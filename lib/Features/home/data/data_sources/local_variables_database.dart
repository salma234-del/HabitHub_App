import 'package:todo/Features/home/data/models/task_category_model.dart';
import 'package:todo/Features/home/data/models/task_model.dart';
import 'package:todo/Features/home/data/repos/home_repo.dart';

class LocalVariablesDatabase implements HomeRepo {
  static final LocalVariablesDatabase _instance =
      LocalVariablesDatabase._private();

  LocalVariablesDatabase._private();

  factory LocalVariablesDatabase() {
    return _instance;
  }

  List<TaskCategoryModel> categoriesList = [
    TaskCategoryModel(
      category: 'ToDo',
      data: [
        // TaskModel(
        //     title: 'go to gym',
        //     body: 'i must go to the gym today',
        //     color: Colors.blue,
        //     date: '04/12',
        //     time: '10:00 PM'),
        // TaskModel(
        //   title: 'test',
        //   body: 'test test',
        //   color: Colors.red,
        //   date: '04/12',
        //   time: '10:00 PM',
        // ),
      ],
    ),
    TaskCategoryModel(category: 'Done', data: []),
    TaskCategoryModel(
      category: 'Deleted',
      data: [
        // TaskModel(
        //   title: 'test',
        //   body: 'test test',
        //   color: Colors.green,
        //   date: '04/12',
        //   time: '10:00 PM',
        // ),
      ],
    ),
    TaskCategoryModel(category: 'All', data: []),
  ];

  @override
  Future<List<TaskCategoryModel>> getCategories() async {
    return categoriesList;
  }

  @override
  Future<void> addToDo({required TaskModel taskModel}) async {
    categoriesList[0].data.add(taskModel);
    categoriesList[3].data.add(taskModel);
  }

  @override
  Future<void> deleteTask({
    required TaskModel taskModel,
    required String category,
    required int taskIndex,
  }) async {
    int categoryIndex =
        categoriesList.indexWhere((element) => element.category == category);
    categoriesList[categoryIndex].data.removeAt(taskIndex);
    categoriesList[2].data.add(taskModel);
  }

  @override
  Future<void> doneTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    int categoryIndex =
        categoriesList.indexWhere((element) => element.category == category);
    categoriesList[categoryIndex].data.removeAt(taskIndex);
    categoriesList[1].data.add(taskModel);
  }

  @override
  Future<void> updateTask({
    required String category,
    required int taskIndex,
    required TaskModel taskModel,
  }) async {
    int categoryIndex =
        categoriesList.indexWhere((element) => element.category == category);
    categoriesList[categoryIndex].data.removeAt(taskIndex);
    categoriesList[0].data.add(taskModel);
  }
}
