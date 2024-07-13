import 'package:demoproject/data/models/user_model.dart';
import 'package:demoproject/domain/services/user_api_service.dart';

class UserRepository {
  final UserApiService userApiService;

  UserRepository(this.userApiService);

  Future<List<User>> fetchUsers() async {
    return await userApiService.fetchUsers();
  }
}
