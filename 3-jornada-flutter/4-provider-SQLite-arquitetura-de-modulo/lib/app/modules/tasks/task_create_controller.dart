import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/services/tasks/task_service.dart';

class TaskCreateController extends DefaultChangeNotifier {
  final TaskService _taskService;
  DateTime? _selectedDate;

  TaskCreateController({required TaskService taskService})
    : _taskService = taskService;

  set selectedDate(DateTime? selectedDate) {
    clearState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  Future<void> save(String description) async {
    try {
      clearState();
      showLoading();
      notifyListeners();
      if (_selectedDate != null) {
        await _taskService.save(_selectedDate!, description);
        showSuccess('Tarefa "$description" criada com sucesso!');
      } else {
        showError('Data da tarefa não foi selecionada');
      }
    } catch (e, s) {
      print(e);
      print(s);
      showError('Erro ao criar a tarefa');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
