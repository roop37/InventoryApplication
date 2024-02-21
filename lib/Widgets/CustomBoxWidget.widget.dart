import 'package:flutter/material.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';

class CustomBoxWidget extends StatelessWidget {
  final IconData iconData;
  final String title;

  final Color? iconColor;
  final Color? cardColor;
  final Color? titleColor;

  CustomBoxWidget({
    required this.iconData,
    required this.title,
    this.cardColor,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultcardColor= cardColor ?? theme.primaryColor;
    final defaultIconColor = iconColor ?? Colors.white;
    final defaultTitleColor = titleColor ?? Colors.black;

    return Container(
      height: MediaQuery.of(context).size.width * 0.22,
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            defaultcardColor.withAlpha(30),
            defaultcardColor.withAlpha(10),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.7],
        ),

        borderRadius: BorderRadius.circular(Spacings.ms),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconData,
            size: 40.0,
            color: defaultIconColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: defaultTitleColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
