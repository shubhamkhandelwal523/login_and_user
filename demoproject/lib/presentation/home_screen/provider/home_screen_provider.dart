import 'package:demoproject/data/models/user_model.dart';
import 'package:demoproject/domain/use_cases/fetch_users.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider with ChangeNotifier {
  FetchUsers? fetchUsers;
  List<User> _users = [];
  bool _loading = false;

  List<User> get users => _users;
  bool get loading => _loading;

  HomeScreenProvider(this.fetchUsers) {
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    _loading = true;
    notifyListeners();

    _users = await fetchUsers!();

    _loading = false;
    notifyListeners();
  }
}
