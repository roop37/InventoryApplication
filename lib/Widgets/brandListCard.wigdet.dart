// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:VedRich/Theme/BorderRadiuses.theme.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Widgets/spacer.widget.dart';

class BrandListCardData {
  final Function? onTap;
  final Widget? leading;
  final String title;
  final Widget? subtitle;
  final Widget? trailing;

  BrandListCardData({
    this.onTap,
    this.leading,
    required this.title,
    // required this.matter,
    this.subtitle,
    this.trailing,
  });

  BrandListCardData copyWith({
    Function? onTap,
    Widget? leading,
    String? title,
    Widget? subtitle,
    Widget? trailing,
  }) {
    return BrandListCardData(
      onTap: onTap ?? this.onTap,
      leading: leading ?? this.leading,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      trailing: trailing ?? this.trailing,
    );
  }
}

class BaseListCard extends StatelessWidget {
  final Function? onTap;
  final double cardHeight;
  final double? cardWidth;
  final double? marginY;
  final double lgX;
  final double lgY;
  final Color? primaryColor;
  final Widget child;
  final Widget? button;
  final String? trailing;

  final bool? noBackground;

  const BaseListCard({
    Key? key,
    this.onTap,
    required this.cardHeight,
    required this.child,
    required this.lgX,
    required this.lgY,
    this.noBackground,
    this.button,
    this.cardWidth,
    this.primaryColor,
    this.marginY,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        // height: cardHeight,
        width: cardWidth,
        margin: EdgeInsets.symmetric(vertical: marginY ?? 0),
        padding: EdgeInsets.symmetric(
          horizontal: lgX,
          vertical: lgY,
        ),
        decoration: BoxDecoration(
          color: (noBackground ?? false)
              ? Colors.transparent
              : (primaryColor ?? Theme.of(context).primaryColor).withAlpha(
                  Theme.of(context).brightness == Brightness.light ? 15 : 45,
                ),
          borderRadius: BorderRadius.circular(BorderRadiuses.md),
        ),
        child: child,
      ),
    );
  }
}

class BrandListCard extends StatelessWidget {
  final BrandListCardData data;
  final Widget? button;
  final Color? primaryColor;
  final double cardHeight;
  final double? lgX;
  final double? lgY;
  final double? marginY;

  const BrandListCard(
    this.data, {
    Key? key,
    this.cardHeight = 90,
    this.button,
    this.primaryColor,
    this.marginY = 0,
    this.lgX,
    this.lgY,
  }) : super(key: key);

  final double _lgX = 20;
  final double _lgY = 15;

  @override
  Widget build(BuildContext context) {
    return BaseListCard(
      onTap: data.onTap,
      cardHeight: cardHeight,
      lgX: lgX ?? _lgX,
      lgY: lgX ?? _lgY,
      marginY: marginY,
      primaryColor: primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          data.leading ?? const SizedBox(),
          SizedBox(width: data.leading != null ? _lgX : null),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SpacerWidget.vertical(Spacings.sm),
                data.subtitle ?? const SizedBox(),
              ],
            ),
          ),
          SizedBox(width: _lgX),
          Align(
            alignment: Alignment.centerRight,
            child: data.trailing ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class SliverBrandBrandListCard extends StatelessWidget {
  final BrandListCardData data;
  final double cardHeight;
  final Color? primaryColor;
  final double? marginY;

  const SliverBrandBrandListCard(this.data,
      {Key? key, this.cardHeight = 60, this.primaryColor, this.marginY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BrandListCard(
        data,
        primaryColor: primaryColor,
        cardHeight: cardHeight,
        marginY: marginY,
      ),
    );
  }
}
