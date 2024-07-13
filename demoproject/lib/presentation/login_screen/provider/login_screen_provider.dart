import 'package:demoproject/domain/use_cases/check_crendentials.dart';
import 'package:demoproject/domain/use_cases/save_credentals.dart';
import 'package:flutter/material.dart';

class LoginScreenProvider extends ChangeNotifier {
  final SaveCredentials saveCredentials;
  final CheckCredentials checkCredentials;

  LoginScreenProvider(
      {required this.saveCredentials, required this.checkCredentials});
  String? _username;
  String? _password;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void login(String username, String password) async {
    _username = username;
    _password = password;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    if (_username!.isNotEmpty && _password!.isNotEmpty) {
      await saveCredentials.call(username, password);
      _errorMessage = null;
    } else {
      _errorMessage = 'Invalid credentials';
    }

    _isLoading = false;
    notifyListeners();
  }
}
