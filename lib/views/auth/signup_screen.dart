import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/shared/navigation/app_routes.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';
import 'package:skinner/shared/widgets/custom_text_field.dart';
import '../../core/constants/app_colors.dart';
import '../../data/providers/auth_provider.dart';
import '../../shared/widgets/custom_button.dart';
import 'widgets/checkbox_with_link.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  bool _isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool _isPrivacyAccepted = false;
  bool _isSubscribedToOffers = false;

  Future<void> _signUp() async {
    setState(() => _isLoading = true);
    final result = await ref.read(authProvider.notifier).signUp(
          nameController.text,
          emailController.text,
          passwordController.text,
        );
    setState(() => _isLoading = false);

    if (result) {
      AppNavigator.pushReplacementNamed(AppRoutes.navbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Signup to SkinVision',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: nameController,
              labelText: "Full Name",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: emailController,
              labelText: "Email",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              labelText: "Password",
              isPasswordField: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              labelText: "Confirm Password",
              isPasswordField: true,
            ),
            const SizedBox(height: 24),
            CustomCheckboxWithLink(
              value: _isPrivacyAccepted,
              onChanged: (value) {
                setState(() {
                  _isPrivacyAccepted = value!;
                });
              },
              labelText: 'I have read and agree to the',
              link1Text: 'Privacy Policy',
              link2Text: 'Terms & Conditions',
              onLink1Tap: () {},
              onLink2Tap: () {},
            ),
            const SizedBox(height: 8),
            CustomCheckboxWithLink(
              value: _isSubscribedToOffers,
              onChanged: (value) {
                setState(() {
                  _isSubscribedToOffers = value!;
                });
              },
              labelText: 'Be the first to receive offers and newsletters',
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_isPrivacyAccepted) {
                        _signUp();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please agree to the Privacy Policy and Terms & Conditions to proceed.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
