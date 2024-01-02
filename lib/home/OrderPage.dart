import 'package:flutter/material.dart';

class Order {
  final String itemName;
  final int quantity;
  final double price;

  Order({
    required this.itemName,
    required this.quantity,
    required this.price,
  });
}

class OrderPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrderPage> {
  List<Order> orders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return _buildOrderItem(order, index);
                },
              ),
            ),
            _buildTotalPrice(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Возвращаемся на предыдущую страницу
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Order order, int index) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(order.itemName),
        subtitle: Text('Quantity: ${order.quantity} - \$${order.price}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeOrder(index);
          },
        ),
      ),
    );
  }

  Widget _buildTotalPrice() {
    double totalPrice = orders.fold(0, (sum, order) => sum + (order.quantity * order.price));

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text('Total Price'),
        subtitle: Text('\$${totalPrice.toStringAsFixed(2)}'),
      ),
    );
  }

  void addOrder(Order order) {
    setState(() {
      orders.add(order);
    });
  }

  void _removeOrder(int index) {
    setState(() {
      orders.removeAt(index);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderPage(),
  ));
}
