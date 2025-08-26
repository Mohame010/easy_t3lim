import 'package:flutter/material.dart';

abstract class AppColors {
  //
  static const Color periwinkle = Color(0xFF50507D);
  // 
  static const Color moreDarkPeriwinkle = Color(0xFF434465);
  // -- using for dark mode ----
  static const Color darkPeriwinkle = Color(0xFFB7BFD9);
  static const Color lightPeriwinkle = Color(0xFF696EA7);
  //
  static const Color orangeTanHide = Color(0xFFFF9D61);
  static const Color primaryDarkMode = Color(0xFF181c24);

// 
  static const Color darkBlue = Color(0xFF020043);
  // 
  static const Color darkModeBackground = Color(0xFF181C24);
  static const Color lightModeBackground = Color(0xFFFFFFFF);
// 
  static const Color secondWhiteBackground = Color(0xFFF4F6FA);
  static const Color secondDarkBackground = Color(0xFF242A36);
  // for fill widget
  static const Color lightBackgroundDarkColor = Color(0xFF283542);
  static const Color lightBackgroundWhiteColor = Color(0xFFE7E9F2);

  // gray
    static const Color lightGrayColor = Color(0xFF7B83B6);  
    static const Color darkGrayColor = Color(0xFF7B83B6);
    // 
    
// 
  // widget color
  static const Color lightModeGray = Color(0xFFE7E9F2);
  static const Color gray = Color(0xFFBBC3CC);
  static const Color fillwidgetSecondDarkBlue = Color(0xFF242A36);

  static const Color browen = Color(0xFF440C06);
  static const Color regentBlue = Color(0xFF369AC1);
  static const Color darkModeGray = Color(0xFF4C515B);
  static const Color tanOrange = Color(0xFFFE7839);
  static const Color lightModeTanOrange = Color(0xFFFC5313);
  static const Color darkModeTanOrange = Color(0xFFFF9D61);
  // errors
  static const Color errorRed = Color(0xFFEB5757);

  // Brand Colors
  static const Color primary = Color(0xFFFF9D61);
  static const Color secondOrange = Color(0xFFFC5313);
  static const Color lighterOrange = Color(0xFFFF9D61);
  static const Color primaryWhite = Color(0xFFf4f6fa);
  static const Color secondryWhite = Color(0xFFFFFFFF);
  static const Color neutralColor = Color(0xFF5F5A6A);
  static const Color moreLightPeriwinkle = Color(0xFF696EA7);
  static const Color offerYellowColor = Color(0xFFF4D655);

  /// Primary color for DarkMode
  // static const Color darkBlue = Color(0xFF50507D);
  static const Color darkButton = Color(0xFF3F444E);
  static const Color darkButtonBorder = Color(0xFF4C515B);
  static const Color secondDarkBlue = Color(0xFF242A36);
  static const Color lighterDarkBlue = Color(0xFF242a36);
  // static const Color darkPeriwinkle = Color(0xFF5D5E98);
  static const Color moreLighterDarkPeriwinkle = Color(0xFF959FC5);
  static const Color moreLighterDarkPeriwinkleDarkMode = Color(0xFFB7BFD9);
  static const Color activeColor = Color(0xFF94CDE5);
  static const Color onSecondaryColor = Color(0xFFFEF1E9);

  // Shades of Gray
  static const grey = Color(0xFFE7E9F2);
  static const greyLight = Color(0xFFE4E6E7);
  static const greyLighter = Color(0xFFE4EAF0);
  static const greyLighterX = Color(0xFFF0F6FA);
  static const moreLightGray = Color(0xFFE7E9F2);
  static const greyDarker = Color(0xFF6B6D6F);
  static const greyDark = Color(0xFF9D9D9E);
  static const overlay = Color(0xFFB6B6B9);
  static const neutral = Color(0xFFAFB2B3);
  static const stroke = Color(0xFFCCCCCC);
  static const neutralLight = Color(0xFFBBBBBD);
  static const disabled = Color(0xFFC1C3C4);
  static const unselected = Color(0xFFF2F5F7);
  static const shadowColor = grey;
  static const shadowLight = Color(0xFFEDF0F2);

  // Text Colors
  static const headline = Color(0xFF131B21);
  static const title = Color(0xFF222A30);
  static const titleBody = Color(0xFF3E4143);
  static const titleBodyLight = Color(0xFF595959);
  static const titleBodyLightX = Color(0xFF686C70);
  static const titleUnselected = Color(0xFF7D8186);
  static const subtitle = Color(0xFFAEB0B2);
  static const subtitleLight = Color(0xFFB3BAC3);

  // Primary Shades & Tints
  static const primaryLight = Color(0xFFDBE9FE);
  static const primaryLightA20 = Color(0x33DBEAFF);
  static const primaryLight5 = Color(0x0d263959);
  static const primaryLight8 = Color(0x141E3354);
  static const primaryDark20 = Color(0xFF1D3557);
  static const primaryDark40 = Color(0xFF152845);

  // static const primaryLight = Color(0xFF2E537A);

  // Secondary colors
  static const secondary = Color(0xFF1E40AF);
  static const onPrimaryColor = Color(0xFFDBEAFE);
  static const secondaryViolet = Color(0xFF6C63FF);

  // Background Colors
  static const surfacePrimary = Color(0xFFECEEF0);
  static const surfaceBox = Color(0xFFEFF0F1);

  // Shimmer Colors
  static final shimmerBaseColor = greyLighter.withValues(alpha: 0.30);
  static final shimmerHighlightColor = greyLighter.withValues(alpha: 0.65);

  // iconButton color
  static const iconButton = Color(0xFFB7BFD9);

  // System Colors
  static const errorColor = Color(0xFFEB5757);
  static const onErrorColor = Color(0xFFFFF8F8);
  static const errorBgColor = Color(0xFFF4E1E1);
  static const onErrorBgColor = Color(0xFF5E2F35);
  static const successColor = Color(0xFF30c16c);
  static const onSuccessColor = Color(0xFFf0faf4);
  static const successBgColor = Color(0xFFebf4ef);
  static const onSuccessBgColor = Color(0xFF326148);
  static const warningColor = Color(0xFFeee8a9);
  static const onWarningColor = Color(0xFF5e5c3a);
  static const blueColor = Color(0xFF1C72E3);
  static const redColor = Color(0xFFFF5C68);
  static const greenColor = Color(0xFF2DB34D);
  static const goldenColor = Color(0xFFdaa520);
  static const white = Color(0xFFffffff);

  // Main Primary Swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xff16364F,
    <int, Color>{
      50: Color(0xFFE8EBED),
      100: Color(0xFFD0D7DC),
      200: Color(0xFFB9C3CA),
      300: Color(0xFF8A9AA7),
      400: Color(0xFF5C7284),
      500: Color(0xFF16364F),
      600: Color(0xFF122B3F),
      700: Color(0xFF0F2637),
      800: Color(0xFF0D202F),
      900: Color(0xFF0B1B28),
    },
  );
}
