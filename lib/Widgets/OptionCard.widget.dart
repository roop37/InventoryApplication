import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  // final Color? borderColor;

  const OptionCard({
    Key? key,
    required this.text,
    this.icon,
    // this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.44;

    return Container(
      width: cardWidth,
      height: 35,

      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color:  Theme.of(context).primaryColor, // Use default color if borderColor is null
          width: 2,
          // Thicken the border
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Add padding for the icon and text
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (icon != null) // Display the icon if provided
                    Icon(icon, size: 16),
                  SizedBox(width: 4), // Add spacing between icon and text
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_sharp)
            ],
          ),
        ),
      ),
    );
  }
}
