import 'package:demoproject/data/storage/local_storage.dart';

class CheckCredentials {
  final LocalDataSource localDataSource;

  CheckCredentials(this.localDataSource);

  Future<bool> call() {
    return localDataSource.checkCredentials();
  }
}
