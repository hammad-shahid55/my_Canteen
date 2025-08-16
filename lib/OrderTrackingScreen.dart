import 'package:flutter/material.dart';
import 'package:canteen_final/MenuScreen.dart';
import 'package:canteen_final/OrderSummaryScreen.dart';
import 'package:canteen_final/ContactUsScreen.dart';
import 'package:canteen_final/HomeScreen.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int _selectedIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderSummaryScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactUsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Order Tracking'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(
          152, 251, 152, 1), // Green background color applied to Scaffold
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 5)
              ],
            ),
            child: Column(
              children: [
                // Header (Receipt Title)
                Text(
                  'Order Receipt',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Divider(color: Colors.grey.shade300),

                // Order Status Steps as Receipt Items
                OrderStatusStep(
                  icon: Icons.kitchen,
                  label: 'Preparing',
                  description: 'Your food is being prepared.',
                  status: 'In Progress',
                ),
                OrderStatusStep(
                  icon: Icons.local_dining,
                  label: 'Cooking',
                  description: 'Your food is being cooked.',
                  status: 'In Progress',
                ),
                OrderStatusStep(
                  icon: Icons.delivery_dining,
                  label: 'Out for Delivery',
                  description: 'The delivery is on its way.',
                  status: 'Pending',
                ),

                Divider(color: Colors.grey.shade300),

                // Estimated Time (Total)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Estimated Delivery Time:'),
                      Text(
                        '25 mins',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),

                // Delivery Animation Placeholder
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        // Location Points (Canteen and Your Location) - above delivery icon
                        Positioned(
                          left: 20,
                          top: 10, // Positioned higher above the icon
                          child: Column(
                            children: [
                              SizedBox(height: 8),
                              Icon(Icons.location_on,
                                  color: Colors.red, size: 48),
                              SizedBox(height: 8),
                              Text('Canteen',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16)),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 10, // Positioned higher above the icon
                          child: Column(
                            children: [
                              SizedBox(height: 8),
                              Icon(Icons.location_on,
                                  color: Colors.green, size: 48),
                              SizedBox(height: 8),
                              Text('Your Location',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 16)),
                            ],
                          ),
                        ),
                        // Moving Delivery Icon (above location points)
                        MovingDelivery(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Order Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Track Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: 'Contact Us',
          ),
        ],
      ),
    );
  }
}

class OrderStatusStep extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;
  final String status;

  const OrderStatusStep({
    required this.icon,
    required this.label,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Icon
          Icon(icon, color: Colors.green, size: 32),
          SizedBox(width: 10),
          // Column for status
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 4),
              Text(description,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
              SizedBox(height: 4),
              Text(
                'Status: $status',
                style: TextStyle(
                    fontSize: 14,
                    color:
                        status == 'In Progress' ? Colors.orange : Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MovingDelivery extends StatefulWidget {
  @override
  _MovingDeliveryState createState() => _MovingDeliveryState();
}

class _MovingDeliveryState extends State<MovingDelivery>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 0.6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Calculate position of delivery icon
        double leftPosition = 40 +
            (_animation.value *
                (MediaQuery.of(context).size.width * 0.75 - 40));

        return Positioned(
          left: leftPosition, // Delivery icon moves between the two points
          top: 40, // Positioned below the location points
          child: Icon(
            Icons.delivery_dining_rounded, // Delivery icon
            color: Colors.orangeAccent.shade700,
            size: 64, // Larger icon size for better visibility
          ),
        );
      },
    );
  }
}
