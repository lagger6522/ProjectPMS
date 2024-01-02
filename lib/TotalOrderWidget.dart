import 'package:flutter/material.dart';

class TotalOrderWidget extends StatelessWidget {
  final int countOfCocktail;
  final double price;

  TotalOrderWidget({
    required this.countOfCocktail,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = countOfCocktail * price;

    return Column(
      children: [
        Text(
          'Total Price',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Row(
          children: [            
            Text(
              'Total Price: \$$totalPrice',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
