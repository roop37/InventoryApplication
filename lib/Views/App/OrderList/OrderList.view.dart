import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:flutter/material.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Map<String, dynamic>> orders = [
    {
      'orderNumber': '12345',
      'customerName': 'John Doe',
      'address': '123 Main St, City',
      'product': 'Smartphone',
      'quantity': 2,
      'status': 'Order placed',
    },
    {
      'orderNumber': '54321',
      'customerName': 'Jane Smith',
      'address': '456 Elm St, Town',
      'product': 'Laptop',
      'quantity': 1,
      'status': 'In transit',
    },
    {
      'orderNumber': '98765',
      'customerName': 'Alice Johnson',
      'address': '789 Oak St, Village',
      'product': 'Headphones',
      'quantity': 3,
      'status': 'Out for delivery',
    },
  ];

  List<String> statusOptions = ['Order placed', 'In transit', 'Out for delivery', 'Delivered'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(color: Theme.of(context).dividerColor),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${orders[index]['product']}'),
                Text('Quantity: ${orders[index]['quantity']}'),
                Text('Customer: ${orders[index]['customerName']}'),
              ],
            ),
            subtitle: Text('Status: ${orders[index]['status']}'),
            onTap: () {
              _showOrderDetails(orders[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.orangeAccent.withOpacity(0.7),
        onPressed: () {
          // Add your logic here to handle the tap on the floating button
        },
        child: Icon(Icons.add,size: Spacings.lg,),
      ),
    );
  }

  void _showOrderDetails(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Order Details'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Order Number: ${order['orderNumber']}'),
                  Text('Product: ${order['product']}'),
                  Text('Quantity: ${order['quantity']}'),
                  Text('Customer: ${order['customerName']}'),
                  Text('Address: ${order['address']}'),
                  // DropdownButtonFormField(
                  //   value: order['status'],
                  //   items: statusOptions.map((status) {
                  //     return DropdownMenuItem(
                  //       value: status,
                  //       child: Text(status),
                  //     );
                  //   }).toList(),
                  //
                  // ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
