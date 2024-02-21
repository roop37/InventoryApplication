import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Views/App/Profile/ProfileOpt.view.dart';

class TopSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "वेद Rich",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(
          //     'assets/logos/glasses.png',
          //     height: 40,
          //     width: 40,
          //   ),
          // ),
          Text(
            'Home',
            style: TextStyle(
              color: Theme.of(context).canvasColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, ProfileView.routeName);
                },
                icon: Hero(
                    tag: "profile",
                    child: Icon(Icons.account_circle_outlined)),
                iconSize: Spacings.xl,
                color: Theme.of(context).primaryColor,
              ),

          ),
        ],
      ),
    );
  }
}
