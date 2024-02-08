import 'package:flutter/material.dart';
import 'package:flutter_retrofit/interceptors/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final DioClient client = DioClient();
  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

  }

  void _handleLoginClick() {
    final notifier = ref.read(authStateNotifier.notifier);
    String loginId = _loginIdController.text.trim();
    String password = _passwordController.text.trim();
    notifier.fetchAuthData(
      loginId: loginId,
      password: password,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _loginIdController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Login ID")
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password")
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {
              _handleLoginClick();
            }, child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
