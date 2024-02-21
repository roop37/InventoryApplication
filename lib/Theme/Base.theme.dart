

import 'package:flutter/material.dart';
import 'package:VedRich/Theme/darkColors.theme.dart';
import 'package:VedRich/Theme/lightColors.theme.dart';

enum ThemeModes { dark, light }

ThemeData generateTheme(ThemeModes themeMode) {
  ColorScheme colorScheme =
      themeMode == ThemeModes.dark ? darkColorScheme : lightColorScheme;
  ThemeData theme = ThemeData(
    colorScheme: colorScheme,
    brightness: colorScheme.brightness,
    scaffoldBackgroundColor: colorScheme.background,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    dividerColor: colorScheme.onSurfaceVariant,
    primaryColor: colorScheme.primary,
  );

  // Elevated Button Theme
  theme = theme.copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor:  MaterialStateProperty.all(theme.colorScheme.onPrimary,),
        backgroundColor: MaterialStateProperty.all(theme.colorScheme.primary,),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.disabled)) {
            return 0.0;
          }
          return 0;
        }),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            top: 14.0,
            left: 24.0,
            right: 24.0,
            bottom: 14.0,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
        ),
      ),
    ),
  );

// OutlinedButton Setting.
  theme = theme.copyWith(
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            top: 14.0,
            left: 24.0,
            right: 24.0,
            bottom: 14.0,
          ),
        ),
        // side: MaterialStateProperty.resolveWith(
        //   (states) {
        //     return const BorderSide(
        //       width: 0.0,
        //     );
        //   },
        // ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
        ),
      ),
    ),
  );

// Chip Setting.
  theme = theme.copyWith(
    chipTheme: theme.chipTheme.copyWith(
      deleteIconColor: const Color(0xffe91e63),
      secondarySelectedColor: Colors.green,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      secondaryLabelStyle: const TextStyle(
        color: Color(0xffffffff),
      ),
      elevation: 0.0,
    ),
  );

// CheckBox Setting.
  theme = theme.copyWith(
    checkboxTheme: theme.checkboxTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  );

// Slider Setting.
  theme = theme.copyWith(
    sliderTheme: theme.sliderTheme.copyWith(
      trackHeight: 5.0,
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 10.0 * 2),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
    ),
  );

// TextBox Setting.
  theme = theme.copyWith(
    inputDecorationTheme: theme.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: colorScheme.surfaceVariant,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: colorScheme.surfaceVariant,
          style: BorderStyle.none,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: Color(0xffffffff),
          style: BorderStyle.none,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      contentPadding: const EdgeInsets.only(
        top: 12.0,
        left: 24.0,
        right: 24.0,
        bottom: 12.0,
      ),
    ),
  );
// Card Setting.
  theme = theme.copyWith(
    cardTheme: theme.cardTheme.copyWith(
      color: Colors.grey[100],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        side: BorderSide(
          style: BorderStyle.none,
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
    ),
  );

// Appbar Setting.
  theme = theme.copyWith(
    appBarTheme: theme.appBarTheme.copyWith(
      iconTheme: (theme.appBarTheme.iconTheme ?? theme.iconTheme)
          .copyWith(color: colorScheme.onBackground, size: 20),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      elevation: 0.0,
      color: colorScheme.background,
    ),
  );

  // Floating Action Button settings
  theme = theme.copyWith(
    floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
      backgroundColor: Colors.white,
      splashColor: Colors.blue[600],
      foregroundColor: theme.primaryColor,
      enableFeedback: true,
    ),
  );

  // Bottom appbar Setting.
  theme = theme.copyWith(
    bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Colors.black,
      elevation: 0,
      selectedItemColor: theme.primaryColor,
      selectedLabelStyle: theme.bottomNavigationBarTheme.selectedLabelStyle
          ?.copyWith(fontSize: 12),
      unselectedLabelStyle: theme.bottomNavigationBarTheme.unselectedLabelStyle
          ?.copyWith(fontSize: 12),
      unselectedItemColor: Colors.grey.shade600,
      unselectedIconTheme: theme.bottomNavigationBarTheme.unselectedIconTheme
          ?.copyWith(size: 20),
      selectedIconTheme:
          theme.bottomNavigationBarTheme.selectedIconTheme?.copyWith(size: 20),
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
    ),
  );

  return theme;
}
