import 'package:demoproject/presentation/home_screen/home_screen.dart';
import 'package:demoproject/presentation/login_screen/login_screen.dart';
import 'package:demoproject/presentation/login_screen/provider/login_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<LoginScreenProvider>(context, listen: false)
          .checkCredentials(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.data == true) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
