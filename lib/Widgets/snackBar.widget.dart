import 'package:flutter/material.dart';
import 'package:VedRich/Theme/BorderRadiuses.theme.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Widgets/brandListCard.wigdet.dart';

enum SnackBarType { success, error, info, warning, neutral, sticky }

class SnackBarData {
  final IconData? icon;
  final Color color;
  final Color backgroundColor;

  SnackBarData({
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });
}

_getSnackbarConfig(BuildContext ctx, SnackBarType type,
    {IconData? icon, Color? primaryColor}) {
  switch (type) {
    case SnackBarType.success:
      return SnackBarData(
        icon: Icons.check_circle_rounded,
        color: Colors.green,
        backgroundColor: Colors.green,
      );
    case SnackBarType.error:
      return SnackBarData(
        icon: Icons.error_rounded,
        color: Colors.red,
        backgroundColor: Colors.red,
      );
    case SnackBarType.info:
      return SnackBarData(
        icon: Icons.info_rounded,
        color: Colors.blue,
        backgroundColor: Colors.blue,
      );
    case SnackBarType.warning:
      return SnackBarData(
        icon: Icons.warning_rounded,
        color: Colors.orangeAccent,
        backgroundColor: Colors.orangeAccent,
      );
        case SnackBarType.sticky:
      return SnackBarData(
        icon: Icons.warning_rounded,
        color: Colors.blue,
        backgroundColor: Colors.white,
      );
    case SnackBarType.neutral:
    default:
      return SnackBarData(
        icon: icon,
        color: primaryColor ?? Theme.of(ctx).primaryColor,
        backgroundColor: primaryColor ?? Theme.of(ctx).scaffoldBackgroundColor,
      );
  }
}

class BrandSnackBar extends StatelessWidget {
  final String message;

  final SnackBarType? type;
  final IconData? customIcon;
  final Color? primaryColor;

  const BrandSnackBar(
      {Key? key,
      required this.message,
      this.type,
      this.customIcon,
      this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SnackBarData snackData = _getSnackbarConfig(
      context,
      type ?? SnackBarType.neutral,
      icon: customIcon,
      primaryColor: primaryColor,
    );

    return Container(
      decoration: type != SnackBarType.sticky
          ? BoxDecoration(
              border: Border.all(color: snackData.color.withAlpha(120)),
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(BorderRadiuses.md),
            )
          : null,
      child: Theme(
        data: Theme.of(context).copyWith(
          brightness: Theme.of(context).brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
        ),
        child: BrandListCard(
          primaryColor: snackData.backgroundColor,
          BrandListCardData(
            leading: snackData.icon != null
                ? IconCircleAvatar(
                    snackData.icon ?? Icons.abc_rounded,
                    primaryColor: snackData.icon != null
                        ? snackData.color
                        : Colors.transparent,
                  )
                : null,
            title: message,
          ),
        ),
      ),
    );
  }
}

class IconCircleAvatar extends StatelessWidget {
  final Color? primaryColor;
  final double radius;
  final IconData icon;
  const IconCircleAvatar(this.icon,
      {Key? key, this.primaryColor, this.radius = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius - (Spacings.sm * 2),
      backgroundColor:
          (primaryColor ?? Theme.of(context).primaryColor).withAlpha(20),
      child: Icon(
        icon,
        color: primaryColor ?? Theme.of(context).primaryColor,
        size: (radius / 2),
      ),
    );
  }
}
