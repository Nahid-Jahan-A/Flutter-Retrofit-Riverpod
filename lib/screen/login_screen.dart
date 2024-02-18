import 'package:flutter/material.dart';
import 'package:flutter_retrofit/providers/auth_state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:routemaster/routemaster.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLoginClick() async {
    Logger logger = Logger();
    final notifier = ref.read(authNotifierProvider.notifier);
    String loginId = _loginIdController.text.trim();
    String password = _passwordController.text.trim();
    if (loginId.isNotEmpty && password.isNotEmpty) {
      await notifier.fetchAuthData(
        loginId: loginId,
        password: password,
      );
      logger.i(
          "Checking auth status isAuthenticated on click ------> ${ref.read(authNotifierProvider.notifier).state.isAuthenticated}");
      if (ref.read(authNotifierProvider.notifier).state.isAuthenticated ==
          true) {
        Routemaster.of(context).replace('/dashboard');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter group name'),
        ),
      );
    }
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
                  border: OutlineInputBorder(), label: Text("Login ID")),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Password")),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  _handleLoginClick();
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
