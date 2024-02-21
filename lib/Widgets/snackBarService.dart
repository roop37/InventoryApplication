import 'package:flutter/material.dart';
import 'package:VedRich/Widgets/snackBar.widget.dart';

class SnackBarService {
  static void showSnackBar(BuildContext context, Widget child,
      {SnackBarAction? action,Duration? duration}) {
    try {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    } catch (e) {
      e;
    }

    SnackBar snackBar = SnackBar(
      content: child,
      action: action,
      backgroundColor: Colors.transparent,
      elevation: 0,
       duration: duration ?? const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void success(BuildContext context, String message) => showSnackBar(
        context,
        BrandSnackBar(
          message: message,
          type: SnackBarType.success,
        ),
      );

  static void error(BuildContext context, String message) => showSnackBar(
        context,
        BrandSnackBar(
          message: message,
          type: SnackBarType.error,
        ),
      );



  static void stickyAction(
          BuildContext context, String message, Function onPressed) =>
      showSnackBar(
        context,
        BrandSnackBar(
          message: message,
          type: SnackBarType.sticky,
        ),
        action: SnackBarAction(
          label: 'Retry',
          onPressed: () => onPressed,
        ),
        duration: const Duration(days: 1),
      );
  static void warn(BuildContext context, String message) => showSnackBar(
        context,
        BrandSnackBar(
          message: message,
          type: SnackBarType.warning,
        ),
      );
  static void info(BuildContext context, String message) => showSnackBar(
        context,
        BrandSnackBar(
          message: message,
          type: SnackBarType.info,
        ),
      );
}
