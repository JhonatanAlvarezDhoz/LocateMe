import 'dart:ui';

/// A utility class for defining theme colors used throughout the application.
class ThemeColors extends Color {
  /// Private constructor to prevent instantiation of this class.
  ThemeColors._(super.value);

  /// Defines the primary color used in the application, typically used for primary elements.
  static const Color primary = Color(0xff190019);

  /// Defines the primary dark color used in the application, typically used for primary elements.
  static const Color primaryDark = Color(0xFF190019);

  /// Defines a lighter shade of the primary color, often used for highlights or accents.
  static const Color primaryLight = Color(0xffFBE4D8);

  /// Defines a secondary color used in the application, typically for secondary elements.
  static const Color secondary = Color(0xff2B124c);

  static const Color secondaryLight = Color(0xffDFB6B2);

  /// Defines a tertiary color used in the application, often for backgrounds or subtle accents.
  static const Color tertiary = Color(0xff522B5B);

  static const Color tertiaryLight = Color(0xff854F6C);

  /// Defines the white color used in the application, primarily for backgrounds or
  static const Color white = Color(0xffFFFFFF);

  /// Defines a light gray color used in the application, primarily for backgrounds.
  static const Color whiteGray = Color(0xff98989A);

  static const Color ligth = Color(0xFFF1F7F7);

  static const Color black = Color(0xFF000000);

  /// Defines a dark gray  color used in the application.
  static const Color darkGray = Color(0xFF919191);

  /// Defines a ligth border color used in the application.
  static const Color ligthBorderColor = Color(0xFFBEBFC0);
}
