import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:flutter/material.dart';

class SearchProductPage extends StatefulWidget {
  @override
  _SearchProductPageState createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  // Dummy product list
  final List<Map<String, dynamic>> dummyProducts = [
    {"name": "Laptop", "stock": 50, "mrp": 1200 , "id":1},
    {"name": "Smartphone", "stock": 100, "mrp": 800, "id":2},
    {"name": "Headphones", "stock": 80, "mrp": 50, "id":3},
    {"name": "Tablet", "stock": 30, "mrp": 300, "id":4},
    {"name": "Smartwatch", "stock": 20, "mrp": 150, "id":5},
    {"name": "Desktop Computer", "stock": 40, "mrp": 1000, "id":6},
    {"name": "Wireless Mouse", "stock": 60, "mrp": 20, "id":7},
    {"name": "External Hard Drive", "stock": 25, "mrp": 200, "id":8},
  ];

  late List<Map<String, dynamic>> filteredProducts;

  @override
  void initState() {
    super.initState();
    // Initialize filtered products with dummyProducts
    filteredProducts = List<Map<String, dynamic>>.from(dummyProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Product',style: TextStyle(color: Theme.of(context).dividerColor),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacings.sm),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filteredProducts = _filterProducts(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ListTile(
                  title: Text(product['name']),
                  subtitle: Text('MRP: ${product['mrp']}, Stock: ${product['stock']}'),
                  onTap: () {
                    // Pass selected product back to the previous screen
                    Navigator.pop(context, product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _filterProducts(String query) {
    // Implement regex-based search
    RegExp regExp = RegExp(query, caseSensitive: false);
    return dummyProducts.where((product) => regExp.hasMatch(product['name'])).toList();
  }

}
