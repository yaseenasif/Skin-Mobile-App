import 'package:flutter/material.dart';
import 'package:skinner/views/home/navbar_screen.dart';
import 'package:skinner/views/splash/splash_screen.dart';

import '../../views/auth/login_screen.dart';
import '../../views/auth/signup_screen.dart';
import '../../views/auth/welcome_screen.dart';
import '../../views/faq/faq_screen.dart';
import '../../views/home/home_screen.dart';
import '../../views/notification/notification_screen.dart';
import '../../views/profile/edit_profile_screen.dart';
import '../../views/scan/result_screen.dart';
import '../../views/scan/scan_screen.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case AppRoutes.navbar:
        return MaterialPageRoute(builder: (_) => const NavbarScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case AppRoutes.scan:
        return MaterialPageRoute(builder: (_) => const ScanScreen());
      case AppRoutes.faq:
        return MaterialPageRoute(builder: (_) => FAQScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case AppRoutes.result:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ResultScreen(scanResult: args['scanResult']),
        );
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
