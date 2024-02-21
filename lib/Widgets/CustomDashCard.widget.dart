import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final Color? cardColor;
  final Color? titleTextColor;
  final Color? valueTextColor;
  final String? value;
  final IconData? icon;
  final Color? iconColor;
  final double iconSize;

  const CustomCard({
    Key? key,
    this.title,
    this.cardColor,
    this.titleTextColor,
    this.valueTextColor,
    this.value,
    this.icon,
    this.iconColor,
    this.iconSize = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.44;
    final cardHeight = 85.0;

    final defaultCardColor = Colors.grey;
    final defaultTitleTextColor = Colors.black;
    final defaultValueTextColor = Colors.black;
    final defaultIconColor = Colors.white;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: cardColor ?? defaultCardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: (cardColor ?? defaultCardColor).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (icon != null)
            Positioned(
              top: 20,
              right:10,
              child: Container(
                width: iconSize,
                height: iconSize,
                color: cardColor ?? defaultCardColor,
                child: Icon(
                  icon,
                  size: iconSize,
                  color: (iconColor ?? defaultIconColor).withOpacity(0.5),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'Title not available',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: titleTextColor ?? defaultTitleTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  value ?? 'Value not available',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: valueTextColor ?? defaultValueTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
