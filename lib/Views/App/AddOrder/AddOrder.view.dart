import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Views/App/AddOrder/SearchProduct.view.dart';
import 'package:flutter/material.dart';

// Assuming the SearchProductPage import here

class AddOrderPage extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<AddOrderPage> {
  List<Map<String, dynamic>> cart = [];
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _courierChargesController = TextEditingController();

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
                            width: 100, // Add a finite width constraint
                            child: TextField(
                              controller: _courierChargesController,
                              decoration: InputDecoration(
                                labelText: 'Courier Charges',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Total"),
                          Text(
                            "3000",
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
                              // Add button functionality
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
                                  'productName': result['name'], // Access 'name' property correctly
                                  'productId': result['id'], // Access 'id' property correctly
                                  'mrp': result['mrp'],
                                  'modifiedMrp': '',
                                  'quantity': 0,
                                  'stock':result['stock']
                                });
                                print(cart); // Print the cart
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
                                            product['stockQuantity'] = int.tryParse(value) ?? 0;
                                          });
                                        },
                                        keyboardType: TextInputType.numberWithOptions(),
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
