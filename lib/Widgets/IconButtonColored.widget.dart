import 'package:flutter/material.dart';
import 'package:VedRich/Theme/BorderRadiuses.theme.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';

class IconButtonColored extends StatelessWidget {
  final Widget icon;
  final Function onTap;

  const IconButtonColored({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(Spacings.md),
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.secondaryContainer.withAlpha(120),
          borderRadius: BorderRadius.circular(BorderRadiuses.md),
        ),
        child: icon,
      ),
    );
  }
}
