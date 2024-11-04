import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        // Center the body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column
            children: <Widget>[
              Image.network(
                product.imageUrl,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16), // Add spacing between elements
              Text(product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8), // Add spacing between elements
              Text('\Rp. ${product.price}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8), // Add spacing between elements
              Text(product.description),
              SizedBox(height: 16), // Add spacing between elements
              ElevatedButton(
                onPressed: () {
                  // Add to cart logic here
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
