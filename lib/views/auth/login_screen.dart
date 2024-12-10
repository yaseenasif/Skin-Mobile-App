import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/core/utils/dialog_util.dart';
import 'package:skinner/core/utils/validator_util.dart';
import 'package:skinner/shared/navigation/app_routes.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';
import 'package:skinner/shared/widgets/custom_button.dart';
import '../../data/providers/auth_provider.dart';
import '../../shared/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_loginKey.currentState!.validate()) {
      DialogUtil.showLoadingDialog();
      final result = await ref
          .read(authProvider.notifier)
          .login(_emailController.text, _passwordController.text);
      DialogUtil.hideLoadingDialog();

      if (result) {
        AppNavigator.pushReplacementNamed(AppRoutes.navbar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign in to your SkinVision Account',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 22),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                validator: ValidatorUtil.validateEmail,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                isPasswordField: true,
                validator: ValidatorUtil.validatePassword,
              ),
              const SizedBox(height: 40),
              CustomButton(
                onPressed: _login,
                text: "Login",
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
