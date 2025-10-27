
import 'package:flutter/services.dart';

abstract class PhoneValidatorEgypt {
  static const int validDigitsAfter20 = 10; // 1 + 9 digits (01XXXXXXXXX)

  /// ✅ Normalize رقم الهاتف المصري لأي صيغة إلى صيغة واحدة (20XXXXXXXXXX)
  static String normalizeEgyptianPhoneNumber(String phone) {
    phone = phone.replaceAll(' ', '').replaceFirst('+', '');

    // استبدال 0020 بـ 20
    if (phone.startsWith('0020')) {
      phone = phone.replaceFirst('0020', '20');
    }

    // لو الرقم بادئ بـ 0 → نشيل الصفر ونضيف 20
    if (phone.startsWith('0')) {
      phone = '20${phone.substring(1)}';
    }

    // لو مش بادئ بـ 20 نضيفها
    if (!phone.startsWith('20')) {
      phone = '20$phone';
    }

    return phone;
  }

  /// ✅ فحص صلاحية الرقم المصري بعد التنظيف
  static bool isPhoneNumberValid(String? phone) {
    if (phone == null) return false;

    final normalized = normalizeEgyptianPhoneNumber(phone);
    final digitsAfter20 = normalized.replaceFirst('20', '');
    
    return normalized.startsWith('20') &&
        digitsAfter20.length == validDigitsAfter20 &&
        RegExp(r'^1[0-9]{9}$').hasMatch(digitsAfter20);
  }

  static bool isWhatsAppValid(String phone) => isPhoneNumberValid(phone);

  /// English digits only input (Egypt numbers)
  static RegExp phoneInputRegExp = RegExp(
    r'^(?:\+201\d{0,9}|01\d{0,9}|00201\d{0,9}|201\d{0,9})$',
  );

  /// English + Arabic digits input (Egypt numbers)
  static RegExp phoneInputBothNumbersRegExp = RegExp(
    r'^(?:\+201[0-9٠-٩]{0,9}|01[0-9٠-٩]{0,9}|00201[0-9٠-٩]{0,9}|201[0-9٠-٩]{0,9})$',
  );

  static List<TextInputFormatter> phoneInputFormatters = [
    FilteringTextInputFormatter.allow(phoneInputRegExp),
  ];

  static List<TextInputFormatter> phoneInputFormattersBothNumbers = [
    FilteringTextInputFormatter.allow(phoneInputBothNumbersRegExp),
  ];
}
