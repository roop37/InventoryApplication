import 'package:flutter/material.dart';

class RoundedGradientContainer extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String title;
  final String quantity;

  RoundedGradientContainer({
    required this.color,
    required this.iconData,
    required this.title,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width:double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [
            color.withAlpha(30),
            color.withAlpha(10),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.7],
        ),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Row(
        children: [
          Icon(iconData, color: Colors.white),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            quantity,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class RoundedGradientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rounded Gradient List'),
      ),
      body: ListView(
        children: [
          RoundedGradientContainer(
            color: Colors.blue, // Example color
            iconData: Icons.favorite,
            title: 'Item 1',
            quantity: 'x1',
          ),
          RoundedGradientContainer(
            color: Colors.green, // Example color
            iconData: Icons.star,
            title: 'Item 2',
            quantity: 'x2',
          ),
          RoundedGradientContainer(
            color: Colors.orange, // Example color
            iconData: Icons.attach_money,
            title: 'Item 3',
            quantity: 'x3',
          ),
          // Add more RoundedGradientContainer widgets as needed
        ],
      ),
    );
  }
}
