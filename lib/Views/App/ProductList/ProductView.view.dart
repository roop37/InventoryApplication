import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Map<String, dynamic>> products = [
    {'id': '1', 'name': 'Smartphone', 'price': 500, 'stock': 24},
    {'id': '2', 'name': 'Laptop', 'price': 1000, 'stock': 24},
    {'id': '3', 'name': 'Headphones', 'price': 50, 'stock': 24},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products',
            style: TextStyle(color: Theme.of(context).dividerColor)),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${products[index]['name']}'),
            subtitle: Row(
              children: [
                Text('Price: \$${products[index]['price']}'),
                SizedBox(
                  width: Spacings.sm,
                ),
                Text('Stock:${products[index]['stock']}')
              ],
            ),
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
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.orangeAccent.withOpacity(0.7),

        
        onPressed: () {
          _addNewProduct(context);
        },
        // onPressed: () {
        //   _addNewProduct(context);
        // },
        child: Icon(Icons.add,size: Spacings.lg,),
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
    TextEditingController nameController =
        TextEditingController(text: product['name']);
    TextEditingController stockController =
        TextEditingController(text: product['stock'].toString());
    TextEditingController priceController =
        TextEditingController(text: product['price'].toString());

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
              SizedBox(
                height: Spacings.sm,
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              SizedBox(
                height: Spacings.sm,
              ),
              TextField(
                controller: stockController,
                decoration: InputDecoration(labelText: 'stock'),
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
                  'stock': double.parse(stockController.text),
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

  void _saveEditedProduct(
      Map<String, dynamic> oldProduct, Map<String, dynamic> editedProduct) {
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

  void _addNewProduct(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController stockController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Product'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              SizedBox(
                height: Spacings.sm,
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              SizedBox(
                height: Spacings.sm,
              ),
              TextField(
                controller: stockController,
                decoration: InputDecoration(labelText: 'Stock'),
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
                // Add new product logic here
                final newProduct = {
                  'name': nameController.text,
                  'price': double.parse(priceController.text),
                  'stock': double.parse(stockController.text),
                };
                _addProduct(newProduct);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addProduct(Map<String, dynamic> newProduct) {
    setState(() {
      products.add(newProduct);
    });
  }
}
