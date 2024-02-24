// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:intl/intl.dart';
//
// class AnalyticsScreen extends StatelessWidget {
//   final List<DailyData> dailyData = [
//     DailyData(date: DateTime(2023, 2, 1), revenue: 5000, profit: 2000, customers: 100),
//     DailyData(date: DateTime(2023, 2, 2), revenue: 4500, profit: 1500, customers: 80),
//     DailyData(date: DateTime(2023, 2, 3), revenue: 5500, profit: 2500, customers: 120),
//   ];
//
//   final List<MonthlyData> monthlyData = [
//     MonthlyData(month: DateTime(2023, 1, 1), revenue: 150000, profit: 50000),
//     MonthlyData(month: DateTime(2023, 2, 1), revenue: 180000, profit: 65000),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Analytics"),
//       ),
//       body: ListView(
//         children: [
//           Card(
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Text("Daily Metrics", style: Theme.of(context).textTheme.headline6),
//
//                   SizedBox(height: 8),
//
//                   SizedBox(
//                     height: 200,
//                     child: LineChart(dailyRevenueSeries),
//                   ),
//
//                   SizedBox(height: 8),
//
//                   SizedBox(
//                       height: 200,
//                       child: BarChart(dailyProfitSeries)
//                   ),
//
//                   SizedBox(height: 8),
//
//                   SizedBox(
//                       height: 200,
//                       child: LineChart(dailyCustomersSeries)
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           Card(
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Text("Monthly Metrics", style: Theme.of(context).textTheme.headline6),
//
//                   SizedBox(height: 8),
//
//                   SizedBox(
//                       height: 200,
//                       child: BarChart(monthlyRevenueSeries)
//                   ),
//
//                   SizedBox(height: 8),
//
//                   SizedBox(
//                       height: 200,
//                       child: BarChart(monthlyProfitSeries)
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   static List<charts.Series<DailyData, String>> dailyRevenueSeries = [
//     charts.Series(
//         id: "Revenue",
//         data: dailyData,
//         domainFn: (DailyData sales, _) => DateFormat.MMMdd().format(sales.date),
//         measureFn: (DailyData sales, _) => sales.revenue
//     )
//   ];
//
//   static List<charts.Series<DailyData, String>> dailyProfitSeries = [
//     charts.Series(
//       id: "Profit",
//       data: dailyData,
//       domainFn: (DailyData sales, _) => DateFormat.MMMdd().format(sales.date),
//       measureFn: (DailyData sales, _) => sales.profit,
//     )
//   ];
//
//   static List<charts.Series<DailyData, String>> dailyCustomersSeries = [
//     charts.Series(
//       id: "Customers",
//       data: dailyData,
//       domainFn: (DailyData sales, _) => DateFormat.MMMdd().format(sales.date),
//       measureFn: (DailyData sales, _) => sales.customers,
//     )
//   ];
//
//   static List<charts.Series<MonthlyData, String>> monthlyRevenueSeries = [
//     charts.Series(
//       id: "Revenue",
//       data: monthlyData,
//       domainFn: (MonthlyData sales, _) => DateFormat.yMMM().format(sales.month),
//       measureFn: (MonthlyData sales, _) => sales.revenue,
//     )
//   ];
//
//   static List<charts.Series<MonthlyData, String>> monthlyProfitSeries = [
//     charts.Series(
//       id: "Profit",
//       data: monthlyData,
//       domainFn: (MonthlyData sales, _) => DateFormat.yMMM().format(sales.month),
//       measureFn: (MonthlyData sales, _) => sales.profit,
//     )
//   ];
// }
//
// class DailyData {
//   final DateTime date;
//   final int revenue;
//   final int profit;
//   final int customers;
//
//   DailyData({
//     required this.date,
//     required this.revenue,
//     required this.profit,
//     required this.customers
//   });
// }
//
// class MonthlyData {
//   final DateTime month;
//   final int revenue;
//   final int profit;
//
//   MonthlyData({
//     required this.month,
//     required this.revenue,
//     required this.profit
//   });
// }