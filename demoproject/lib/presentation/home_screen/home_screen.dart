import 'package:demoproject/presentation/home_screen/provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Container(
        child: Consumer<HomeScreenProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (userProvider.users.isEmpty) {
              return Center(child: Text('No users found.'));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return Card(
                  child: ListTile(
                    title: Text(user.name ?? ""),
                    subtitle: Text(user.email ?? ""),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
