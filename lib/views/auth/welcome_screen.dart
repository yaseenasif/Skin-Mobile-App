import 'package:flutter/material.dart';
import 'package:skinner/core/constants/app_icons.dart';
import 'package:skinner/shared/navigation/app_routes.dart';
import 'package:skinner/shared/widgets/custom_button.dart';
import 'package:skinner/shared/widgets/screen_padding.dart';

import '../../shared/navigation/navigation_service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScreenPadding(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppIcons.logoIcon,
              ),
              const Text(
                'Welcome to Skin Vision',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Column(children: [
                CustomButton(
                  onPressed: () => AppNavigator.pushNamed(AppRoutes.login),
                  text: 'Log In',
                  size: const Size(double.infinity, 50),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => AppNavigator.pushNamed(AppRoutes.signup),
                  child: const Text('Sign Up'),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
