import 'package:demoproject/presentation/home_screen/home_screen.dart';
import 'package:demoproject/presentation/login_screen/provider/login_screen_provider.dart';
import 'package:demoproject/presentation/widgets/common_button.dart';
import 'package:demoproject/presentation/widgets/textfield_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final loginProvider =
          Provider.of<LoginScreenProvider>(context, listen: false);
      loginProvider.login(_emailController.text, _passwordController.text);

      if (loginProvider.errorMessage == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loginProvider.errorMessage!)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Page')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textFieldWidget(_emailController, 'Email'),
              textFieldWidget(_passwordController, 'Password',
                  isPassword: true),
              const SizedBox(height: 20),
              commonButton(_submitForm, 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
