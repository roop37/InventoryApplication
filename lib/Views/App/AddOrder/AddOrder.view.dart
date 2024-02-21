import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Views/App/AddOrder/SearchProduct.view.dart';
import 'package:flutter/material.dart';

// Assuming the SearchProductPage import here

class AddOrderPage extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<AddOrderPage> {
  double _totalModifiedMRP = 0.0;
  List<Map<String, dynamic>> cart = [];
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _courierChargesController = TextEditingController();

  void _createOrder() {
    String customerName = _customerNameController.text;
    String address = _addressController.text;
    String courierChargesText = _courierChargesController.text;

    // Check if any of the required fields are empty
    if (customerName.isEmpty || address.isEmpty || courierChargesText.isEmpty) {
      print('Please fill in all the required fields.');
      return;
    }

    // Parse courier charges
    double courierCharges = double.tryParse(courierChargesText) ?? 0;

    // Calculate the cart value
    double cartValue = 0;
    for (var product in cart) {
      double modifiedMrp = double.tryParse(product['modifiedMrp'].toString()) ?? 0;
      int stockQuantity = product['stockQuantity'] ?? 0;
      cartValue += modifiedMrp * stockQuantity;
    }

    // Calculate the total
    double total = _totalModifiedMRP + courierCharges;

    // Print order details
    print('Customer Name: $customerName');
    print('Address: $address');
    print('Total: $total');
    print('Cart Value: $cartValue');
    print('Courier Value: $courierCharges');

    // Print the cart details
    print('Cart:');
    for (var product in cart) {
      print('Product Name: ${product['productName']}');
      print('Modified MRP: ${product['modifiedMrp']}');
      print('Quantity: ${product['stockQuantity']}');

      print('---');
    }
  }




  double calculateTotalModifiedMRP() {
    double totalModifiedMRP = 0.0;
    for (var product in cart) {
      if (product['modifiedMrp'] != null && product['modifiedMrp'].toString() != '') {
        totalModifiedMRP += double.parse(product['modifiedMrp'].toString());
      }

    }
    print("Total Modified MRP: $totalModifiedMRP");
    return totalModifiedMRP;
  }


// Method to update totalModifiedMRP
  void updateTotalModifiedMRP() {
    setState(() {
      double totalModifiedMRP = calculateTotalModifiedMRP();
      double courierCharges = double.tryParse(_courierChargesController.text) ?? 0;
      _totalModifiedMRP = totalModifiedMRP + courierCharges;
    });
  }


  void updateTotalModifiedMRPCourier(double courierCharges) {
    setState(() {
      double totalModifiedMRP = calculateTotalModifiedMRP() + courierCharges;
      _totalModifiedMRP = totalModifiedMRP;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Place Order Details',
          style: TextStyle(color: Theme.of(context).dividerColor),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: _customerNameController,
                        decoration: InputDecoration(
                          labelText: 'Customer Name',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Courier Charges"),
                          SizedBox(
                            height: 40,
                            width: 60, // Add a finite width constraint
                            child: TextField(
                              controller: _courierChargesController,
                              onChanged: (value) {
                                double courierCharges = double.tryParse(value) ?? 0;
                                updateTotalModifiedMRPCourier(courierCharges);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(

                                contentPadding: EdgeInsets.symmetric(horizontal: 3),
                                // labelText: 'Courier Charges',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Total"),
                          Text(
                            // "0",
                            "$_totalModifiedMRP",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(""),
                          ElevatedButton(
                            onPressed: () {
                              _createOrder();
                            },
                            child: Text('Create'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0, bottom: 105.0),
            child: Column(
              children: [

                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length + 1, // Add 1 for the "Add Products" button
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // Return the "Add Products" button
                        return TextButton(
                          onPressed: () async {
                            // Navigate to search product page
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchProductPage(),
                              ),
                            );
                            if (result != null) {
                              // Add selected product to cart
                              setState(() {
                                cart.add({
                                  'productName': result['name'],
                                  'productId': result['id'],
                                  'mrp': result['mrp'],
                                  'modifiedMrp': result['mrp'], // Initialize modifiedMrp with the same value as mrp
                                  'quantity': 0,
                                  'stock': result['stock'],
                                });
                                updateTotalModifiedMRP();
                              });
                            }

                          },
                          child: Text('Add Products'),
                        );
                      }

                      final product = cart[index - 1]; // Subtract 1 to account for the "Add Products" button
                      return Container(
                        padding: EdgeInsets.all(Spacings.sm),
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: Spacings.sm),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5),width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${product['productName']}',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: Spacings.md),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cart.removeAt(index - 1);
                                    });
                                  },
                                  icon: Icon(Icons.delete,color: Colors.redAccent,),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Stock: '),
                                    Text('${product['stock']}',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: Spacings.md),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Quantity: "),
                                    SizedBox(
                                      width: 60,
                                      child: TextFormField(
                                        initialValue: "1",
                                        onChanged: (value) {
                                          setState(() {
                                            print("Quantity changed: $value");
                                            // If the value is empty or null, default the quantity to 1
                                            // Otherwise, parse the value as an integer
                                            product['stockQuantity'] = value.isEmpty ? 1 : int.tryParse(value) ?? 1;
                                          });
                                        },
                                        keyboardType: TextInputType.numberWithOptions(),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 3),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('mrp: '),
                           Text("${product['mrp']}",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: Spacings.md),)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Modified mrp: '),
                                    SizedBox(
                                      width: 60,
                                      child: TextFormField(

                                        initialValue: product['mrp'].toString(),
                                        onChanged: (value) {
                                          setState(() {
                                            product['modifiedMrp'] = value;
                                            updateTotalModifiedMRP(); // Call updateTotalModifiedMRP here to recalculate the total when a modification occurs
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 3), // Remove all padding inside the textfield

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
