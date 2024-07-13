import 'package:demoproject/data/repository/user_repository.dart';
import 'package:demoproject/domain/services/user_api_service.dart';
import 'package:demoproject/data/storage/local_storage.dart';
import 'package:demoproject/domain/use_cases/check_crendentials.dart';
import 'package:demoproject/domain/use_cases/fetch_users.dart';
import 'package:demoproject/domain/use_cases/save_credentals.dart';
import 'package:demoproject/presentation/home_screen/provider/home_screen_provider.dart';
import 'package:demoproject/presentation/login_screen/login_screen.dart';
import 'package:demoproject/presentation/login_screen/provider/login_screen_provider.dart';
import 'package:demoproject/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => LoginScreenProvider(
                  saveCredentials: SaveCredentials(LocalDataSource()),
                  checkCredentials: CheckCredentials(LocalDataSource()),
                )),
        ChangeNotifierProvider(
          create: (_) =>
              HomeScreenProvider(FetchUsers(UserRepository(UserApiService()))),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
