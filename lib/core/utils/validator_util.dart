class ValidatorUtil {
  // Validate an email address
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required.";
    }
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid email address.";
    }
    return null;
  }

  // Validate a password with specific rules
  static String? validatePassword(String? value, {int minLength = 8}) {
    if (value == null || value.trim().isEmpty) {
      return "Password is required.";
    }
    if (value.length < minLength) {
      return "Password must be at least $minLength characters long.";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter.";
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain at least one lowercase letter.";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Password must contain at least one special character.";
    }
    return null;
  }

  // Validate confirm password
  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return "Confirm password is required.";
    }
    if (password != confirmPassword) {
      return "Passwords do not match.";
    }
    return null;
  }

  // Validate a non-empty field
  static String? validateNotEmpty(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required.";
    }
    return null;
  }
}
