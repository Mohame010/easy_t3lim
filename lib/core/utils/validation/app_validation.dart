import 'package:desktop_app/core/utils/validation/validators/auth_validator.dart';
import 'package:desktop_app/core/utils/validation/validators/text_validator.dart';

/// This class is responsible for validating the input fields.
abstract class AppValidation {
  /// التحقق من أن القيمة مش فاضية
  static String? requiredValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "هذا الحقل مطلوب";
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "من فضلك أدخل الاسم";
    } else if (!TextValidator.isNameValid(value)) {
      return "الاسم غير صالح";
    }
    return null;
  }

  static String? fullNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "من فضلك أدخل الاسم الكامل";
    } else if (!TextValidator.isFullNameValid(value)) {
      return "الاسم الكامل غير صالح";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "البريد الإلكتروني مطلوب";
    } else if (!AuthValidator.isEmailValid(value)) {
      return "البريد الإلكتروني غير صالح";
    }
    return null;
  }

  static String? passwordValidation(String? password) {
    if (password == null || password.trim().isEmpty) {
      return "كلمة المرور مطلوبة";
    } else if (!AuthValidator.isPasswordLengthValid(password)) {
      return "كلمة المرور يجب أن تكون على الأقل ${AuthValidator.minPasswordLength} أحرف";
    }
    return null;
  }

  static String? confirmPasswordValidation(
    String? confirmPassword,
    String? originalPassword,
  ) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return "تأكيد كلمة المرور مطلوب";
    } else if (confirmPassword != originalPassword) {
      return "كلمتا المرور غير متطابقتين";
    }
    return null;
  }
}
