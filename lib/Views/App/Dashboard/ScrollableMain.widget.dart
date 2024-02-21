import 'package:VedRich/Views/App/AddOrder/AddOrder.view.dart';
import 'package:VedRich/Views/App/OrderList/OrderList.view.dart';
import 'package:VedRich/Views/App/ProductList/ProductView.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Widgets/CustomBoxWidget.widget.dart';
import 'package:VedRich/Widgets/CustomDashCard.widget.dart';
import 'package:VedRich/Widgets/DateFormatter.util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:VedRich/Widgets/OptionCard.widget.dart';

class ScrollableContainerWidget extends StatefulWidget {
  @override
  _ScrollableContainerWidgetState createState() =>
      _ScrollableContainerWidgetState();
}

class _ScrollableContainerWidgetState extends State<ScrollableContainerWidget> {
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    // Initialize the currentDate with the current date
    currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(Spacings.ms),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sanbedan Paul",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Spacings.md,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Opacity(
                  opacity: 0.8,
                  child: Text(
                    "Today, ${DateFormatter.formatDate(currentDate)}",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.8)
                          : Colors.black.withOpacity(0.8),
                      // color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Spacings.sm,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCard(
                  title: 'Product Sold',
                  cardColor: Colors.blueGrey,
                  titleTextColor: Colors.white,
                  valueTextColor: Colors.white,
                  value: '574',
                  icon: OctIcons.package_16,
                )
                ,
                CustomCard(
                  title: 'Total Orders',
                  icon: FontAwesomeIcons.listCheck,
                  cardColor: Colors.deepPurpleAccent,
                  titleTextColor: Colors.white,
                  valueTextColor: Colors.white,
                  value: '200',
                  iconSize: 45,
                ),
              ],
            ),
            SizedBox(height: Spacings.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCard(
                  title: 'Earnings',
                  icon: FontAwesomeIcons.indianRupeeSign,
                  // iconColor: Colors.black,
                  iconColor: Colors.redAccent,
                  cardColor: Colors.amber.shade300,
                  titleTextColor: Colors.black,
                  valueTextColor: Colors.black,
                  value: '\$10,000',
                ),
                CustomCard(
                  icon: FontAwesomeIcons.anglesUp,
                  title: 'Profit',
                  cardColor: Colors.lightGreenAccent,
                  iconColor: Colors.green,
                  // iconColor: Colors.black,
                  titleTextColor: Colors.black,
                  valueTextColor: Colors.black,
                  value: '\$1000',
                ),
              ],
            ),
            SizedBox(
              height: Spacings.sm,
            ),
            Divider(),
            SizedBox(
              height: Spacings.sm,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductListScreen()),
                    );
                  },
                  child: OptionCard(
                    text: 'Products',
                    icon: FontAwesomeIcons.list,
                    // borderColor: Colors.blue, // Choose your desired border color
                  ),
                ),
                GestureDetector(
                  onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderListScreen()),
      );
      },
                  child: OptionCard(
                    text: 'Order',
                    icon: FontAwesomeIcons.list,

                    // borderColor: Colors.blue, // Choose your desired border color
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Spacings.ms,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     OptionCard(
            //       text: 'History',
            //       icon: FontAwesomeIcons.rectangleList,
            //     ),
            //     OptionCard(
            //       text: 'Add Product',
            //       icon: FontAwesomeIcons.plus,
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: Spacings.sm,
            // ),
            Divider(),
            SizedBox(
              height: Spacings.xxs,
            ),
            Text(
              "Quick Links",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Spacings.xs,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddOrderPage()),
                  );},
                  child: CustomBoxWidget(
                    iconColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                    titleColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                    iconData: FontAwesomeIcons.plus,
                    title: "Take Order",
                    cardColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Colors.redAccent,
                  ),
                ),
                CustomBoxWidget(
                  iconColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  titleColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  iconData: FontAwesomeIcons.boxesPacking,
                  title: "Products",
                  cardColor: Theme.of(context).brightness == Brightness.dark ?Colors.greenAccent : Colors.redAccent,
                ),
                CustomBoxWidget(
                  iconColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  titleColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  iconData: FontAwesomeIcons.clockRotateLeft,
                  title: "Order History",
                  cardColor: Theme.of(context).brightness == Brightness.dark ?Colors.greenAccent : Colors.redAccent,
                ),
              ],
            ),
            SizedBox(
              height: Spacings.ms,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBoxWidget(
                  iconColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  titleColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  iconData: FontAwesomeIcons.accusoft,
                  title: "Analytics",
                  cardColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Colors.redAccent,
                ),
                CustomBoxWidget(
                  iconColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  titleColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  iconData: FontAwesomeIcons.houseLaptop,
                  title: "Manage Stocks",
                  cardColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Colors.redAccent,
                ),
                CustomBoxWidget(
                  iconColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  titleColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Theme.of(context).primaryColor,
                  iconData: FontAwesomeIcons.truckArrowRight,
                  title: "Manage Status",
                  // cardColor: Colors.greenAccent,
                  cardColor: Theme.of(context).brightness == Brightness.dark ? Colors.greenAccent : Colors.redAccent,
                ),
              ],
            ),
            SizedBox(height: Spacings.md,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Products", style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                Icon(Icons.keyboard_arrow_right,color: Theme.of(context).primaryColor,size: Spacings.lg,)
              ],
            ),
            SizedBox(height: Spacings.sm,),
            // RoundedGradientList(),
          ],
        ),
      ),
    );
  }
}
