import 'package:flutter/material.dart';
import 'package:skinner/core/constants/app_icons.dart';
import 'package:skinner/shared/navigation/app_routes.dart';
import 'dart:async';

import 'package:skinner/shared/navigation/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      AppNavigator.pushReplacementNamed(AppRoutes.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppIcons.logoIcon),
      ),
    );
  }
}
