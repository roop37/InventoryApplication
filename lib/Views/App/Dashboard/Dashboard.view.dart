import 'package:flutter/material.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Views/App/Dashboard/ScrollableMain.widget.dart';
import 'package:VedRich/Views/App/Dashboard/TopSection.widget.dart';

class DashboardView extends StatelessWidget {
  static const String routeName = "app/dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Spacings.md, left: Spacings.sm, right: Spacings.sm),
              child: TopSectionWidget(),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: ScrollableContainerWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
