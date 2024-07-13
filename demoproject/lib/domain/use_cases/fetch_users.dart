import 'package:demoproject/data/models/user_model.dart';
import 'package:demoproject/data/repository/user_repository.dart';

class FetchUsers {
  final UserRepository userRepository;

  FetchUsers(this.userRepository);

  Future<List<User>> call() async {
    final users = await userRepository.fetchUsers();
    return users
        .map((user) => User(id: user.id, name: user.name, email: user.email))
        .toList();
  }
}
