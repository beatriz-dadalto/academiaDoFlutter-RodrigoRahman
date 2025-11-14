import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/models/total_tasks_model.dart';
import 'package:todo_list_provider/app/models/week_task_model.dart';
import 'package:todo_list_provider/app/services/tasks/task_service.dart';

class HomeController extends DefaultChangeNotifier {
  var filterSelected = TaskFilterEnum.today;
  final TaskService _taskService;
  TotalTasksModel? todayTotalTasks;
  TotalTasksModel? tomorrowTotalTasks;
  TotalTasksModel? weekTotalTasks;
  List<TaskModel> allTasks = [];
  List<TaskModel> filteredTasks = [];
  DateTime? initialDateOfWeek;
  DateTime? selectedDay;
  bool showFinishedTasks = false;

  HomeController({required TaskService taskService})
    : _taskService = taskService;

  Future<void> loadTotalTasks() async {
    final allTasks = await Future.wait([
      _taskService.getToday(),
      _taskService.getTomorrow(),
      _taskService.getWeek(),
    ]);

    final todayTasks = allTasks[0] as List<TaskModel>;
    final tomorrowTasks = allTasks[1] as List<TaskModel>;
    final weekTasks = allTasks[2] as WeekTaskModel;

    todayTotalTasks = TotalTasksModel(
      totalTasks: todayTasks.length,
      totalTasksFinished: todayTasks
          .where((itemTask) => itemTask.finished)
          .length,
    );

    tomorrowTotalTasks = TotalTasksModel(
      totalTasks: tomorrowTasks.length,
      totalTasksFinished: tomorrowTasks
          .where((itemTask) => itemTask.finished)
          .length,
    );

    weekTotalTasks = TotalTasksModel(
      totalTasks: weekTasks.tasks.length,
      totalTasksFinished: weekTasks.tasks
          .where((itemTask) => itemTask.finished)
          .length,
    );

    notifyListeners();
  }

  Future<void> findtasks({required TaskFilterEnum filter}) async {
    filterSelected = filter;
    showLoading();
    notifyListeners();
    List<TaskModel> tasks;
    WeekTaskModel weekModel;

    switch (filter) {
      case TaskFilterEnum.today:
        tasks = await _taskService.getToday();
        break;
      case TaskFilterEnum.tomorrow:
        tasks = await _taskService.getTomorrow();
        break;
      case TaskFilterEnum.week:
        weekModel = await _taskService.getWeek();
        initialDateOfWeek = weekModel.startDate;
        tasks = weekModel.tasks;
        break;
    }

    filteredTasks = tasks;
    allTasks = tasks;

    if (filter == TaskFilterEnum.week) {
      if (selectedDay != null) {
        filterByDay(selectedDay!);
      } else if (initialDateOfWeek != null) {
        filterByDay(initialDateOfWeek!);
      }
    } else {
      selectedDay = null;
    }

    if (!showFinishedTasks) {
      filteredTasks = filteredTasks.where((task) => !task.finished).toList();
    }

    hideLoading();
    notifyListeners();
  }

  void filterByDay(DateTime date) {
    selectedDay = date;
    filteredTasks = allTasks.where((task) {
      return task.dateTime == selectedDay;
    }).toList();
    notifyListeners();
  }

  Future<void> refreshPage() async {
    await findtasks(filter: filterSelected);
    await loadTotalTasks();
    notifyListeners();
  }

  Future<void> checkOrUncheckTask(TaskModel taskModel) async {
    try {
      clearState();
      showLoading();
      notifyListeners();

      final taskUpdate = taskModel.copyWith(finished: !taskModel.finished);
      await _taskService.checkOrUncheckTask(taskUpdate);

      hideLoading();
      showSuccess(
        taskUpdate.finished
            ? 'Tarefa concluída!'
            : 'Tarefa desmarcada como concluída!',
      );
      notifyListeners();

      await refreshPage();
    } catch (e) {
      hideLoading();
      showError('Erro ao atualizar a tarefa');
      notifyListeners();
    }
  }

  void showOrHideFinishedTasks() {
    showFinishedTasks = !showFinishedTasks;
    refreshPage();
  }

  Future<void> deleteTask(TaskModel taskModel) async {
    try {
      clearState();
      showLoading();
      notifyListeners();

      await _taskService.delete(taskModel.id);

      hideLoading();
      showSuccess('Tarefa "${taskModel.description}" excluída com sucesso!');
      notifyListeners();

      await Future.delayed(Duration(milliseconds: 100));
      await refreshPage();
    } catch (e) {
      hideLoading();
      showError('Erro ao excluir a tarefa "${taskModel.description}"');
      notifyListeners();
    }
  }
}
