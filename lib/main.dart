import 'package:flutter/material.dart';

void main() => runApp(AliBazaarApp());

class AliBazaarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ali Bazaar',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final products = [
    {"name": "Shalwar Kameez", "price": "Rs. 2500", "emoji": "👘"},
    {"name": "Peshawari Chappal", "price": "Rs. 1800", "emoji": "👞"},
    {"name": "Leather Bag", "price": "Rs. 3200", "emoji": "👜"},
    {"name": "Smart Watch", "price": "Rs. 4500", "emoji": "⌚"},
    {"name": "Perfume", "price": "Rs. 1500", "emoji": "🌸"},
    {"name": "Sunglasses", "price": "Rs. 1200", "emoji": "🕶️"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ali Bazaar - علی بازار', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.orange.shade50,
            child: Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(hintText: 'Search products...', prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white))),
                SizedBox(width: 10),
                Icon(Icons.shopping_cart, size: 30, color: Colors.deepOrange)
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.85, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: products.length,
              itemBuilder: (ctx, i) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(products[i]['emoji']!, style: TextStyle(fontSize: 50)),
                      SizedBox(height: 10),
                      Text(products[i]['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(products[i]['price']!, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      ElevatedButton(onPressed: (){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${products[i]['name']} added to cart!'))); }, child: Text('Add to Cart'), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange))
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: Colors.deepOrange, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ]),
    );
  }
}
