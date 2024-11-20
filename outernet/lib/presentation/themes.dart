import 'package:flutter/material.dart';

class AppColors {
  static const Color maintheme = Color(0xFFFFFFFF);
  static const Color themeSecondary = Color.fromARGB(255, 243, 244, 246);
  static const Color primary = Color.fromARGB(255, 255, 171, 62);
  static const Color textOnPrimary = Color.fromARGB(255, 255, 255, 255);
  static const Color textPrimary = Color.fromARGB(255, 135, 81, 0);
  static const Color textSecondary = Color.fromARGB(255, 182, 180, 185);
  static const Color textOnMainTheme = Color.fromARGB(255, 0, 0, 0);
  static const Color error = Color.fromARGB(255, 220, 38, 38);
}


class AppTextStyles {
  static const TextStyle heading1Semibold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 20.0/18.0,
  );

  static const TextStyle heading1Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 20.0/18.0,
  );

  static const TextStyle heading1Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 20.0/18.0,
  );

  static const TextStyle heading2Semibold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 20.0/16.0,
  );

  static const TextStyle heading2Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 20.0/16.0,
  );

  static const TextStyle heading2Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 20.0/16.0,
  );

  static const TextStyle title1Semibold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 18.0/15.0,
  );

  static const TextStyle title1Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 18.0/15.0,
  );

  static const TextStyle title1Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 18.0/15.0,
  );

  static const TextStyle title2Semibold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 16.0/12.0,
  );

  static const TextStyle title2Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16.0/12.0,
  );

  static const TextStyle title2Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 16.0/12.0,
  );

  static const TextStyle body1Semibold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 16.0/15.0,
  );

  static const TextStyle body1Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16.0/15.0,
  );

  static const TextStyle body1Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 16.0/15.0,
  );

  static const TextStyle body2Semibold = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 16.0/12.0,
  );

  static const TextStyle body2Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 16.0/12.0,
  );

  static const TextStyle body2Regular = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 16.0/12.0,
  );
}


final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.maintheme,
  dialogBackgroundColor: AppColors.themeSecondary,
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColors.maintheme,
    headerHeadlineStyle: AppTextStyles.title1Semibold.copyWith(color: AppColors.primary),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary),
      errorStyle: AppTextStyles.body2Regular.copyWith(color: AppColors.error),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: AppTextStyles.body2Medium.copyWith(color: AppColors.textPrimary),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.maintheme,
      focusColor: AppColors.maintheme,
    )
  ),
  buttonTheme: const ButtonThemeData(
    disabledColor: AppColors.textSecondary,
    buttonColor: AppColors.primary,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(AppTextStyles.title2Semibold.copyWith(color: AppColors.textOnPrimary)),
      backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
    )
  ),
  outlinedButtonTheme:const  OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.textPrimary),
      backgroundColor: WidgetStatePropertyAll(AppColors.maintheme),
      side: WidgetStatePropertyAll(BorderSide(color: AppColors.primary)),
    )
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.textPrimary),
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.primary.withOpacity(0.5)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.primary, width: 2.0)
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.error, width: 2.0)
    ), 
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(color: AppColors.textSecondary, width: 2.0),
    ),
    hintStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 16.0/15.0,
      color: AppColors.textPrimary
    ),
    errorStyle: AppTextStyles.body2Medium.copyWith(color: AppColors.error),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.maintheme,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.textOnMainTheme
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.textOnMainTheme
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.maintheme,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.maintheme,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(AppColors.primary),
    checkColor: WidgetStateProperty.all(AppColors.textOnPrimary),
  )
);
