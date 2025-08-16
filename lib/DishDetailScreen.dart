import 'package:flutter/material.dart';

import 'OrderSummaryScreen.dart';

class DishDetailScreen extends StatelessWidget {
  final Map<String, dynamic> dish; // Pass dish data as a Map

  DishDetailScreen({required this.dish});

  @override
  Widget build(BuildContext context) {
    var decorationImage = DecorationImage(
      image: AssetImage('assets/dishes/${dish['image']}'), // Use asset image
      fit: BoxFit.cover,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(dish['name']), // Use dish name from data
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
            children: [
              // Dish Image
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: decorationImage,
                ),
              ),
              SizedBox(height: 16),

              // Dish Name
              Text(
                dish['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Description
              Text(
                dish['des'], // Updated key to match the provided data
                textAlign:
                    TextAlign.justify, // Justify text for better readability
              ),
              SizedBox(height: 16),

              // Price
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '₨ ${dish['price']}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Centered Add to Cart Button
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the button
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dish added to cart!')),
                      );

                      // Navigate to Order Summary Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSummaryScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
