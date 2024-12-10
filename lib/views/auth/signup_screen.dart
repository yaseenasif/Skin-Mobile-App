import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinner/core/utils/toast_utils.dart';
import 'package:skinner/core/utils/validator_util.dart';
import 'package:skinner/shared/navigation/app_routes.dart';
import 'package:skinner/shared/navigation/navigation_service.dart';
import 'package:skinner/shared/widgets/custom_text_field.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/dialog_util.dart';
import '../../data/providers/auth_provider.dart';
import '../../shared/widgets/custom_button.dart';
import 'widgets/checkbox_with_link.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final bool _isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  bool _isPrivacyAccepted = false;
  bool _isSubscribedToOffers = false;

  final _signupKey = GlobalKey<FormState>();

  Future<void> _signUp() async {
    if (_signupKey.currentState!.validate()) {
      if (!_isPrivacyAccepted) {
        ToastUtil.showError(
            "Please agree to the Privacy Policy and Terms & Conditions to proceed.");
      }
      DialogUtil.showLoadingDialog();
      final result = await ref.read(authProvider.notifier).signUp(
          nameController.text, emailController.text, passwordController.text);
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
        child: SingleChildScrollView(
          child: Form(
            key: _signupKey,
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
                  validator: ValidatorUtil.validateNotEmpty,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email",
                  validator: ValidatorUtil.validateEmail,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  labelText: "Password",
                  isPasswordField: true,
                  validator: ValidatorUtil.validatePassword,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  isPasswordField: true,
                  validator: (value) {
                    return ValidatorUtil.validateConfirmPassword(
                        passwordController.text, value);
                  },
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
                    : CustomButton(text: 'Sign Up', onPressed: _signUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
