import 'package:flutter/material.dart';
import './detailproduct.dart';
import './product.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My App',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Mouse Gaming G502',
      price: '250.000',
      imageUrl:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
      description:
          'Mouse Gaming G502 yang memiliki performa tinggi dan kualitas tinggi.',
    ),
    Product(
      id: 2,
      name: 'Keyboard MX Mechanical',
      price: '450.000',
      imageUrl:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
      description:
          'Keyboard MX Mechanical yang memiliki performa tinggi dan kualitas tinggi.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product),
                ),
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    product.imageUrl,
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  Text(product.name),
                  Text('\Rp. ${product.price}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
