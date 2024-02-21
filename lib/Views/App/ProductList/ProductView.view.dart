import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Map<String, dynamic>> products = [
    {'id': '1', 'name': 'Smartphone', 'price': 500},
    {'id': '2', 'name': 'Laptop', 'price': 1000},
    {'id': '3', 'name': 'Headphones', 'price': 50},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(color: Theme.of(context).dividerColor)),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${products[index]['name']}'),
            subtitle: Text('Price: \$${products[index]['price']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editProduct(context, products[index]);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteProduct(index);
                  },
                ),
              ],
            ),
            onTap: () {
              _showProductDetails(products[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic here to handle the tap on the floating button
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showProductDetails(Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Product Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${product['name']}'),
              Text('Price: \$${product['price']}'),
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
  }

  void _editProduct(BuildContext context, Map<String, dynamic> product) {
    TextEditingController nameController = TextEditingController(text: product['name']);
    TextEditingController priceController = TextEditingController(text: product['price'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save edited product here
                final editedProduct = {
                  'name': nameController.text,
                  'price': double.parse(priceController.text),
                };
                _saveEditedProduct(product, editedProduct);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveEditedProduct(Map<String, dynamic> oldProduct, Map<String, dynamic> editedProduct) {
    setState(() {
      // Replace the old product with the edited product
      int index = products.indexOf(oldProduct);
      products[index] = editedProduct;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      // Remove the product at the specified index
      products.removeAt(index);
    });
  }
}
