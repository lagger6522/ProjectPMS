import 'package:flutter/material.dart';

class PricePerUnitWidget extends StatelessWidget {
  final double price;

  PricePerUnitWidget({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Price per Unit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          '\$$price',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
