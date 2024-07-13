import 'package:demoproject/data/storage/local_storage.dart';

class SaveCredentials {
  final LocalDataSource localDataSource;

  SaveCredentials(this.localDataSource);

  Future<void> call(String username, String password) {
    return localDataSource.saveCredentials(username, password);
  }
}
