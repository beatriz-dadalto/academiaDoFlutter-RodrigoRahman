import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_provider/app/repositories/tasks/task_repository.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final TaskRepository _taskRepository;

  UserServiceImpl({
    required UserRepository userRepository,
    required TaskRepository taskRepository,
  })  : _userRepository = userRepository,
        _taskRepository = taskRepository;

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> forgotPassword(String email) =>
      _userRepository.forgotPassword(email);

  @override
  Future<User?> googleLogin() => _userRepository.googleLogin();

  @override
  Future<void> logout() async {
    await _taskRepository.cleanTasks();
    await _userRepository.logout();
  }

  @override
  Future<void> updateDisplayName(String name) =>
      _userRepository.updateDisplayName(name);
}
